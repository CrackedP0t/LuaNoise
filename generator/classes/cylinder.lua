local util = require("generator.util")

return {
	name = "Cylinder",
	filename = "cylinder",
	constructorargs = util.construct(),
	methods = {
		util.getClass("GetModule", "Module"),
		util.setClass("SetModule", "Module")
	}
}
