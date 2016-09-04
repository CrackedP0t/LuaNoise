local noise = require ("noise")

local mountainTerrain = noise.RidgedMulti ()

local baseFlatTerrain = noise.Billow ()
baseFlatTerrain:SetFrequency (2)

local flatTerrain = noise.ScaleBias ()
flatTerrain:SetSourceModule (0, baseFlatTerrain)
flatTerrain:SetScale (0.125)
flatTerrain:SetBias (-0.75);

local terrainType = noise.Perlin ()
terrainType:SetFrequency (0.5)
terrainType:SetPersistence (0.25)

local terrainSelector = noise.Select ()
terrainSelector:SetSourceModule (0, flatTerrain)
terrainSelector:SetSourceModule (1, mountainTerrain)
terrainSelector:SetControlModule (terrainType)
terrainSelector:SetBounds (0, 1000)
terrainSelector:SetEdgeFalloff (0.125)

local finalTerrain = noise.Turbulence ()
finalTerrain:SetSourceModule (0, terrainSelector)
finalTerrain:SetFrequency (4)
finalTerrain:SetPower (0.125)

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

function love.draw()
	for x = 0, image:GetWidth() do
		for y = 0, image:GetHeight() do
			local c = image:GetValue(x, y)
			love.graphics.setColor(c.red, c.blue, c.green)
			love.graphics.points(x, y)
		end
	end
end
