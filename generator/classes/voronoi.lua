local util = require("generator.util")

return {
	inherits = "Module",
	name = "Voronoi",
	filename = "voronoi",
	constructorargs = util.construct(),
	methods = {
		util.set("EnableDistance", "boolean"),
		util.get("GetDisplacement", "number"),
		util.get("GetFrequency", "number"),
		util.get("GetSeed", "integer"),
		util.get("IsDistanceEnabled", "boolean"),
		util.set("SetDisplacement", "number"),
		util.set("SetFrequency", "number"),
		util.set("SetSeed", "integer")
	}
}
