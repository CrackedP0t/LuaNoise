local util = require("generator.util")

return {
	prefix = "utils",
	name = "Image",
	filename = "image",
	constructorargs = util.construct(),
	methods = {
		util.setClass("Clear", "Color"),
		util.getClass("GetBorderValue", "Color"),
		util.get("GetHeight", "integer"),
		util.get("GetMemUsed", "integer"),
		util.get("GetStride", "integer"),
		util.get("GetWidth", "integer"),
		{
			name = "GetValue",
			args = {
				{
					luatype = "integer",
				},
				{
					luatype = "integer"
				}
			},
			ret = {
				doesRet = true,
				classname = "Color"
			}
		},
		util.blank("ReclaimMem"),
		util.setClass("SetBorderValue", "Color"),
		util.set("SetSize", "integer", "integer"),
		{
			name = "SetValue",
			args = {
				{
					luatype = "integer",
				},
				{
					luatype = "integer",
				},
				{
					classname = "Color"
				}
			},
			ret = {
				doesRet = false
			}
		},
		util.setClass("TakeOwnership", "Image")
	}
}
