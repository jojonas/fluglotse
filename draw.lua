function love.draw()	
	local map = currentMap
	
	assert(map, "No map defined")
	love.graphics.push()
		local w = map.bounds[2][1] - map.bounds[1][1]
		local h = map.bounds[2][2] - map.bounds[1][2]

		local gw, gh = getGameViewDimensions()
		local scale = math.min(gh/h, gw/w)
		
		love.graphics.translate(gw/2, gh/2)
		love.graphics.scale(scale)
		love.graphics.translate(-w/2, -h/2)
		
		drawMap(currentMap)
		
		for i=1,#currentMap.planes do
			local plane = currentMap.planes[i]
			drawPlane(plane, i==uiSelectedListElement)
		end
	love.graphics.pop()
	
	drawUI()
end