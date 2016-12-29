local util = require("generator.util")

return {
	inherits = "NoiseMapBuilder",
	name = "NoiseMapBuilderPlane",
	filename = "noise_map_builder_plane",
	constructorargs = util.construct(),
	methods = {
		util.set("EnableSeamless", "boolean"),
		util.get("GetLowerXBound", "number"),
		util.get("GetLowerZBound", "number"),
		util.get("GetUpperXBound", "number"),
		util.get("GetUpperZBound", "number"),
		util.get("IsSeamlessEnabled", "boolean"),
		util.set("SetBounds", "number", "number", "number", "number")
	}
}
