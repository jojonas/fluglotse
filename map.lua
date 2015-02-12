require "maps"

currentMap = nil

function loadMap(map) 
	map.planes = {}
	
	currentMap = map
	spawnPlane()
end

function drawMap(map) 
	assert(map, "No map defined")
	local nodes = map.nodes

	love.graphics.setColor({0,255,0})
	for name, node in pairs(nodes) do
		love.graphics.setLineWidth(1)
		love.graphics.circle("fill", node.pos[1], node.pos[2], 5, 16)
		for i=1,#node.nxt do
			local nxtPos = nodes[node.nxt[i]].pos
			love.graphics.line(node.pos[1], node.pos[2], nxtPos[1], nxtPos[2])
		end
	end
end
