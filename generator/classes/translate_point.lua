local util = require("generator.util")

return {
	inherits = "Module",
	prefix = "modules",
	name = "TranslatePoint",
	filename = "translate_point",
	constructorargs = util.construct(),
	methods = {
		util.get("GetXTranslation", "number"),
		util.get("GetYTranslation", "number"),
		util.get("GetZTranslation", "number"),
		util.set("SetTranslation", "number", "number", "number"),
		util.set("SetXTranslation", "number"),
		util.set("SetYTranslation", "number"),
		util.set("SetZTranslation", "number"),
	}
}
