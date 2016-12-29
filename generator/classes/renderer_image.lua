local util = require("generator.util")

return {
	prefix = "utils",
	name = "RendererImage",
	filename = "renderer_image",
	constructorargs = util.construct(),
	methods = {
		{
			name = "AddGradientPoint",
			args = {
				{
					luatype = "number"
				},
				{
					classname = "Color"
				}
			},
			ret = {
				doesRet = false
			}
		},
		util.blank("BuildGrayscaleGradient"),
		util.blank("BuildTerrainGradient"),
		util.blank("ClearGradient"),
		util.set("EnableLight", "boolean"),
		util.set("EnableWrap", "boolean"),
		util.get("GetLightAzimuth", "number"),
		util.get("GetLightBrightness", "number"),
		util.getClass("GetLightColor", "Color"),
		util.get("GetLightContrast", "number"),
		util.get("GetLightElev", "number"),
		util.get("GetLightIntensity", "number"),
		util.get("IsLightEnabled", "boolean"),
		util.get("IsWrapEnabled", "boolean"),
		util.blank("Render"),
		util.setClass("SetBackgroundImage", "Image"),
		util.setClass("SetDestImage", "Image"),
		util.set("SetLightAzimuth", "number"),
		util.set("SetLightBrightness", "number"),
		util.setClass("SetLightColor", "Color"),
		util.set("SetLightContrast", "number"),
		util.set("SetLightElev", "number"),
		util.set("SetLightIntensity", "number"),
		util.setClass("SetSourceNoiseMap", "NoiseMap")
	}
}
