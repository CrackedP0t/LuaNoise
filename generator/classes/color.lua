local util = require("generator.util")

return {
	prefix = "utils",
	name = "Color",
	filename = "color",
	constructorargs = util.construct("integer", "integer", "integer", "integer"),
	methods = {},
	attributes = {
		{
			name = "alpha",
			luatype = "integer"
		},
		{
			name = "blue",
			luatype = "integer"
		},
		{
			name = "green",
			luatype = "integer"
		},
		{
			name = "red",
			luatype = "integer"
		}
	}
}
