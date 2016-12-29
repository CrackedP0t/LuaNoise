local util = require("generator.util")

return {
	inherits = "Module",
	name = "Spheres",
	filename = "spheres",
	constructorargs = util.construct(),
	methods = {
		util.get("GetFrequency", "number"),
		util.set("SetFrequency", "number")
	}
}
