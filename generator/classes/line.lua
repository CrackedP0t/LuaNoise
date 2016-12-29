local util = require("generator.util")

return {
	name = "Line",
	filename = "line",
	constructorargs = util.construct(),
	methods = {
		util.get("GetAttenuate", "boolean"),
		util.getClass("GetModule", "Module"),
		util.get("GetValue", "number", "number"),
		util.set("SetAttenuate", "boolean"),
		util.set("SetEndPoint", "number", "number", "number"),
		util.setClass("SetModule", "Module"),
		util.set("SetStartPoint", "number", "number", "number")
	}
}
