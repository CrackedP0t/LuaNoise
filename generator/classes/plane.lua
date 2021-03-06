local util = require("generator.util")

return {
	name = "Plane",
	filename = "plane",
	constructorargs = util.construct(),
	methods = {
		util.getClass("GetModule", "Module"),
		util.get("GetValue", "number", "number", "number"),
		util.setClass("SetModule", "Module")
	}
}
