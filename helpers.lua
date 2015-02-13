function hsvToRgb(h, s, v) -- from https://love2d.org/wiki/HSV_color
    if s <= 0 then return v,v,v end
    h, s, v = h/256*6, s/255, v/255
    local c = v*s
    local x = (1-math.abs((h%2)-1))*c
    local m,r,g,b = (v-c), 0,0,0
    if h < 1     then r,g,b = c,x,0
    elseif h < 2 then r,g,b = x,c,0
    elseif h < 3 then r,g,b = 0,c,x
    elseif h < 4 then r,g,b = 0,x,c
    elseif h < 5 then r,g,b = x,0,c
    else              r,g,b = c,0,x
    end return (r+m)*255,(g+m)*255,(b+m)*255
end

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