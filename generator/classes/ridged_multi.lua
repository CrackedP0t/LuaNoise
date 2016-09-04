local util = require("generator.util")

return {
	inherits = "Module",
	prefix = "module",
	name = "RidgedMulti",
	filename = "ridged_multi",
	constructorargs = util.construct(),
	methods = {
		util.get("GetFrequency", "number"),
		util.get("GetLacunarity", "number"),
		util.getEnum("GetNoiseQuality", "NoiseQuality"),
		util.get("GetOctaveCount", "integer"),
		util.get("GetSeed", "integer"),
		util.set("SetFrequency", "number"),
		util.set("SetLacunarity", "number"),
		util.setEnum("SetNoiseQuality", "NoiseQuality"),
		util.set("SetOctaveCount", "integer"),
		util.set("SetSeed", "integer")
	}
}
