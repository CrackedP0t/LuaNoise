local util = require("generator.util")

return {
	name = "GradientColor",
	filename = "gradient_color",
	constructorargs = util.construct(),
	methods = {
		{
			name = "AddGradientPoint",
			args = {
				{
					luatype = "number"
				},
				{
					classname = "Color"
				}
			},
			ret = {
				doesRet = false
			}
		},
		util.blank("Clear"),
		{
			name = "GetColor",
			args = {
				{
					luatype = "number"
				},
			},
			ret = {
				doesRet = true,
				classname = "Color"
			}
		},
		util.get("GetGradientPointCount", "integer")
	}
}
