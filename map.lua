require "maps"

currentMap = nil

function loadMap(map) 
	map.planes = {}
	map.messages = {}
	
	map.nextSpawnTime = love.timer.getTime()
	
	for name, node in pairs(map.nodes) do
		node.name = name
	end
	
	for name, node in pairs(map.nodes) do
		if not node.actions then 
			node.actions = {}
		end
		for action, nxt in pairs(node.actions) do
			if type(nxt) == "string" then
				node.actions[action] = map.nodes[nxt]
			end
		end
		if not node.actions["auto"] then
			node.actions["auto"] = node
		end
		if node.speedFactor == nil then
			node.speedFactor = 1.0
		end
		if node.queueing == nil then 
			node.queueing = true
		end
	end
	
	currentMap = map
end

function drawMap(map) 
	assert(map, "No map defined")
	local trackWidth = 45
	
	local nodes = map.nodes
	
	love.graphics.setColor({10,70,10})
	love.graphics.rectangle("fill", map.bounds[1][1], map.bounds[1][2], map.bounds[2][1]-map.bounds[1][1], map.bounds[2][2]-map.bounds[1][2])

	love.graphics.setLineWidth(trackWidth)
	love.graphics.setColor({100,100,100})
	for name, node in pairs(nodes) do
		love.graphics.circle("fill", node.pos[1], node.pos[2], trackWidth/2, 20)

		for _, nxt in pairs(node.actions) do
			love.graphics.line(node.pos[1], node.pos[2], nxt.pos[1], nxt.pos[2])
		end
	end
end
