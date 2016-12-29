local util = require("generator.util")

return {
	inherits = "NoiseMapBuilder",
	name = "NoiseMapBuilderCylinder",
	filename = "noise_map_builder_cylinder",
	constructorargs = util.construct(),
	methods = {
		util.get("GetLowerAngleBound", "number"),
		util.get("GetLowerHeightBound", "number"),
		util.get("GetUpperAngleBound", "number"),
		util.get("GetUpperHeightBound", "number"),
		util.set("SetBounds", "number", "number", "number", "number")
	}
}
