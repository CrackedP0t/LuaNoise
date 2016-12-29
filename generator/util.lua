local util = {}

util.construct = function(...)
	local ret = {}
	for i, v in ipairs({...}) do
		table.insert(ret, {
						 luatype = v
		})
	end
	return ret
end

util.blank = function(name)
	return {
		name = name,
		args = {},
		ret = {}
	}
end

util.set = function(name, ...)
	local ret = {
			name = name,
			args = {},
			ret = {
				doesRet = false
			}
	}
	for i, v in ipairs({...}) do
		table.insert(ret.args, {
					luatype = v
		})
	end
	return ret
end

util.get = function(name, rettype, ...)
	local ret = {
			name = name,
			args = {},
			ret = {
				doesRet = true,
				luatype = rettype
			}
	}
	for i, v in ipairs({...}) do
		table.insert(ret.args, {
					luatype = v
		})
	end
	return ret
end

util.setEnum = function(name, ...)
	local ret = {
			name = name,
			args = {},
			ret = {
				doesRet = false
			}
	}
	for i, v in ipairs({...}) do
		table.insert(ret.args, {
						 enumname = v
		})
	end
	return ret
end

util.getEnum = function(name, retname, ...)
	local ret = {
		name = name,
		args = {},
		ret = {
			doesRet = true,
			enumname = retname
		}
	}
	for i, v in ipairs({...}) do
		table.insert(ret.args, {
						 enumname = v
		})
	end
	return ret
end

util.setClass = function(name, ...)
	local ret = {
		name = name,
		args = {},
		ret = {
			doesRet = false
		}
	}
	for i, v in ipairs({...}) do
		table.insert(ret.args, {
						 classname = v
		})
	end
	return ret
end

util.getClass = function(name, retname, ...)
	local ret = {
		name = name,
		args = {},
		ret = {
			doesRet = true,
			classname = retname
		}
	}
	for i, v in ipairs({...}) do
		table.insert(ret.args, {
						 classname = v
		})
	end
	return ret
end
	
util.setClassP = function(name, ...)
	local ret = {
		name = name,
		args = {},
		ret = {
			doesRet = false
		}
	}
	for i, v in ipairs({...}) do
		table.insert(ret.args, {
						 classpname = v
		})
	end
	return ret
end

util.getClass = function(name, retname, ...)
	local ret = {
		name = name,
		args = {},
		ret = {
			doesRet = true,
			classname = retname
		}
	}
	for i, v in ipairs({...}) do
		table.insert(ret.args, {
						 classpname = v
		})
	end
	return ret
end

return util
