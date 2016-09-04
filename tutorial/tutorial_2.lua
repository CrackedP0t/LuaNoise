local noise = require ("noise")

local myModule = noise.Perlin ()
local value = myModule:GetValue (1.25, 0.75, 0.5)
print (value)
