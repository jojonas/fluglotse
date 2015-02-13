function randomChoice(array)
	return array[love.math.random(1,#array)]
end

function vectorNorm(array) 
	local sum = 0
	for i=1,#array do sum = sum + array[i]*array[i] end
	return math.sqrt(sum)
end

function vectorNormalized(array)
	local n = vectorNorm(array)
	local out = {}
	for i=1,#array do out[i]=array[i]/n end
	return out
end

function randomCharacter()
	return string.char(love.math.random(string.byte("A"), string.byte("Z")))
end

function loveDoFile(filename)
	return assert(loadstring(love.filesystem.read(filename), filename))()
end

function clamp(value, low, hi)
	return math.max(low, math.min(value, hi))
end