local util = require("generator.util")

return {
	name = "Cylinders",
	filename = "cylinders",
	constructorargs = util.construct(),
	methods = {
		util.get("GetFrequency", "number"),
		util.set("SetFrequency", "number")
	}
}
