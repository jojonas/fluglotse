local maxMessages = 10
local chatWidth = 600
local xMargin = 10
local yMargin = 10

local colors = {
	["System"] = {255, 0, 0},
	["Tower"] = {255, 255, 255},
}

function colorFromName(name)
	if not colors[name] then
		repeat 
			colors[name] = {love.math.random(0,255), love.math.random(0,255), love.math.random(0,255)}
		until vectorNorm(colors[name]) > 100
	end
	assert(colors[name], "Color hash not generated")
	return colors[name]
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
		love.graphics.setColor(colorFromName(message.source))
		local text = message.source .. ": " .. message.text
		local _, lineCount = font:getWrap(text, chatWidth)
		love.graphics.printf(text, xMargin, yMargin + font:getHeight() * lineIndex, chatWidth, "left")
		lineIndex = lineIndex + lineCount
	end
end