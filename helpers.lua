function randomChoice(array)
	return array[love.math.random(1,#array)]
end

function vectorNorm(array) 
	return math.sqrt(array[1]*array[1] + array[2]*array[2])
end

function vectorNormalized(array)
	local n = vectorNorm(array)
	return {array[1]/n, array[2]/n}
end