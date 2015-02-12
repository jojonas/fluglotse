require "helpers"

function planeDirection(plane)
	return vectorNormalized({plane.target.pos[1] - plane.pos[1], plane.target.pos[2] - plane.pos[2]})
end

function printPlane(plane)
	print("PLANE. Target: " .. plane.target.name)
end

function spawnPlane()
	local map = currentMap
	local input = map.nodes[randomChoice(map.inbound)]
	
	assert(input ~= nil, "Input node not found in node list.")
	
	local plane = {
		pos = {input.pos[1], input.pos[2]},
		drawPos = {input.pos[1], input.pos[2]},
		target = input.actions["auto"],
		lastNode = input,
		speed = 500,
		heading = 0,
		nextAction = "auto"
	}
	
	assert(plane.target, "Plane has no target.")
	print(plane.target.pos[1], plane.target.pos[2])
	
	table.insert(map.planes, plane)
end

function removePlane(plane)
	local map = currentMap
	
	local todelete = nil
	for i=1,#map.planes do
		if map.planes[i] == plane then
			todelete = i
			break
		end
	end
	if todelete then
		table.remove(table, todelete)
	end
end

function updatePlane(plane, dt)
	local distanceToGo = vectorNorm({plane.target.pos[1] - plane.pos[1], plane.target.pos[2] - plane.pos[2]})
	local stepDistance = plane.speed * dt
	
	if distanceToGo > stepDistance then -- prevent oscillations
		local direction = planeDirection(plane)
		plane.pos[1] = plane.pos[1] + plane.speed * direction[1] * dt
		plane.pos[2] = plane.pos[2] + plane.speed * direction[2] * dt
	else
		local nxt = plane.target.actions[plane.nextAction]
		assert(nxt, "Next action is undefined.")
		plane.target = nxt
		plane.nextAction = "auto"
	end
	
	local easeFactor = 6
	local easeDirection = {plane.pos[1] - plane.drawPos[1], plane.pos[2] - plane.drawPos[2]}
	plane.drawPos[1] = plane.drawPos[1] + easeFactor*easeDirection[1] * dt
	plane.drawPos[2] = plane.drawPos[2] + easeFactor*easeDirection[2] * dt
	
	if vectorNorm(easeDirection) > stepDistance then -- only recalculate heading when plane is really moving (ghost and drawing differ by one step distance)
		local easeDirectionNormalized = vectorNormalized(easeDirection)
		plane.heading = math.atan2(easeDirectionNormalized[2], easeDirectionNormalized[1])
	end
end

function drawPlane(plane)
	love.graphics.push()
		
		love.graphics.setColor({255,0,0})
		love.graphics.translate(plane.drawPos[1], plane.drawPos[2])
		
		love.graphics.rotate(plane.heading)
		
		love.graphics.polygon("fill", {30,0,-40,30,-40,-30})
	love.graphics.pop()
end
