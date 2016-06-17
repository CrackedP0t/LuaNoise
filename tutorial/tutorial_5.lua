local noise = require ("noise")

local mountainTerrain = noise.RidgedMulti ()

local baseFlatTerrain = noise.Billow ()
baseFlatTerrain:SetFrequency (2)

local flatTerrain = noise.ScaleBias ()
flatTerrain:SetSourceModule (0, baseFlatTerrain)
flatTerrain:SetScale (0.125)
flatTerrain:SetBias (-0.75)

local terrainType = noise.Perlin ()
terrainType:SetFrequency (0.5)
terrainType:SetPersistence (0.25)

local finalTerrain = noise.Select ()
finalTerrain:SetSourceModule (0, flatTerrain)
finalTerrain:SetSourceModule (1, mountainTerrain)
finalTerrain:SetControlModule (terrainType)
finalTerrain:SetBounds (0, 1000)
finalTerrain:SetEdgeFalloff (0.125)

local heightMap = noise.NoiseMap ()
local heightMapBuilder = noise.NoiseMapBuilderPlane ()
heightMapBuilder:SetSourceModule (finalTerrain)
heightMapBuilder:SetDestNoiseMap (heightMap)
heightMapBuilder:SetDestSize (256, 256)
heightMapBuilder:SetBounds (6, 10, 1, 5)
heightMapBuilder:Build ()

local renderer = noise.RendererImage ()
local image = noise.Image ()
renderer:SetSourceNoiseMap (heightMap);
renderer:SetDestImage (image)
renderer:ClearGradient  ()
renderer:AddGradientPoint (-1.00, noise.Color ( 32, 160,   0, 255)) -- grass
renderer:AddGradientPoint (-0.25, noise.Color (224, 224,   0, 255)) -- dirt
renderer:AddGradientPoint ( 0.25, noise.Color (128, 128, 128, 255)) -- rock
renderer:AddGradientPoint ( 1.00, noise.Color (255, 255, 255, 255)) -- snow
renderer:EnableLight (true)
renderer:SetLightContrast (3)
renderer:SetLightBrightness (2)
renderer:Render ()

local writer = noise.WriterBMP ()
writer:SetSourceImage (image)
writer:SetDestFilename ("tutorial_5.bmp")
writer:WriteDestFile ()
