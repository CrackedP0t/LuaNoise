local util = require("generator.util")

return {
	inherits = "Module",
	prefix = "module",
	name = "Displace",
	filename = "displace",
	constructorargs = util.construct(),
	methods = {
		util.getClass("GetXDisplaceModule", "Module"),
		util.getClass("GetYDisplaceModule", "Module"),
		util.getClass("GetZDisplaceModule", "Module"),
		util.setClass("SetXDisplaceModule", "Module"),
		util.setClass("SetYDisplaceModule", "Module"),
		util.setClass("SetZDisplaceModule", "Module")
	}
}
