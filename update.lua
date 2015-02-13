function love.update(dt)
	local map = currentMap
	for i=#map.planes,1,-1 do
		local plane = map.planes[i]
		updatePlane(plane, dt)
	end
	
	while map.nextSpawnTime < love.timer.getTime() do
		spawnPlane()
		local t = 1 / map.trafficFrequency
		local sigma_t = t / 3
		local delta = math.max(5*dt, love.math.randomNormal(sigma_t, t))
		map.nextSpawnTime = map.nextSpawnTime + delta
	end
end
