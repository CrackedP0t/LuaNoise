local util = require("generator.util")

return {
	prefix = "util",
	name = "NoiseMap",
	filename = "noise_map",
	constructorargs = util.construct(),
	methods = {
		util.get("GetBorderValue", "number"),
		util.get("GetHeight", "integer"),
		util.get("GetStride", "integer"),
		util.get("GetWidth", "integer"),
		util.get("GetValue", "number", "number", "number"),
		util.set("SetBorderValue", "number"),
		util.set("SetSize", "integer", "integer"),
		util.set("SetValue", "number", "number", "number")
	}
}
