local util = require("generator.util")

return {
	inherits = "Module",
	prefix = "module",
	name = "Const",
	filename = "const",
	constructorargs = util.construct(),
	methods = {
		util.set("SetConstValue", "number")
	}
}
