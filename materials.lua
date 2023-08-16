
local util = require('util')
local rgb = function (r,g,b,a)
    return 
    {
        util.math.regrad3(1,255,r),
        util.math.regrad3(1,255,g),
        util.math.regrad3(1,255,b),
        util.math.regrad3(1,255,a or 255),
    }
end

local function grainbehavior(session,grain,)
	local xm, ym = grain[1] + gdirections[session.gdirection][2][1], grain[2] + gdirections[session.gdirection][2][2]
	local xl, yl = grain[1] + gdirections[session.gdirection][1][1], grain[2] + gdirections[session.gdirection][1][2]
	local xr, yr = grain[1] + gdirections[session.gdirection][3][1], grain[2] + gdirections[session.gdirection][3][2]
	if grain[2] <= session.height then
		if session.map[xm] and session.map[xm][ym] and (session.map[xm][ym].density < session.map[grain[1]][grain[2]].density) then
			gravit(grain, xm, ym)
		elseif session.map[xl] and session.map[xl][yl] and (session.map[xl][yl].density < session.map[grain[1]][grain[2]].density) then
			gravit(grain, xl, yl)
		elseif session.map[xr] and session.map[xr][yr] and (session.map[xr][yr].density < session.map[grain[1]][grain[2]].density) then
			gravit(grain, xr, yr)
		end
	end
end

local material = {}
material.air =
{
    color = rgb(0, 0, 0, 0),
    density = 0,
	behavior = function(){}
}
material.sand =
{
    color = rgb(187, 184, 125),
    density = 1.6
}
material.stone =
{
    color = rgb(114, 114, 114),
    density = 2.6
}
material.dirt =
{
    color = rgb(71, 54, 23),
    density = 1.6
}
return material