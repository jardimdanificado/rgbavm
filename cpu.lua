local memory = {}
local cpu = {}
local instruct = 
{
	0 = function(memory,x,y)
		memory[x][y] = nil
	end,
	1 = function(memory,x,y,value)
		memory[x][y] = value
	end,
	2 = function(memory,x,y,vx,vy)
		memory[x][y],memory[vx][vy] = memory[vx][vy],memory[x][y]
		
	end
}

--[[

0 D[RGBA] = delete
1 S[RGBA] = set
3 M[RGBA] = move

SRB 0.12 0.12
]]