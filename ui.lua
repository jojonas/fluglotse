local uiHeight = 200
local planeListWidth = 100
local borderColor = {0, 255, 0, 255}
local fillerColor = {50, 50, 50, 255}
local hoverColors = {borderColor, {100, 100, 100, 255}}
local rectBorder = 1
local uiElementsMargin = 2
local numButtonsX = 3
local numButtonsY = 3
local buttonMargin = 3
local elementsInList = 8
local listElementMargins = 2
local scrollButtonWidth = 20
uiSelectedListElement = 1
local uiListElementOffset = 0
local lastLeftMouseDown = false
local lastPressedMap = {}

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
	
	return (wx-w/2)*scale+gw/2, (wy-h/2)*scale+gh/2
end

function toWorldCoordinates(sx, sy)
	local map = currentMap 
	
	local w = map.bounds[2][1] - map.bounds[1][1]
	local h = map.bounds[2][2] - map.bounds[1][2]
	local gw, gh = getGameViewDimensions()
	local scale = math.min(gh/h, gw/w)
	
	return (sx-gw/2)/scale+w/2, (sy-gh/2)/scale+h/2
end

function drawUI()
	local map = currentMap
	
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
		love.graphics.printf(map.planes[i + uiListElementOffset].identifier, uiElementsMargin + listElementMargins, 
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
					
					if button(action.name .. " [" .. action.shortcut .. "]", x, y, w, h) or love.keyboard.isDown(action.shortcut) and not lastPressedMap[action.shortcut] then
						selectedPlane.nextAction = actionId
						postMessage("Tower: " .. selectedPlane.identifier .. ", " .. action.message)
					end
				end
			end
			buttonIndex = buttonIndex + 1
		end
	end
	
	for i = 1, #actionOrder do
		local key = actions[actionOrder[i]].shortcut
		lastPressedMap[key] = love.keyboard.isDown(key)
	end
	
	lastLeftMouseDown = love.mouse.isDown("l")
	
	for i=1,#map.planes do
		local plane = map.planes[i]
		local x, y = toScreenCoordinates(plane.drawPos[1]-plane.size/2, plane.drawPos[2]-plane.size-5, plane.size, "center")
		love.graphics.print(plane.identifier, x, y)
	end
end

function love.mousepressed(x,y,button)
	if button == "l" then
		local wx, wy = toWorldCoordinates(x,y)
		for i=1,#currentMap.planes do
			local plane = currentMap.planes[i]
			local dist = vectorNorm({wx-plane.pos[1], wy-plane.pos[2]})
			if dist < plane.size/2 then
				uiSelectedListElement = i
				break
			end
		end
	end
end