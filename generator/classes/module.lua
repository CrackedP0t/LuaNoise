local util = require("generator.util")

return {
	abstract = true,
	prefix = "module",
	name = "Module",
	filename = "module",
	constructorargs = util.construct(),
	methods = {
		{
			name = "GetSourceModule",
			args = {
				{
					luatype = "integer"
				}
			},
			ret = {
				doesRet = true,
				classname = "Module"
			}
		},
		util.get("GetSourceModuleCount", "integer"),
		util.get("GetValue", "number", "number", "number", "number"),
		{
			name = "SetSourceModule",
			args = {
				{
					luatype = "number"
				},
				{
					classname = "Module"
				}
			},
			ret = {
				doesRet = false
			}
		}
	}
}
