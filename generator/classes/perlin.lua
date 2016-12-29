local util = require("generator.util")

return {
	inherits = "Module",
	name = "Perlin",
	filename = "perlin",
	constructorargs = {},
	methods = {
		util.get("GetFrequency", "number"),
		util.get("GetLacunarity", "number"),
		util.get("GetOctaveCount", "integer"),
		util.getEnum("GetNoiseQuality", "NoiseQuality"),
		util.get("GetPersistence", "number"),
		util.get("GetSeed", "integer"),
		util.set("SetFrequency", "number"),
		util.set("SetLacunarity", "number"),
		util.set("SetOctaveCount", "integer"),
		util.setEnum("SetNoiseQuality", "NoiseQuality"),
		util.set("SetPersistence", "number"),
		util.set("SetSeed", "integer")
	}
}
