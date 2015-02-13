require "helpers"

local planeImage = love.graphics.newImage("plane.png")
local planeShadowImage = love.graphics.newImage("plane_shadow.png")
local planeSelectionImage = love.graphics.newImage("plane_selection.png")

function planeDirection(plane)
	return vectorNormalized({plane.target.pos[1] - plane.pos[1], plane.target.pos[2] - plane.pos[2], plane.target.altitude - plane.pos[3]})
end

function planeDistanceToGo(plane)
	return vectorNorm({plane.target.pos[1] - plane.pos[1], plane.target.pos[2] - plane.pos[2]})
end

function printPlane(plane)
	print("PLANE. Identifier: " .. plane.identifier .. " Target: " .. plane.target.name)
end

function generateIdentifier()
	return randomCharacter() .. "-" .. tostring(love.math.random(0,99))
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

function findAllCollidingPlanes(plane, nextPos, map, property)
	local collisions = {}
	property = property or "hardRadius"
	for i=1,#map.planes do
		local other = map.planes[i]
		if other ~= plane then
			local dist = vectorNorm({nextPos[1]-other.pos[1], nextPos[2]-other.pos[2]})
			if dist < plane[property]+other[property] then
				if nextPos[3] > other.pos[3] then
					if nextPos[3]-other.pos[3]<other.height then 
						collisions[#collisions+1] = other
					end
				else 
					if other.pos[3]-nextPos[3]<plane.height then 
						collisions[#collisions+1] = other
					end
				end
			end
		end
	end
	return collisions
end

function spawnPlane()
	local map = currentMap
	local input = map.nodes[randomChoice(map.mapEntrances)]
	
	assert(input ~= nil, "Input node not found in node list.")
	
	local plane = {
		identifier = "",
		pos = {input.pos[1], input.pos[2], input.altitude},
		drawPos = {input.pos[1], input.pos[2], input.altitude},
		target = input.actions["auto"],
		speed = 70,
		heading = 0,
		nextAction = "auto",
		spread = 60,
		length = 60,
		height = 20,
		hardRadius = 40, -- for selection box, labeling etc
		softRadius = 60,
		image = planeImage,
		shadowImage = planeShadowImage,
		selectionImage = planeSelectionImage, 
		labelOffsetCounter = 1
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
	postMessage(plane.identifier, "Incoming...")
	
	table.insert(map.planes, plane)
	
	return plane
end

function getPlaneIndex(plane)
	for i=1,#currentMap.planes do
		if currentMap.planes[i] == plane then
			return i
		end
	end
end

function removePlane(plane)
	local todelete = getPlaneIndex(plane)
	if todelete then
		if todelete < uiSelectedListElement or todelete == #currentMap.planes then
			uiSelectedListElement = uiSelectedListElement - 1
		end
		table.remove(currentMap.planes, todelete)
	end
end


function updatePlane(plane, dt)
	local map = currentMap
	
	local distanceToGo = planeDistanceToGo(plane)
	local speed = plane.speed * plane.target.speedFactor
	local stepDistance = speed * dt
	
	if distanceToGo > stepDistance then -- prevent oscillations
		local direction = planeDirection(plane)
		
		local nextPos = {plane.pos[1] + speed * direction[1] * dt, 
			plane.pos[2] + speed * direction[2] * dt, 
			plane.pos[3] + speed * direction[3] * dt}
		
		local planeIndex = getPlaneIndex(plane)
		local collidingPlanes = findAllCollidingPlanes(plane, nextPos, map)
		for i=1,#collidingPlanes do
			local collidingPlane = collidingPlanes[i] 
			
			local otherIndex = getPlaneIndex(collidingPlane)
			local smallerIndex, largerIndex = math.min(planeIndex, otherIndex), math.max(planeIndex, otherIndex)
			map.planes[largerIndex].labelOffsetCounter = map.planes[smallerIndex].labelOffsetCounter + 1
			
			if plane.target.queueing then
				if plane.target == collidingPlane.target then
					local distOther = planeDistanceToGo(collidingPlane)
					local boostSpeed = 50 * plane.target.speedFactor
					if distOther >= distanceToGo then -- boost!
						nextPos[1] = nextPos[1] + boostSpeed * direction[1] * dt
						nextPos[2] = nextPos[2] + boostSpeed * direction[2] * dt
						nextPos[3] = nextPos[3] + boostSpeed * direction[3] * dt
						plane.pos = nextPos
					end
				elseif planeIsAhead(plane, collidingPlane) then
					plane.pos = nextPos
				else
					-- stop
				end
			else 
				postMessage("System", "Crash of " .. plane.identifier .. " and " .. collidingPlane.identifier .. "!")
			end
		end
		
		if #collidingPlanes == 0 then
			plane.pos = nextPos
		end
		
	else -- arrived at target!
		for i=1,#map.mapExits do
			if plane.target.name == map.mapExits[i] then
				postMessage(plane.identifier, "Out!")
				removePlane(plane)
				return
			end
		end
		
		local nxt = plane.target.actions[plane.nextAction]
		assert(nxt, "Next action is undefined.")
		if nxt == plane.target then
			if not plane.promptSent then
				postMessage(plane.identifier, randomChoice({"Ready.", "On your go.", "Waiting for your command."}))
				plane.promptSent = true
			end
		else
			plane.promptSent = nil
		end 
		
		plane.target = nxt
		plane.nextAction = "auto"
	end
	
	local easeFactor = 3
	local easeDirection = {plane.pos[1] - plane.drawPos[1], plane.pos[2] - plane.drawPos[2]}
	plane.drawPos[1] = plane.drawPos[1] + easeFactor*easeDirection[1] * dt
	plane.drawPos[2] = plane.drawPos[2] + easeFactor*easeDirection[2] * dt
	
	if vectorNorm(easeDirection) > stepDistance then -- only recalculate heading when plane is really moving (ghost and drawing differ by one step distance)
		local easeDirectionNormalized = vectorNormalized(easeDirection)
		plane.heading = math.atan2(easeDirectionNormalized[2], easeDirectionNormalized[1])
	end
	
end

function drawPlane(plane, selected)
	love.graphics.push()
		-- drawing of identifier in drawUi!!!
		
		-- debug collision shapes
		--love.graphics.setColor({255,255,0})
		--love.graphics.setLineWidth(2)
		--love.graphics.circle("line", plane.pos[1], plane.pos[2], plane.softRadius, 20)
		--love.graphics.circle("line", plane.pos[1], plane.pos[2], plane.hardRadius, 20)
		
		local offset = 0.5*(plane.pos[3]+plane.height)
		local shadowAngle = math.rad(45)
		local alpha = clamp(255-plane.pos[3] ,50,255)
		
		love.graphics.setColor(255,255,255, alpha)
		love.graphics.push()
			love.graphics.translate(offset*math.sin(shadowAngle), offset*math.cos(shadowAngle))
			local sx = plane.spread/plane.shadowImage:getWidth()/0.8
			local sy = plane.length/plane.shadowImage:getHeight()/0.8
			love.graphics.draw(plane.shadowImage, plane.drawPos[1], plane.drawPos[2], plane.heading+math.pi/2, sx, sy, plane.shadowImage:getWidth()/2, plane.shadowImage:getHeight()/2 )
		love.graphics.pop()
		
		if selected then
			love.graphics.setColor(47,255,136,255)
			love.graphics.draw(plane.selectionImage, plane.drawPos[1], plane.drawPos[2], plane.heading+math.pi/2, sx, sy, plane.selectionImage:getWidth()/2, plane.selectionImage:getHeight()/2 )
		end
		
		local color = colorFromName(plane.identifier)
		love.graphics.setColor(color[1], color[2], color[3], 255)
		local sx = plane.spread/plane.image:getWidth()/0.8
		local sy = plane.length/plane.image:getHeight()/0.8
		love.graphics.draw(plane.image, plane.drawPos[1], plane.drawPos[2], plane.heading+math.pi/2, sx, sy, plane.image:getWidth()/2, plane.image:getHeight()/2 )
	love.graphics.pop()
end
