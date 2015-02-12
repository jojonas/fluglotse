require "helpers"

function planeDirection(plane)
	return vectorNormalized({plane.target.pos[1] - plane.pos[1], plane.target.pos[2] - plane.pos[2]})
end

function spawnPlane()
	local map = currentMap
	local input = map.nodes[randomChoice(map.inbound)]
	
	assert(input ~= nil, "Input node not found in node list.")
	
	local plane = {
		pos = {input.pos[1], input.pos[2]},
		target = map.nodes[randomChoice(input.nxt)],
		speed = 100,
		heading = 0,
	}
	assert(plane.target, "Plane has no target.")
	
	table.insert(map.planes, plane)
end

function updatePlane(plane, dt)
	local direction = planeDirection(plane)
	plane.pos[1] = plane.pos[1] + plane.speed * direction[1] * dt
	plane.pos[2] = plane.pos[2] + plane.speed * direction[2] * dt
	
	local distaceToGo = vectorNorm({plane.target.pos[1] - plane.pos[1], plane.target.pos[2] - plane.pos[2]})

end

function drawPlane(plane)
	love.graphics.push()
		love.graphics.setColor({255,0,0})
		love.graphics.translate(plane.pos[1], plane.pos[2])
		
		local direction = planeDirection(plane)
		local heading = math.atan2(direction[2], direction[1])
		love.graphics.rotate(heading)
		
		love.graphics.polygon("fill", {0,0,-70,30,-70,-30})
	love.graphics.pop()
end
