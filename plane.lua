require "helpers"

function planeDirection(plane)
	return vectorNormalized({plane.target.pos[1] - plane.pos[1], plane.target.pos[2] - plane.pos[2]})
end

function printPlane(plane)
	print("PLANE. Identifier: " .. plane.identifier .. " Target: " .. plane.target.name)
end

function generateIdentifier()
	return randomCharacter() .. "-" .. tostring(love.math.random(0,99))
end

function spawnPlane()
	local map = currentMap
	local input = map.nodes[randomChoice(map.mapEntrances)]
	
	assert(input ~= nil, "Input node not found in node list.")
	
	local plane = {
		identifier = "",
		pos = {input.pos[1], input.pos[2]},
		drawPos = {input.pos[1], input.pos[2]},
		target = input.actions["auto"],
		speed = 100,
		heading = 0,
		nextAction = "auto",
		spread = 60,
		length = 60,
		size = 100 -- for selection box, labeling etc
	}
	
	repeat 
		local unique = true
		plane.identifier = generateIdentifier()
		for i=1,#map.planes do
			if map.planes[i].identifier == plane.identifier then
				unique = false
				break
			end
		end
	until unique
	
	assert(plane.target, "Plane has no target.")
	
	table.insert(map.planes, plane)
	
	return plane
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
		if todelete < uiSelectedListElement or todelete == #map.planes then
			uiSelectedListElement = uiSelectedListElement - 1
		end
		table.remove(map.planes, todelete)
	end
end

function planeIsAhead(planeA, planeB)
	for _, target in pairs(planeB.target.actions) do
		if target ~= planeB.target then
			if target == planeA.target then
				return true
			end
		end
	end
	return false
end

function findFirstCollidingPlane(plane, nextPos, map)
	for i=1,#map.planes do
		local other = map.planes[i]
		if other ~= plane then
			local dist = vectorNorm({nextPos[1]-other.pos[1], nextPos[2]-other.pos[2]})
			if dist < plane.size/2+other.size/2 then
				return other
			end
		end
	end
end

function updatePlane(plane, dt)
	local map = currentMap
	
	local distanceToGo = vectorNorm({plane.target.pos[1] - plane.pos[1], plane.target.pos[2] - plane.pos[2]})
	local speed = plane.speed * plane.target.speedFactor
	local stepDistance = speed * dt
	
	if distanceToGo > stepDistance then -- prevent oscillations
		local direction = planeDirection(plane)
		local nextPos = {plane.pos[1] + speed * direction[1] * dt, 
			plane.pos[2] + speed * direction[2] * dt}
		
		local collidingPlane = findFirstCollidingPlane(plane, nextPos, map)
		
		
		if not collidingPlane or (plane.target.queueing and plane.target ~= collidingPlane.target and planeIsAhead(plane, collidingPlane)) then
			plane.pos[1] = nextPos[1]
			plane.pos[2] = nextPos[2]
		elseif collidingPlane and not plane.queueing then
			--removePlane(plane)
			--removePlane(collidingPlane)
			print("EXPLOSION!!!")
		end
		
	else -- arrived at target!
		for i=1,#map.mapExits do
			if plane.target.name == map.mapExits[i] then
				removePlane(plane)
				return
			end
		end
		
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
	
	if collidingPlane and not plane.target.queueing then 
		print("EXPLOSION")
	else
		
	end
end

function drawPlane(plane, selected)
	love.graphics.push()
		love.graphics.setColor({255,0,0})
		love.graphics.translate(plane.drawPos[1], plane.drawPos[2])
		if selected then
			love.graphics.setLineWidth(2)
			love.graphics.circle("line", 0, 0, plane.size / 2, 20)
		end
		-- drawing of identifier in drawUi!!!
		love.graphics.rotate(plane.heading)
		love.graphics.polygon("fill", {plane.length/2,0,  -plane.length/2,plane.spread/2,  -plane.length/2,-plane.spread/2})
	love.graphics.pop()
end
