local util = require("generator.util")

return {
	inherits = "Module",
	prefix = "modules",
	name = "ScalePoint",
	filename = "scale_point",
	constructorargs = util.construct(),
	methods = {
		util.get("GetXScale", "number"),
		util.get("GetYScale", "number"),
		util.get("GetZScale", "number"),
		util.set("SetScale", "number", "number", "number"),
		util.set("SetXScale", "number"),
		util.set("SetYScale", "number"),
		util.set("SetZScale", "number")
	}
}
