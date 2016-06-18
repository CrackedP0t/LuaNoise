local noise = require("noise")

local mountainTerrain = noise.RidgedMulti()

local baseFlatTerrain = noise.Billow()
baseFlatTerrain:SetFrequency(2)

local flatTerrain = noise.ScaleBias()
flatTerrain:SetSourceModule(0, baseFlatTerrain)
flatTerrain:SetScale(0.125)
flatTerrain:SetBias(-0.75);

local terrainType = noise.Perlin()
terrainType:SetFrequency(0.5)
terrainType:SetPersistence(0.25)

local terrainSelector = noise.Select()
terrainSelector:SetSourceModule(0, flatTerrain)
terrainSelector:SetSourceModule(1, mountainTerrain)
terrainSelector:SetControlModule(terrainType)
terrainSelector:SetBounds(0, 1000)
terrainSelector:SetEdgeFalloff(0.125)

local terrainScaler = noise.ScaleBias()
terrainScaler:SetSourceModule(0, terrainScaler)
terrainScaler:SetScale(375)
terrainScaler:SetBias(375)

local finalTerrain = noise.Turbulence()
finalTerrain:SetSourceModule(0, terrainSelector)
finalTerrain:SetFrequency(4)
finalTerrain:SetPower(0.125)

local heightMap = noise.NoiseMap()
local heightMapBuilder = noise.NoiseMapBuilderPlane()
heightMapBuilder:SetSourceModule(finalTerrain)
heightMapBuilder:SetDestNoiseMap(heightMap)
heightMapBuilder:SetDestSize(513, 513)
heightMapBuilder:SetBounds(6, 10, 1, 5)
heightMapBuilder:Build()

local writer = noise.WriterTER()
writer:SetSourceNoiseMap(heightMap)
writer:SetDestFilename("tutorial_7.ter")
writer:SetMetersPerPoint(15)
writer:WriteDestFile()
