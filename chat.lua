local maxMessages = 10
local chatWidth = 400
local xMargin = 10
local yMargin = 10

function limitMessages(N)
	while #currentMap.messages > N do
		table.remove(currentMap.messages, 1)
	end
end

function postMessage(text) 
	table.insert(currentMap.messages, text)
	limitMessages(maxMessages)
end

function drawChat() 
	love.graphics.setColor({255,255,255})
	local text = ""
	for i=1,#currentMap.messages do
		text = text .. currentMap.messages[i] .. "\n"
	end
	love.graphics.printf(text, love.graphics.getWidth() - chatWidth - xMargin, yMargin, chatWidth, "left")
end