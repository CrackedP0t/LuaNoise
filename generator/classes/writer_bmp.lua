local util = require("generator.util")

return {
	name = "WriterBMP",
	filename = "writer_bmp",
	constructorargs = util.construct(),
	methods = {
		util.get("GetDestFilename", "string"),
		util.set("SetDestFilename", "string"),
		util.setClass("SetSourceImage", "Image"),
		util.blank("WriteDestFile")
	}
}
