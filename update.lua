
function love.update(dt)
	local map = currentMap
	for i=1,#map.planes do
		local plane = map.planes[i]
		local direction = normalized({plane.target.pos[1] - plane.pos[1], plane.target.pos[2] - plane.pos[2]})
		plane.pos[1] = plane.pos[1] + plane.speed * direction[1] * dt
		plane.pos[2] = plane.pos[2] + plane.speed * direction[2] * dt
	end
end