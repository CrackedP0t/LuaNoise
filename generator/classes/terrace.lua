local util = require("generator.util")

return {
	inherits = "Module",
	prefix = "modules",
	name = "Terrace",
	filename = "terraces",
	constructorargs = util.construct(),
	methods = {
		util.set("AddControlPoint", "number"),
		util.blank("ClearAllControlPoints"),
		util.get("GetControlPointCount", "number"),
		util.set("InvertTerraces", "boolean"),
		util.get("IsTerracesInverted", "boolean"),
		util.set("MakeControlPoints", "number")
	}
}
