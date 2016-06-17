local util = require("generator.util")

return {
	prefix = "utils",
	name = "WriterTER",
	filename = "writer_ter",
	constructorargs = util.construct(),
	methods = {
		util.get("GetDestFilename", "string"),
		util.get("GetMetersPerPoint", "number"),
		util.set("SetDestFilename", "string"),
		util.set("SetMetersPerPoint", "number"),
		util.setClass("SetSourceNoiseMap", "NoiseMap"),
		util.blank("WriteDestFile")
	}
}
