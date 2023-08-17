local util = require "util"

--local memory = util.array.new(640*360,{1,1,22,22,22,225})
local memory = {}
local pointer = {}

love.graphics.setPointSize(4)

local f = 0
for y = 0, 360/love.graphics.getPointSize(), 1 do
	for x = 0, 640/love.graphics.getPointSize(), 1 do
		f = f + 1
		memory[f] = {x*love.graphics.getPointSize(),y*love.graphics.getPointSize(),util.math.regrad3(1,640/love.graphics.getPointSize(),x),util.math.regrad3(1,360/love.graphics.getPointSize(),y),1,1}
		pointer[x .. 'x' .. y] = #memory + 1
	end
end

local instruct =
{
	SET = function(x,y,r,g,b,a)
		if pointer[x .. 'x' .. y] then
			local p = memory[pointer[x .. 'x' .. y]]
			memory[p] = {x,y,r,g,b,a}
		else
			pointer[x .. 'x' .. y] = #memory + 1
			table.insert(memory,{x*love.graphics.getPointSize(),y*love.graphics.getPointSize(),r,g,b,a})
		end
	end,
	MOVE = function(x,y,vx,vy)
		local p1,p2 = memory[pointer[x .. 'x' .. y]],memory[pointer[vx .. 'x' .. vy]]
		memory[p1],memory[p2] = memory[p2],memory[p1]
	end
}

return 
{
	instruct = instruct,
	memory = memory,
	pointer = pointer
}