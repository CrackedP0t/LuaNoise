local util = require("generator.util")

return {
	inherits = "Module",
	prefix = "modules",
	name = "ScaleBias",
	filename = "scale_bias",
	constructorargs = util.construct(),
	methods = {
		util.get("GetBias", "number"),
		util.get("GetScale", "number"),
		util.set("SetBias", "number"),
		util.set("SetScale", "number")
	}
}
		
