local util = require("generator.util")

return {
	inherits = "Module",
	name = "Clamp",
	filename = "clamp",
	constructorargs = util.construct(),
	methods = {
		util.get("GetLowerBound", "number"),
		util.get("GetUpperBound", "number"),
		util.set("SetBounds", "number", "number")
	}
}
