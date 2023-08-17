local util = require "util"

--local memory = util.array.new(640*360,{1,1,22,22,22,225})
local memory = {}
local pointer = {}

--[[
local f = 0
for y = 0, 360, 1 do
	for x = 0, 640, 1 do
		f = f + 1
		memory[f] = {x,y,util.math.regrad3(1,640,x),util.math.regrad3(1,360,y),255,255}
	end
end
]]

local instruct =
{
	SET = function(x,y,r,g,b,a)
		if pointer[x .. 'x' .. y] then
			local p = memory[pointer[x .. 'x' .. y]]
			memory[p] = {x,y,r,g,b,a}
		else
			pointer[x .. 'x' .. y] = #memory + 1
			table.insert(memory,{x,y,r,g,b,a})
		end
	end,
	MOVE = function(x,y,vx,vy)
		local p1,p2 = memory[pointer[x .. 'x' .. y]],memory[pointer[vx .. 'x' .. vy]]
		memory[p1],memory[p2] = memory[p2],memory[p1]
		memory[x][y],memory[vx][vy] = memory[vx][vy],memory[x][y]
	end
}

return 
{
	instruct = instruct,
	memory = memory,
	pointer = pointer
}