require "maps"

currentMap = nil

function loadMap(map) 
	map.planes = {}
	
	currentMap = map
	spawnPlane()
end

function drawMap(map) 
	assert(map, "No map defined")
	
	local w = map.bounds[2][1] - map.bounds[1][1]
	local h = map.bounds[2][2] - map.bounds[1][2]
	local gw, gh = love.graphics.getDimensions()
	local scale = math.max(gh/h, gw/w)
	
	love.graphics.translate(gw/2, gh/2)
	love.graphics.scale(scale)
	love.graphics.translate(-w/2, -h/2)

	local nodes = map.nodes

	love.graphics.setColor({0,255,0})
	for name, node in pairs(nodes) do
		love.graphics.setLineWidth(0.1)
		love.graphics.circle("fill", node.pos[1], node.pos[2], 0.2, 16)
		for i=1,#node.nxt do
			local nxtPos = nodes[node.nxt[i]].pos
			love.graphics.line(node.pos[1], node.pos[2], nxtPos[1], nxtPos[2])
		end
	end
	
end
