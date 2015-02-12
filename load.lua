require "maps"

currentMap = nil

function loadMap(map) 
	map.planes = {}
	
	currentMap = map
	spawnPlane()
end

function love.load()
	local w, h = love.graphics.getDimensions()
	love.window.setMode(w, h, {resizable=true})
	
	loadMap(map1)
end