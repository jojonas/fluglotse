function love.draw()	
	if currentMap then
		drawMap(currentMap)
	end
	
	for i=1,#currentMap.planes do
		local plane = currentMap.planes[i]
		drawPlane(plane)
	end
end