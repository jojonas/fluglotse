function love.update(dt)
	local map = currentMap
	for i=1,#map.planes do
		local plane = map.planes[i]
		updatePlane(plane, dt)
	end
end