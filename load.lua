function autoFullscreen()
	local supportedModes = love.window.getFullscreenModes()
	table.sort(supportedModes, function(a, b) return a.width*a.height < b.width*b.height end)
	
	for i=#supportedModes,1,-1 do
		local width = supportedModes[i].width
		local height = supportedModes[i].height
		local success = love.window.setMode(width, height, {fullscreen=true, vsync=true})
		if success then return end
	end
	if not love.window.setMode(1024, 768, {fullscreen=false, vsync=true}) then
		error("Could not determine graphics mode.")
	end
end

function love.load()
	autoFullscreen()
	
	local map = loveDoFile("editor/map.lua")
	loadMap(map)
end