local nodeRadius = 20

function love.load(arg)
	print(io.popen"cd":read'*l')
	
	consoleInputLine = ""
	outputLine = ""
	backgroundImage = nil
	camera = {position = {0, 0}, scale = 1.0}
	editMode = "none"
	selectedNode = nil
	nameCounter = 0
	
	mapEntrances = {}
	mapExits = {}
	nodes = {}
	map = {}
	
	--interpretCommand("loadBackground:cyberspace.png")
end

function love.draw()
	love.graphics.push()
		love.graphics.translate(love.window.getWidth()/2, love.window.getHeight()/2)
		love.graphics.scale(camera.scale)
		love.graphics.translate(-camera.position[1], -camera.position[2])
		
		if backgroundImage then love.graphics.draw(backgroundImage) end
		
		for k, v in pairs(nodes) do
			love.graphics.setColor(255, 0, 0, 255)
			
			if inSet(mapEntrances, k) then
				love.graphics.setColor(0, 0, 255, 255)
			end
			
			if inSet(mapExits, k) then
				love.graphics.setColor(0, 255, 0, 255)
			end
			
			love.graphics.circle("fill", v.pos[1], v.pos[2], nodeRadius, 32)
			
			love.graphics.setLineWidth(1)
			if selectedNode == k then
				love.graphics.rectangle("line", v.pos[1] - nodeRadius, v.pos[2] - nodeRadius, nodeRadius*2, nodeRadius*2)
			end
			
			love.graphics.setLineWidth(10)
			for ak, av in pairs(v.actions) do
				local rel = {nodes[av].pos[1] - v.pos[1], nodes[av].pos[2] - v.pos[2]}
				local relLen = math.sqrt(rel[1]*rel[1] + rel[2]*rel[2])
				rel = {rel[1]/relLen, rel[2]/relLen}
				local ortho = {rel[2], -rel[1]}
				love.graphics.polygon("fill", v.pos[1] + ortho[1]*7, v.pos[2] + ortho[2]*7, v.pos[1] - ortho[1]*5, v.pos[2] - ortho[2]*5, 
														nodes[av].pos[1], nodes[av].pos[2])
			end
		end
	love.graphics.pop()
	
	love.graphics.setColor(255, 255, 255, 255)
	for k, v in pairs(nodes) do
		local textCoord = toScreenCoords(unpack(v.pos))
		love.graphics.printf(k .. (v.queueing and " - queueing" or " - not queueing"), textCoord[1], textCoord[2], 200)
		
		for ak, av in pairs(v.actions) do
			local textCoord = toScreenCoords((v.pos[1] + nodes[av].pos[1])/2, (v.pos[2] + nodes[av].pos[2])/2)
			love.graphics.printf(ak, textCoord[1], textCoord[2], 200)
		end
	end
	
	local shellHeight = 50
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.rectangle("fill", 0, love.window.getHeight() - shellHeight, love.window.getWidth(), shellHeight)
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.rectangle("fill", 1, love.window.getHeight() - shellHeight + 1, love.window.getWidth() - 2, shellHeight - 2)
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.printf(consoleInputLine, 5, love.window.getHeight() - shellHeight / 2 + 5, love.window.getWidth() - 10)
	love.graphics.setLineWidth(1)
	love.graphics.line(0, love.window.getHeight() - shellHeight/2, love.window.getWidth(), love.window.getHeight() - shellHeight/2)
	love.graphics.printf(outputLine, 5, love.window.getHeight() - shellHeight + 5, love.window.getWidth() - 10)
end

function saveMap(filename)
	local file, err = io.open(filename, "w")
	if file == nil then
		outputLine = "File '" .. filename .. "' could not be opened."
	else
		map.mapEntrances = mapEntrances
		map.mapExits = mapExits
		map.nodes = nodes
		file:write("return " ..tableToString(map))
		file:close()
		outputLine = "Map file saved."
		saveFileName = filename
	end
end

function loadMap(filename)
	map = dofile(filename)
	nodes = map.nodes
	mapEntrances = map.mapEntrances
	mapExits = map.mapExits
	outputLine = "Map file loaded."
	
	for k, v in pairs(nodes) do
		if tonumber(k) and tonumber(k) > nameCounter then nameCounter = tonumber(k) end
		
		for ak, av in pairs(nodes[k].actions) do
			if tonumber(ak) and tonumber(ak) > nameCounter then nameCounter = tonumber(ak) end
		end
	end
end

function love.textinput(str)
	consoleInputLine = consoleInputLine .. str
end

function interpretCommand(str)
	local findDelim = str:find(":") or str:len()
	local command = str:sub(1, findDelim - 1):lower()
	if command == "loadbackground" then
		local filename = str:sub(findDelim+1)
		backgroundImage = love.graphics.newImage(filename)
	elseif command == "setaction" then
		if not selectedNode then
			outputLine = "no node selected"
		else
			local params = str:sub(findDelim+1)
			local findAmp = params:find("&") or params:len()
			local targetNode = params:sub(1, findAmp - 1)
			local newName = params:sub(findAmp + 1)
			
			local currentName = nil
			local mark = {}
			for k, v in pairs(nodes[selectedNode].actions) do
				if v == targetNode then
					mark[#mark + 1] = k
				end
			end
			
			for i = 1, #mark do
				nodes[selectedNode].actions[mark[i]] = nil
			end
			
			nodes[selectedNode].actions[newName] = targetNode
		end
	elseif command == "setspeedfactor" then
		if not selectedNode then
			outputLine = "no node selected"
		else
			local param = str:sub(findDelim+1)
			if param == "" then
				outputLine = "current speed factor for node " .. selectedNode .. ": " .. (nodes[selectedNode].speedFactor or "default")
			else
				nodes[selectedNode].speedFactor = tonumber(param)
				outputLine = "speed factor for node " .. selectedNode .. " set to: " .. tonumber(param)
			end
		end
	elseif command == "setname" then
		if not selectedNode then
			outputLine = "no node selected"
		else
			local name = str:sub(findDelim+1)
			
			if inSet(mapEntrances, selectedNode) then
				removeFromSet(mapEntrances, selectedNode)
				addToSet(mapEntrances, name)
			end
			
			if inSet(mapExits, selectedNode) then
				removeFromSet(mapExits, selectedNode)
				addToSet(mapExits, name)
			end
			
			nodes[name] = nodes[selectedNode]
			nodes[selectedNode] = nil
		end
	elseif command == "save" then
		local name = str:sub(findDelim+1)
		saveMap(name)
	elseif command == "load" then
		local name = str:sub(findDelim+1)
		loadMap(name)
	else
		outputLine = "Command not recognized."
	end
end

function tableToString(object, tab, level)
	tab = tab or "\t"
	level = level or 1
	local retval = "{ \n"
	for key, value in pairs(object) do
		local quotes = type(key) == "number" and "" or '"'
		retval = retval .. string.rep(tab, level) .. '[' .. quotes .. key .. quotes .. ']' .. " = "
		if type(value) == "table" then
			retval = retval .. tableToString(value, tab, level+1)
		elseif type(value) == "string" then
			retval = retval .. "\"" .. value .. "\""
		else
			retval = retval .. tostring(value)
		end
		retval = retval .. ", \n"
	end
	retval = retval .. string.rep(tab, level-1) .. "}"
	return retval
end

function addToSet(set, str)
	for i = 1, #set do
		if set[i] == str then return end
	end
	set[#set + 1] = str
end

function removeFromSet(set, str)
	for i = 1, #set do
		if set[i] == str then 
			table.remove(set, i)
			return
		end
	end
end

function inSet(set, str)
	for i = 1, #set do
		if set[i] == str then return true end
	end
	return false
end

function love.keypressed(key, isrepeat)
	if key == "return" then
		interpretCommand(consoleInputLine)
		consoleInputLine = ""
	end
	
	if love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl") then
		if key == "s" then
			if saveFileName then saveMap(saveFileName) end
		end
		
		if key == "r" then 
			editMode = "setReferenceKilometer" 
			outputLine = "edit mode: set reference kilometer (drag&drop)"
		end
		
		if key == "a" then 
			editMode = "addNodes"
			outputLine = "edit mode: add nodes (left click), remove nodes (right click)"
		end
		
		if key == "c" then 
			editMode = "connectNodes"
			outputLine = "edit mode: connect nodes (right click on node to connect to selected node) (from selected to right clicked)"
		end
		
		if key == "m" then
			if selectedNode then
				if inSet(mapEntrances, selectedNode) then 
					removeFromSet(mapEntrances, selectedNode)
				else
					addToSet(mapEntrances, selectedNode)
				end
			end
		end
		
		if key == "n" then
			if selectedNode then
				if inSet(mapExits, selectedNode) then 
					removeFromSet(mapExits, selectedNode)
				else
					addToSet(mapExits, selectedNode)
				end
			end
		end
		
		if key == "q" then
			if selectedNode then
				nodes[selectedNode].queueing = not nodes[selectedNode].queueing
			end
		end
	end
	
	if key == "backspace" then
		consoleInputLine = consoleInputLine:sub(1, consoleInputLine:len() - 1)
	end
end

function getName()
	nameCounter = nameCounter + 1
	return tostring(nameCounter)
end

function toWorldCoords(x, y)
	return {(x-love.window.getWidth()/2)/camera.scale+camera.position[1], (y-love.window.getHeight()/2)/camera.scale+camera.position[2]}
end

function toScreenCoords(x, y)
	return {(x-camera.position[1])*camera.scale+love.window.getWidth()/2, (y-camera.position[2])*camera.scale+love.window.getHeight()/2}
end

function love.mousepressed(x, y, button)
	if button == "wu" then camera.scale = camera.scale * 1.1 end
	if button == "wd" then camera.scale = camera.scale * 0.9 end
	
	local picked = pickNode(unpack(toWorldCoords(love.mouse.getPosition())))
	
	if button == "l" then
		selectedNode = picked
	end
	
	if editMode == "addNodes" then
		if not picked and button == "l" then
			nodes[getName()] = {pos = toWorldCoords(x, y), actions = {}}
		end
		
		if button == "r" and picked then
			nodes[picked] = nil
			selectedNode = nil
			removeFromSet(mapEntrances, picked)
			removeFromSet(mapExits, picked)
			
			for k, v in pairs(nodes) do
				if ak, av in pairs(nodes[k].actions) do -- only works if nodes are a single time connected
					if nodes[k].actions[ak] == picked then
						nodes[k].actions[ak] = nil
						break
					end
				end
			end
		end
	end
	
	if editMode == "connectNodes" and button == "r" and selectedNode and picked then
		nodes[selectedNode].actions[getName()] = picked
	end
end

function boolsToInt(a, b)
	return (a and 1 or 0) - (b and 1 or 0)
end

function pointInCircle(point, circle) 
	local rel = {circle[1] - point[1], circle[2] - point[2]}
	return rel[1]*rel[1] + rel[2]*rel[2] < circle[3]*circle[3] 
end

function pickNode(x, y)
	for k, v in pairs(nodes) do
		if pointInCircle({x, y}, {nodes[k].pos[1], nodes[k].pos[2], nodeRadius}) then
			return k
		end
	end
	return nil
end

function love.update()
	local move = {	boolsToInt(love.keyboard.isDown("right"), love.keyboard.isDown("left")), 
						boolsToInt(love.keyboard.isDown("down"), love.keyboard.isDown("up"))}
	local speed = 10.0
	camera.position = {camera.position[1] + move[1] * speed, camera.position[2] + move[2] * speed}
end