require "maps"

currentMap = nil

local fogImage = love.graphics.newImage("fog.png")

function loadMap(map) 
	map.planes = {}
	map.messages = {}
	
	map.nextSpawnTime = love.timer.getTime()
	
	if map.imageFilename then
		map.image = love.graphics.newImage(map.imageFilename)
	end
	
	if map.metersPerPixel == nil then
		map.metersPerPixel = 1
	end
	
	if map.trafficFrequency == nil then
		map.trafficFrequency = 1/10
	end
	
	for name, node in pairs(map.nodes) do
		node.name = name
	end
	
	-- scale
	map.bounds[1][1] = map.bounds[1][1] * map.metersPerPixel
	map.bounds[2][1] = map.bounds[2][1] * map.metersPerPixel
	map.bounds[1][2] = map.bounds[1][2] * map.metersPerPixel
	map.bounds[2][2] = map.bounds[2][2] * map.metersPerPixel
	for _, node in pairs(map.nodes) do
		node.pos[1] = node.pos[1] * map.metersPerPixel
		node.pos[2] = node.pos[2] * map.metersPerPixel
	end
		
	-- prepare objects
	-- fill tree with pointers
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
		if node.altitude == nil then
			node.altitude = 0
		end
	end
	
	currentMap = map
end

function drawSky(map)
	local w,h = map.bounds[2][1]-map.bounds[1][1], map.bounds[2][2]-map.bounds[1][2]
	local x,y = 0,0

	local wrap = (fogImage:getWidth() * map.metersPerPixel)
	local dx = love.timer.getTime()*30 % wrap

	x = -wrap
	love.graphics.setBlendMode("subtractive")
	love.graphics.setColor(255,255,255,50)
	while x < w do
		y = 0
		while y < h do 
			love.graphics.draw(fogImage, x+dx, y, 0, map.metersPerPixel, map.metersPerPixel)
			x = x + fogImage:getWidth() * map.metersPerPixel
			y = y + fogImage:getHeight() * map.metersPerPixel
		end
	end
	love.graphics.setBlendMode("alpha")
end

function drawMap(map) 
	assert(map, "No map defined")
	local trackWidth = 2
	
	local nodes = map.nodes
	
	
	love.graphics.setColor(10,70,10,255)
	love.graphics.rectangle("fill", map.bounds[1][1], map.bounds[1][2], map.bounds[2][1]-map.bounds[1][1], map.bounds[2][2]-map.bounds[1][2])

	if map.image then
		love.graphics.setColor(255,255,255,255)
		love.graphics.draw(map.image, 0, 0, 0, map.metersPerPixel, map.metersPerPixel)
	end
	
	--love.graphics.setLineWidth(trackWidth)
	--love.graphics.setColor(255,255,255,255)
	--for name, node in pairs(nodes) do
	--	love.graphics.circle("fill", node.pos[1], node.pos[2], trackWidth/2, 20)

	--	for _, nxt in pairs(node.actions) do
	--		love.graphics.line(node.pos[1], node.pos[2], nxt.pos[1], nxt.pos[2])
	--	end
	--end
end
