local util = require("generator.util")

return {
	inherits = "Module",
	name = "Blend",
	filename = "blend",
	constructorargs = util.construct(),
	methods = {
		util.getClass("GetControlModule", "Module"),
		util.setClass("SetControlModule", "Module")
	}
}
