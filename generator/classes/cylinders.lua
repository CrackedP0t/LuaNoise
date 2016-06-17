local util = require("generator.util")

return {
	prefix = "model",
	name = "Cylinders",
	filename = "cylinders",
	constructorargs = util.construct(),
	methods = {
		util.get("GetFrequency", "number"),
		util.set("SetFrequency", "number")
	}
}
