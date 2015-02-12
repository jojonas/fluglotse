local uiHeight = 200
local planeListWidth = 200
local borderColor = {0, 255, 0, 255}
local fillerColor = {50, 50, 50, 255}
local hoverColors = {borderColor, {100, 100, 100, 255}}
local rectBorder = 1
local uiElementsMargin = 2
local buttonNames = {"Takeoff permission granted.", "Taxi off the runway.", "Change runway.", "DUWÄKKEDUWOPPE", "10$ hanging from my anus", "penis", "Fukboi"}
local buttonKeyMap = {"u", "i", "o", "p", "j", "k", "l"}
local numButtonsX = 3
local numButtonsY = 3
local buttonMargin = 3
local elementsInList = 8
local listElementMargins = 2
local scrollButtonWidth = 20
uiListElements = {"RX-Cock", "JK-Penis", "jj", "kk", "zz", "pp", "hh", "jpolk", "jkfdlöa", "Hund", "Katze", "Fisch"}
uiSelectedListElement = 2
local uiListElementOffset = 0
local lastLeftMouseDown = false

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
	local colors = hovered and hoverColors or {borderColor, fillerColor}
	drawBorderRect(x, y, w, h, unpack(colors))
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.printf(text, x, y + h/2 - 7, w, "center")
	
	return hovered and love.mouse.isDown("l") and not lastLeftMouseDown
end

function drawUI()
	local uiStartY = love.window.getHeight() - uiHeight
	
	drawBorderRect(0, uiStartY, love.window.getWidth(), uiHeight, borderColor, fillerColor)
	
	local scrollX = uiElementsMargin + planeListWidth - scrollButtonWidth
	local scrollY = uiStartY + uiElementsMargin
	local scrollW = scrollButtonWidth
	local scrollH = (uiHeight - 2*uiElementsMargin) / 2
	if button("/\\", scrollX, scrollY, scrollW, scrollH) then 
		uiListElementOffset = math.max(uiListElementOffset - 1, 0) end
	if button("\\/", scrollX, scrollY + scrollH, scrollW, scrollH) then 
		uiListElementOffset = math.min(uiListElementOffset + 1, #uiListElements - elementsInList) end
	
	drawBorderRect(uiElementsMargin, uiStartY + uiElementsMargin, planeListWidth - scrollButtonWidth, uiHeight - 2*uiElementsMargin, borderColor, fillerColor)
	local listElementHeight = (uiHeight - uiElementsMargin * 2) / elementsInList
	for i = 1, math.min(elementsInList, #uiListElements) do
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
		love.graphics.printf(uiListElements[i + uiListElementOffset], uiElementsMargin + listElementMargins, 
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
			local buttonText = buttonNames[buttonIndex]
			if buttonText then
				local x = buttonFieldX + buttonSizeW*xButton + buttonMargin/2
				local y = buttonFieldY + buttonSizeH*yButton + buttonMargin/2
				local w = buttonSizeW - buttonMargin
				local h = buttonSizeH - buttonMargin
				
				if button(buttonText, x, y, w, h) or love.keyboard.isDown(buttonKeyMap[buttonIndex]) then
					if true then -- check if option is valid
						print(buttonText)
					end
				end
			end
			buttonIndex = buttonIndex + 1
		end
	end
	
	lastLeftMouseDown = love.mouse.isDown("l")
end