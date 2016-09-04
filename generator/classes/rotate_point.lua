local util = require("generator.util")

return {
	inherits = "Module",
	prefix = "modules",
	name = "RotatePoint",
	filename = "rotate_point",
	constructorargs = util.construct(),
	methods = {
		util.get("GetXAngle", "number"),
		util.get("GetYAngle", "number"),
		util.get("GetZAngle", "number"),
		util.set("SetAngles", "number", "number", "number"),
		util.set("SetXAngle", "number"),
		util.set("SetYAngle", "number"),
		util.set("SetZAngle", "number")
	}
}
