function love.load()
	local w, h = love.graphics.getDimensions()
	love.window.setMode(w, h, {resizable=true})	
	
	local map = loveDoFile("maps.lua")
	loadMap(map)
end