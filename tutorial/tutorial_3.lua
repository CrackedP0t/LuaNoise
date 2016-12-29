local noise = require ("noise")

local myModule = noise.Perlin ()

local heightMap = noise.NoiseMap ()
local heightMapBuilder = noise.NoiseMapBuilderPlane ()
heightMapBuilder:SetSourceModule (myModule)
heightMapBuilder:SetDestNoiseMap (heightMap)
heightMapBuilder:SetDestSize (256, 256)
heightMapBuilder:SetBounds (2, 6, 1, 5)
heightMapBuilder:Build ()

local renderer = noise.RendererImage ()

local image = noise.Image ()
renderer:SetSourceNoiseMap (heightMap);
renderer:SetDestImage (image)
renderer:ClearGradient ()
renderer:AddGradientPoint (-1.0000, noise.Color (  0,   0, 128, 255)) -- deeps
renderer:AddGradientPoint (-0.2500, noise.Color (  0,   0, 255, 255)) -- shallow
renderer:AddGradientPoint ( 0.0000, noise.Color (  0, 128, 255, 255)) -- shore
renderer:AddGradientPoint ( 0.0625, noise.Color (240, 240,  64, 255)) -- sand
renderer:AddGradientPoint ( 0.1250, noise.Color ( 32, 160,   0, 255)) -- grass
renderer:AddGradientPoint ( 0.3750, noise.Color (224, 224,   0, 255)) -- dirt
renderer:AddGradientPoint ( 0.7500, noise.Color (128, 128, 128, 255)) -- rock
renderer:AddGradientPoint ( 1.0000, noise.Color (255, 255, 255, 255)) -- snow
renderer:EnableLight (true)
renderer:SetLightContrast (3)
renderer:SetLightBrightness (2)
renderer:Render ()

local writer = noise.WriterBMP ()
writer:SetSourceImage (image)
writer:SetDestFilename ("tutorial_3.bmp")
writer:WriteDestFile ()
