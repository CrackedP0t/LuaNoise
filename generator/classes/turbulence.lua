local util = require("generator.util")

return {
	inherits = "Module",
	name = "Turbulence",
	filename = "turbulence",
	constructorargs = util.construct(),
	methods = {
		util.get("GetFrequency", "number"),
		util.get("GetPower", "number"),
		util.get("GetRoughnessCount", "integer"),
		util.get("GetSeed", "integer"),
		util.set("SetFrequency", "number"),
		util.set("SetPower", "number"),
		util.set("SetRoughness", "integer"),
		util.set("SetSeed", "integer")
	}
}
