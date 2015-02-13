local maxMessages = 10
local chatWidth = 600
local xMargin = 10
local yMargin = 10

local hsvColors = {
	["System"] = {0, 255, 255, fix=true},
	["Tower"] = {0, 0, 255, fix=true},
}

function colorFromName(name, bright)
	if bright == nil then bright = false end
	
	assert(name, "Nil is not a name.")
	if not hsvColors[name] then
		local hue = love.math.random(0,255)
		local saturation = 80
		local value = 150
		hsvColors[name] = {hue, saturation, value}
	end
	
	local hsv = hsvColors[name]
	if bright and not hsv.fix then
		return {hsvToRgb(hsv[1], 80, 255)}
	else
		return {hsvToRgb(unpack(hsv))}
	end
end

function limitMessages(N)
	while #currentMap.messages > N do
		table.remove(currentMap.messages, 1)
	end
end

function postMessage(source, text) 
	local message = {source=source, text=text}
	table.insert(currentMap.messages, message)
	limitMessages(maxMessages)
end

function drawChat() 
	local text = ""
	local font = love.graphics.getFont()
	local lineIndex = 0
	for i=1,#currentMap.messages do
		local message = currentMap.messages[i]
		love.graphics.setColor(colorFromName(message.source, true))
		local text = message.source .. ": " .. message.text
		local _, lineCount = font:getWrap(text, chatWidth)
		love.graphics.printf(text, xMargin, yMargin + font:getHeight() * lineIndex, chatWidth, "left")
		lineIndex = lineIndex + lineCount
	end
end