local scandir = function(directory)
    local i, t, popen = 0, {}, io.popen
    for filename in popen('ls "'..directory..'"'):lines() do
        i = i + 1
        t[i] = filename
    end
    return t
end

local classesDir = "generator/classes/"
local enumsDir = "generator/enums/"

local includeDir = "include/"
local srcDir = "src/"

local noisePath = srcDir .. "noise_gen.cpp"

local classesDict = {}
local baseClasses = {}

local classes = {}
local enums = {}

for i, v in ipairs(scandir(classesDir)) do
    if v:match(".-%.lua$") then
        local class = loadfile(classesDir .. v)()
        table.insert(classes, class)
        classesDict[class.name] = class
    end
end

for i, v in ipairs(scandir(enumsDir)) do
    if v:match(".-%.lua$") then
        table.insert(enums, loadfile(enumsDir .. v)())
    end
end

local includes = ""
local regpairs = ""

local toEnums = ""
local toStrings = ""

for enumI, enum in ipairs(enums) do
    local enumIfs = ""
    for i, v in ipairs(enum) do
        local ifTemplate = [[	if (strcmp("$luaname", name) == 0) {
		return $cname;
	}
]]
        ifTemplate = ifTemplate:gsub("$luaname", v.luaname)
            :gsub("$cname", v.cname)
        enumIfs = enumIfs .. ifTemplate
    end

    local toEnum = [[static $enumname string_to_$enumname(const char * name) {
$ifs;
}
]]
    toEnum = toEnum:gsub("$enumname", enum.name)
        :gsub("$ifs", enumIfs)

    toEnums = toEnums .. toEnum

    local stringIfs = ""
    for i, v in ipairs(enum) do
        local ifTemplate = [[	if (name == $cname) {
		return "$luaname";
	}
]]
        ifTemplate = ifTemplate:gsub("$luaname", v.luaname)
            :gsub("$cname", v.cname)
        stringIfs = stringIfs .. ifTemplate
    end
    
    local toString = [[static const char * $enumname_to_string($enumname name) {
$ifs}
]]

    toString = toString:gsub("$enumname", enum.name)
        :gsub("$ifs", stringIfs)

    toStrings = toStrings .. toString
end

for classI, class in ipairs(classes) do
    if class.inherits then
        baseClasses[class.inherits] = baseClasses[class.inherits] or {}
        table.insert(baseClasses[class.inherits], class)
    end
end

for classI, class in ipairs(classes) do 
    if class.inherits then
        for i, v in ipairs(classesDict[class.inherits].methods) do
            table.insert(class.methods, v)
        end
    end
    
    if not class.abstract then
        local iAttrIfs = ""
        local niAttrIfs = ""
        if class.attributes then
            for attrI, attr in ipairs(class.attributes) do
                local iIfTemplate = [[	if (strcmp(name, "$attrname") == 0) {
		lua_push$attrtype(L, o->$attrname);
printf("C: %%i\n", o->$attrname);
	} else ]]
                iIfTemplate = iIfTemplate:gsub("$attrname", attr.name)
                    :gsub("$attrtype", attr.luatype)

                iAttrIfs = iAttrIfs .. iIfTemplate

                local niIfTemplate = [[	if (strcmp(name, "$attrname") == 0) {
		o->$attrname = luaL_check$attrtype(L, 3);
	}
]]
                niIfTemplate = niIfTemplate:gsub("$attrname", attr.name)
                    :gsub("$attrtype", attr.luatype)
                niAttrIfs = niAttrIfs .. niIfTemplate
            end
        end
        
        local hppFile = [[#include <noise/noise.h>
#include <lua5.1/lua.hpp>

#include "noiseutils.h"

#pragma once

void noise_metatable_$classname(lua_State * L);

int noise_$prefix_$classname(lua_State * L);
]]

            hppFile = hppFile:gsub("$prefix", class.prefix)
            :gsub("$classname", class.name)
        
        local cppFile = [[#include "everything_gen.hpp"
#include <cstring>
#include <string>
#include <typeinfo>

using namespace noise;
using namespace noise::module;
using namespace noise::utils;
using namespace noise::model;

template<typename T> static const T* rvalue_address(const T& in) {
	return &in;
}

static luaL_Reg methods [] = {
$methodreg	{NULL, NULL}
};

$toenums
$tostrings

static int index_mm(lua_State * L) {
	void * u = luaL_checkudata(L, 1, "noise.$classname");
	luaL_argcheck(L, u != NULL, 1, "$classname expected");
	$classname * o = *($classname **)u;

	const char * name = lua_tostring(L, -1);
$iattrifs
	{
		lua_newtable(L);
		luaL_register(L, NULL, methods);
		lua_pushstring(L, name);
		lua_gettable(L, -2);
	}

	return 1;
}
static int newindex_mm(lua_State * L) {
	void * u = luaL_checkudata(L, 1, "noise.$classname");
	luaL_argcheck(L, u != NULL, 1, "$classname expected");
	$classname * o = *($classname **)u;

	const char * name = lua_tostring(L, 2);

$niattrifs
	return 0;
}
static int gc_mm(lua_State * L) {
	void * u = luaL_checkudata(L, 1, "noise.$classname");
	luaL_argcheck(L, u != NULL, 1, "$classname expected");
	$classname * o = *($classname **)u;

	delete o;
}

void noise_metatable_$classname(lua_State * L) {
	luaL_getmetatable(L, "noise.$classname");
	lua_setmetatable(L, -2);
}

int noise_$prefix_$classname(lua_State * L) {
	luaL_newmetatable(L, "noise.$classname");

	lua_pushstring(L, "__index");
	lua_pushcfunction(L, index_mm);
	lua_settable(L, -3);

	lua_pushstring(L, "__newindex");
	lua_pushcfunction(L, newindex_mm);
	lua_settable(L, -3);

	lua_pushstring(L, "__gc");
	lua_pushcfunction(L, gc_mm);
	lua_settable(L, -3);

	$classname * o = new $classname($constructorargs);

	*(void **)lua_newuserdata(L, sizeof(void *)) = o;

	noise_metatable_$classname(L);

	return 1;
}]]

        local constructorargs = ""
        
        for argI, arg in ipairs(class.constructorargs) do
            local argTemplate = "luaL_check$argluatype(L, $argindex), "
            argTemplate = argTemplate:gsub("$argluatype", arg.luatype)
                :gsub("$argindex", argI)

            constructorargs = constructorargs .. argTemplate
        end

        constructorargs = constructorargs:sub(1, -3)

        cppFile = cppFile:gsub("$filename", class.filename)
            :gsub("$toenums", toEnums)
            :gsub("$tostrings", toStrings)
            :gsub("$iattrifs", iAttrIfs)
            :gsub("$niattrifs", niAttrIfs)
            :gsub("$prefix", class.prefix)
            :gsub("$classname", class.name)
            :gsub("$constructorargs", constructorargs)

        local constpair = [[	{"$classname", noise_$prefix_$classname},
]]
        constpair = constpair:gsub("$classname", class.name)
            :gsub("$prefix", class.prefix)

        regpairs = regpairs .. constpair

        local methodreg = [[]]
        
        for methodI, method in ipairs(class.methods) do
            local args = ""

            for argI, arg in ipairs(method.args) do
                local checktype
                if arg.luatype == "boolean" then
                    checktype = "lua_toboolean(L, $argindex)"
                elseif arg.luatype == "string" then
                    checktype = "std::string(luaL_checkstring(L, $argindex))"
                elseif arg.enumname then
                    checktype = "luaL_checkstring(L, $argindex)"
                elseif arg.classname then
                    checktype = "**($argclassname **)lua_touserdata(L, $argindex)"
                    checktype = checktype:gsub("$argclassname", arg.classname)
                elseif arg.classpname then
                    checktype = "*($argclasspname **)lua_touserdata(L, $argindex)"
                    checktype = checktype:gsub("$argclasspname", arg.classpname)
                else
                    checktype = "luaL_check$argluatype(L, $argindex)"
                    checktype = checktype:gsub("$argluatype", arg.luatype)
                end

                local argTemplate
                
                if not arg.enumname then
                    argTemplate = "$checktype, "
                else
                    argTemplate = "string_to_$argenumname($checktype), "
                    argTemplate = argTemplate:gsub("$argenumname", tostring(arg.enumname))
                end

                argTemplate = argTemplate:gsub("$checktype", checktype)                    :gsub("$argindex", argI + 1)

                args = args .. argTemplate
            end

            args = args:sub(1, -3)

            local ret
            
            if method.ret.doesRet then
                if method.ret.luatype == "string" then
                    ret = "\tlua_pushstring(L, o->$methodname($methodargs).c_str());"
                elseif method.ret.enumname then
                    ret = "\tlua_pushstring(L, $methodenumname_to_string(o->$methodname($methodargs)));\n\n"
                elseif method.ret.classname then
                    ret = [[	const $retclassname * r = rvalue_address<$retclassname>(o->$methodname($methodargs));
	*(const void **)lua_newuserdata(L, sizeof(void *)) = r;
]]
                    if not baseClasses[method.ret.classname] then
                        ret = ret .. "noise_metatable_$retclassname(L);"
                    end
                    ret = ret:gsub("$retclassname", method.ret.classname)
                else
                    ret = "\tlua_push$retluatype(L, o->$methodname($methodargs));\n\n" 
                end
                ret = ret:gsub("$retluatype", tostring(method.ret.luatype))
                    :gsub("$methodenumname", tostring(method.ret.enumname))
            else
                ret = "\to->$methodname($methodargs);\n\n"
            end

            ret = ret:gsub("$methodname", method.name)
                :gsub("$methodargs", args)

            local defineTemplate = "\n\nint noise_$prefix_$name_$methodname(lua_State * L)"

            defineTemplate = defineTemplate:gsub("$prefix", class.prefix)
                :gsub("$name", class.name)
                :gsub("$methodname", method.name)
            
            local methodTemplate = defineTemplate .. [[ {
	void * u = luaL_checkudata(L, 1, "noise.$classname");
	luaL_argcheck(L, u != NULL, 1, "$classname expected");
	$classname * o = *($classname **)u;

$ret	return $numret;
}]]
            
            methodTemplate = methodTemplate:gsub("$classname", class.name)
                :gsub("$args", args)
                :gsub("$ret", ret)
                :gsub("$numret", method.ret.doesRet and 1 or 0)

            cppFile = cppFile .. methodTemplate
            hppFile = hppFile .. defineTemplate .. ";"

            local regpair = [[	{"$methodname", noise_$prefix_$classname_$methodname},
]]
            regpair = regpair:gsub("$classname", class.name)
                :gsub("$methodname", method.name)
                :gsub("$prefix", class.prefix)

            methodreg = methodreg .. regpair
	end

	cppFile = cppFile:gsub("$methodreg", methodreg)

	local cppHook = io.open(srcDir .. class.filename .. "_gen.cpp", "w")
	local hppHook = io.open(includeDir .. class.filename .. "_gen.hpp", "w")
	
	cppHook:write(cppFile)
	hppHook:write(hppFile)

	cppHook:close()
	hppHook:close()

	local include = [[#include "$filename_gen.hpp"
]]
        include = include:gsub("$filename", class.filename)

        includes = includes .. include
    end
end

local everythingHook = io.open("include/everything_gen.hpp", "w")
everythingHook:write(includes)
everythingHook:close()

local noiseFile = [[#include <lua5.1/lua.hpp>

#include "everything_gen.hpp"

static const struct luaL_Reg noisereg [] = {
$regpairs	{NULL, NULL}
};

extern "C" {
int luaopen_noise(lua_State * L) {
	luaL_register(L, "noise", noisereg);
	return 1;
}
}]]

noiseFile = noiseFile:gsub("$regpairs", regpairs)

local noiseHook = io.open(noisePath, "w")
noiseHook:write(noiseFile)
noiseHook:close()
