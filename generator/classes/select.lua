local util = require("generator.util")

return {
	inherits = "Module",
	name = "Select",
	filename = "select",
	constructorargs = util.construct(),
	methods = {
		util.getClass("GetControlModule", "Module"),
		util.get("GetEdgeFalloff", "number"),
		util.get("GetLowerBound", "number"),
		util.get("GetUpperBound", "number"),
		util.set("SetBounds", "number", "number"),
		util.setClass("SetControlModule", "Module"),
		util.set("SetEdgeFalloff", "number")
	}
}
