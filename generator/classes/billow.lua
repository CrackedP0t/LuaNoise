local util = require("generator.util")

return {
	inherits = "Module",
	prefix = "modules",
	name = "Billow",
	filename = "billow",
	constructorargs = util.construct(),
	methods = {
		util.get("GetFrequency", "number"),
		util.get("GetLacunarity", "number"),
		util.getEnum("GetNoiseQuality", "NoiseQuality"),
		util.get("GetOctaveCount", "integer"),
		util.get("GetPersistence", "number"),
		util.get("GetSeed", "integer"),
		util.set("SetFrequency", "number"),
		util.set("SetLacunarity", "number"),
		util.setEnum("SetNoiseQuality", "NoiseQuality"),
		util.set("SetOctaveCount", "integer"),
		util.set("SetPersistence", "number"),
		util.set("SetSeed", "integer")
	}
}
