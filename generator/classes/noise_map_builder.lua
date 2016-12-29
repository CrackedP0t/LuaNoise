local util = require("generator.util")

return {
	abstract = true,
	name = "NoiseMapBuilder",
	filename = "noise_map_builder",
	constructorargs = util.construct(),
	methods = {
		util.blank("Build"),
		util.get("GetDestHeight", "integer"),
		util.get("GetDestWidth", "integer"),
		util.setClass("SetDestNoiseMap", "NoiseMap"),
		util.set("SetDestSize", "integer", "integer"),
		util.setClass("SetSourceModule", "Module")
		-- {
		-- 	name = "SetSourceModule",
		-- 	ret = {
		-- 		doesRet = false
		-- 	},
		-- 	args = {
		-- 		{\
		-- 			luatype = "integer"
		-- 		},
		-- 		{
		-- 			classname = "Module"
		-- 		}
		-- 	}
		-- }
	}
}
