local util = require("generator.util")

return {
	inherits = "Module",
	name = "Curve",
	filename = "curve",
	constructorargs = util.construct(),
	methods = {
		util.set("AddControlPoint", "number", "number"),
		util.blank("ClearAllControlPoints"),
		util.get("GetControlPointCount", "integer")
	}
}
