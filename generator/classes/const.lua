local util = require("generator.util")

return {
	inherits = "Module",
	name = "Const",
	filename = "const",
	constructorargs = util.construct(),
	methods = {
		util.set("SetConstValue", "number")
	}
}
