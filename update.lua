function love.update(dt)
	local map = currentMap
	for i=#map.planes,1,-1 do
		local plane = map.planes[i]
		updatePlane(plane, dt)
	end
end

function love.keypressed(key, isrepeat)
	if key == " " then
		spawnPlane()
	end
end