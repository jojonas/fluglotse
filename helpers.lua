function randomChoice(array)
	return array[love.math.random(1,#array)]
end

function norm(array) 
	return math.sqrt(array[1]*array[1] + array[2]*array[2])
end

function normalized(array)
	local n = norm(array)
	return {array[1]/n, array[2]/n}
end