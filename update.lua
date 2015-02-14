function love.update(dt)
	local map = currentMap
	
	if map.score >= 0 then
		for i=#map.planes,1,-1 do
			local plane = map.planes[i]
			if plane then -- may fix a bug when planes are removed
				updatePlane(plane, dt) 
			end
		end
		
		while map.nextSpawnTime < love.timer.getTime() do
			spawnPlane()
			local t = 1 / map.trafficFrequency
			local sigma_t = t / 3
			local delta = math.max(5*dt, love.math.randomNormal(sigma_t, t))
			map.nextSpawnTime = map.nextSpawnTime + delta
		end
	else
		if love.keyboard.isDown(" ") then
			loadMap(map, false)
		end
	end
		
	for i=#map.explosions,1,-1 do 
		local explosion = map.explosions[i]
		explosion.age = explosion.age + dt
		if explosion.age >= explosion.duration then
			table.remove(map.explosions, i)
		end
	end
end
