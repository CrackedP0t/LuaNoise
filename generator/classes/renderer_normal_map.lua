local util = require("generator.util")

return {
	prefix = "utils",
	name = "RendererNormalMap",
	filename = "renderer_normal_map",
	constructorargs = util.construct(),
	methods = {
		util.set("EnableWrap", "boolean"),
		util.get("GetBumpHeight", "number"),
		util.get("IsWrapEnabled", "boolean"),
		util.blank("Render"),
		util.set("SetBumpHeight", "number"),
		util.setClass("SetDestImage", "Image"),
		util.setClass("SetSourceNoiseMap", "NoiseMap")
	}
}
