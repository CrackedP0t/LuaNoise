local util = require("generator.util")

return {
	inherits = "NoiseMapBuilder",
	name = "NoiseMapBuilderSphere",
	filename = "noise_map_builder_sphere",
	constructorargs = util.construct(),
	methods = {
		util.get("GetEastLonBound", "number"),
		util.get("GetNorthLatBound", "number"),
		util.get("GetSouthLatBound", "number"),
		util.get("GetWestLonBound", "number"),
		util.set("SetBounds", "number", "number", "number", "number")
	}
}
