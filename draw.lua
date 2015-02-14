local explosionImage = love.graphics.newImage("explosion.png")
explosionStart = nil
explosionPosition = nil

function love.draw()	
	local map = currentMap
	assert(map, "No map defined")
	
	love.graphics.push()
		local w = map.bounds[2][1] - map.bounds[1][1]
		local h = map.bounds[2][2] - map.bounds[1][2]

		assert(w>0 and h>0, "Invalid bounds.")

		local gw, gh = getGameViewDimensions()
		local scale = math.min(gw/w, gh/h)
		
		love.graphics.translate(gw/2, gh/2)
		love.graphics.scale(scale)
		love.graphics.translate(-map.bounds[1][1], -map.bounds[1][2])
		love.graphics.translate(-w/2, -h/2)
	
		local x, y = toScreenCoordinates(unpack(map.bounds[1]))
		love.graphics.setScissor(x,y, w*scale, h*scale)
		drawMap(currentMap)
	
		for i=1,#currentMap.planes do
			local plane = currentMap.planes[i]
			drawPlane(plane, i==uiSelectedListElement)
		end
		
		for i=1,#currentMap.explosions do
			local explosion = currentMap.explosions[i]
			local scale = explosion.size * math.pow(explosion.age/explosion.duration, 0.2)
			local alpha = 255*(1-math.pow(explosion.age/explosion.duration, 4))
			love.graphics.setColor(255, 255, 255, alpha)
			love.graphics.draw(explosion.image, explosion.pos[1], explosion.pos[2], explosion.rotation, scale, scale, explosion.image:getWidth()/2, explosion.image:getHeight()/2) 
		end
		
		drawSky(map)
		
		love.graphics.setScissor()
		
	love.graphics.pop()
	
	drawChat()
	drawUI()
end