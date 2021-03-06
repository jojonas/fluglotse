local uiHeight = 200
local planeListWidth = 100
local borderColor = {47,255,136,255}
local fillerColor = {50, 50, 50, 255}
local hoverColors = {borderColor, {100, 100, 100, 255}}
local rectBorder = 1
local uiElementsMargin = 2
local numButtonsX = 4
local numButtonsY = 4
local buttonMargin = 3
local elementsInList = 8
local listElementMargins = 2
local scrollButtonWidth = 20
uiSelectedListElement = 1
local uiListElementOffset = 0
local lastLeftMouseDown = false
local showKeyboardShortcuts = true
local lastPressedMap = {}

local uiFont = love.graphics.newFont("EffectsEighty.ttf", 18)
local scoreFont = love.graphics.newFont("EffectsEighty.ttf", 30)

function getGameViewDimensions()
	return love.window.getWidth(), love.window.getHeight() - uiHeight
end

function drawBorderRect(x, y, w, h, borderColor, fillerColor)
	love.graphics.setColor(unpack(borderColor))
	love.graphics.rectangle("fill", x, y, w, h)
	love.graphics.setColor(unpack(fillerColor))
	love.graphics.rectangle("fill", x + rectBorder, y + rectBorder, w - rectBorder*2, h - rectBorder*2)
end

function pointInRect(point, rect) -- rect = {x, y, w, h}
	return point[1] > rect[1] and point[1] < rect[1] + rect[3] and point[2] > rect[2] and point[2] < rect[2] + rect[4]
end

function button(text, x, y, w, h)
	local hovered = pointInRect({love.mouse.getPosition()}, {x, y, w, h})
	local mousedown = hovered and love.mouse.isDown("l")
	local clicked = mousedown and not lastLeftMouseDown
	
	if mousedown then
		x = x + 1
		y = y + 1
		w = w - 2
		h = h - 2
	end
	
	local colors = hovered and hoverColors or {borderColor, fillerColor}
	drawBorderRect(x, y, w, h, unpack(colors))
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.printf(text, x, y + h/2 - 7, w, "center")
	
	return clicked
end

function toScreenCoordinates(wx, wy)
	local map = currentMap 
	
	local w = map.bounds[2][1] - map.bounds[1][1]
	local h = map.bounds[2][2] - map.bounds[1][2]
	local gw, gh = getGameViewDimensions()
	local scale = math.min(gh/h, gw/w)
	
	return (wx-map.bounds[1][1]-w/2)*scale+gw/2, (wy-map.bounds[1][2]-h/2)*scale+gh/2
end

function toWorldCoordinates(sx, sy)
	local map = currentMap 
	
	local w = map.bounds[2][1] - map.bounds[1][1]
	local h = map.bounds[2][2] - map.bounds[1][2]
	local gw, gh = getGameViewDimensions()
	local scale = math.min(gh/h, gw/w)
	
	return (sx-gw/2)/scale+w/2+map.bounds[1][1], (sy-gh/2)/scale+h/2+map.bounds[1][2]
end

function drawUI()
	local map = currentMap
	
	local text = "$" .. tostring(map.score) 
	local padding = 15
	local scoreW, scoreH = scoreFont:getWidth(text)+padding, scoreFont:getHeight()+padding
	
	drawBorderRect(love.window.getWidth()-scoreW, 0, scoreW, scoreH, borderColor, fillerColor)
	love.graphics.setColor(255,255,255,255)
	love.graphics.setFont(scoreFont)
	love.graphics.printf(text, love.window.getWidth()-scoreW, padding/2, scoreW, "center")

	love.graphics.setFont(uiFont)
	
	local uiStartY = love.window.getHeight() - uiHeight
	
	drawBorderRect(0, uiStartY, love.window.getWidth(), uiHeight, borderColor, fillerColor)
	
	local scrollX = uiElementsMargin + planeListWidth - scrollButtonWidth
	local scrollY = uiStartY + uiElementsMargin
	local scrollW = scrollButtonWidth
	local scrollH = (uiHeight - 2*uiElementsMargin) / 2
	if button("/\\", scrollX, scrollY, scrollW, scrollH) then 
		uiListElementOffset = math.max(uiListElementOffset - 1, 0) end
	if button("\\/", scrollX, scrollY + scrollH, scrollW, scrollH) then 
		uiListElementOffset = math.max(0, math.min(uiListElementOffset + 1, #map.planes - elementsInList)) end
	
	drawBorderRect(uiElementsMargin, uiStartY + uiElementsMargin, planeListWidth - scrollButtonWidth, uiHeight - 2*uiElementsMargin, borderColor, fillerColor)
	local listElementHeight = (uiHeight - uiElementsMargin * 2) / elementsInList
	for i = 1, math.min(elementsInList, #map.planes) do
		local rectX = uiElementsMargin + listElementMargins
		local rectY = uiStartY + uiElementsMargin + listElementMargins + listElementHeight * (i-1)
		local rectW = planeListWidth - listElementMargins*2 - scrollButtonWidth
		local rectH = listElementHeight
		
		if pointInRect({love.mouse.getPosition()}, {rectX, rectY, rectW, rectH}) and love.mouse.isDown("l") then
			uiSelectedListElement = i + uiListElementOffset
		end
		
		if i + uiListElementOffset == uiSelectedListElement then
			drawBorderRect(rectX, rectY, rectW, rectH, borderColor, fillerColor)
		end
		
		love.graphics.setColor(255, 255, 255, 255)
		
		local planeIndex = i + uiListElementOffset
		local label = map.planes[planeIndex].identifier
		if showKeyboardShortcuts and planeIndex <= 9 then
			label = label .. " [" .. planeIndex .. "]"
		end
		love.graphics.printf(label, uiElementsMargin + listElementMargins, 
									uiStartY + uiElementsMargin + listElementMargins + listElementHeight * (i-1) + 4, 
									planeListWidth - listElementMargins*2 - scrollButtonWidth, "center")
	end
	
	local buttonFieldX = uiElementsMargin + planeListWidth + buttonMargin
	local buttonFieldY = uiStartY + buttonMargin
	local buttonFieldW = love.window.getWidth() - buttonFieldX - buttonMargin
	local buttonFieldH = love.window.getHeight() - buttonFieldY - buttonMargin
	local buttonSizeW = buttonFieldW / numButtonsX
	local buttonSizeH = buttonFieldH / numButtonsY
	local buttonIndex = 1
	for xButton = 0, numButtonsX - 1 do
		for yButton = 0, numButtonsY - 1 do
			local actionId = actionOrder[buttonIndex]
			if actionId then
				local selectedPlane = map.planes[uiSelectedListElement]
				if selectedPlane and selectedPlane.target.actions[actionId] ~= nil then
					local action = actions[actionId]
					
					local x = buttonFieldX + buttonSizeW*xButton + buttonMargin/2
					local y = buttonFieldY + buttonSizeH*yButton + buttonMargin/2
					local w = buttonSizeW - buttonMargin
					local h = buttonSizeH - buttonMargin
					
					local label = action.name .. (showKeyboardShortcuts and " [" .. action.shortcut:upper() .. "]" or "")
					if button(label, x, y, w, h) then
						activateAction(actionId)
					end
				end
			end
			buttonIndex = buttonIndex + 1
		end
	end
	
	lastLeftMouseDown = love.mouse.isDown("l")

	love.graphics.setColor(255, 255, 255, 255)
	for i=1,#map.planes do
		local plane = map.planes[i]
		drawPlaneLabel(plane)
	end
	
	if uiSelectedListElement >= 1 and uiSelectedListElement <= #map.planes then
		love.graphics.setColor(47,255,136,255)
		drawPlaneLabel(map.planes[uiSelectedListElement])
	end
	
	if map.score < 0 then
		local w,h = love.graphics.getDimensions()
		love.graphics.setColor(0,0,0,200)
		love.graphics.rectangle("fill", 0, 0, w, h)
		love.graphics.setColor(47,255,136,255)
		love.graphics.setFont(scoreFont)
		love.graphics.printf("You're broke. Game over!\nPress space to restart.", 0, h/2 - love.graphics.getFont():getHeight(), w, "center")
		love.graphics.setFont(uiFont)
	end
end

function drawPlaneLabel(plane)
	local label = plane.identifier 
	local index = getPlaneIndex(plane)
	if showKeyboardShortcuts and index <= 9 then
		label = label .. " [" .. index .. "]"
	end
	
	local stretch = 11.0
	local x, y = toScreenCoordinates(plane.drawPos[1]-plane.hardRadius*stretch, plane.drawPos[2])
	local dx = toScreenCoordinates(plane.drawPos[1]+plane.hardRadius*stretch, 0)
	--love.graphics.circle("fill", x + (dx-x)/2, y, 10, 10)
	love.graphics.printf(label, x, y + 12 * (plane.labelOffsetCounter%2==0 and -1 or 1) - love.graphics.getFont():getHeight()/2, dx - x, "center")
end

function activateAction(actionId) 
	local selectedPlane = currentMap.planes[uiSelectedListElement]
	if selectedPlane and selectedPlane.target.actions[actionId] ~= nil then
		selectedPlane.nextAction = actionId
		postMessage("Tower", selectedPlane.identifier .. ", " .. actions[actionId].message)
	end
end



function changeSelectedElementTo(val)
	uiSelectedListElement = clamp(val , 1, #currentMap.planes)
	
	if uiSelectedListElement > uiListElementOffset+elementsInList then
		uiListElementOffset = uiSelectedListElement-elementsInList
	elseif uiSelectedListElement <= uiListElementOffset then
		uiListElementOffset = uiSelectedListElement-1
	end
end

function changeSelectedElementBy(val)
	changeSelectedElementTo(uiSelectedListElement + val)
end

function love.mousepressed(x,y,button)
	if button == "l" then
		local w, h = getGameViewDimensions()
		if x<w and y<h then
			uiSelectedListElement = -1
			local wx, wy = toWorldCoordinates(x,y)
			for i=1,#currentMap.planes do
				local plane = currentMap.planes[i]
				local dist = vectorNorm({wx-plane.drawPos[1], wy-plane.drawPos[2]})
				if dist < plane.hardRadius then
					uiSelectedListElement = i
					break
				end
			end
		end
	end
end

function love.keypressed(key, isrepeat)
	for i = 1, #actionOrder do
		local actionId = actionOrder[i]
		local action = actions[actionId]
		if action then
			local shortcut = action.shortcut
			if key == shortcut then
				activateAction(actionId)
			end
		end
	end
	
	if key == "up" then
		changeSelectedElementBy(-1)
	elseif key == "down" then
		changeSelectedElementBy(1)
	elseif key == "pageup" then
		changeSelectedElementBy(-elementsInList)
	elseif key == "pagedown" then
		changeSelectedElementBy(elementsInList)
	elseif key == "home" then
		changeSelectedElementTo(1)
	elseif key == "end" then
		changeSelectedElementTo(#currentMap.planes)
	elseif key == "lalt" or key == "ralt" then
		showKeyboardShortcuts = not showKeyboardShortcuts
	elseif key == "escape" then
		love.event.push("quit")
	else
		for i=1,9 do
			if key == tostring(i) or key == "kp" .. tostring(i) then
				changeSelectedElementTo(i)
			end
		end
	end
end