local util = require "util"
local machine = require "cpu"

function love.load()
end

function love.keypressed(key)
end

local teste = 1

function love.update()
end

function love.draw()
	machine.instruct.SET(util.random(0,love.graphics.getWidth()),util.random(0,love.graphics.getHeight()),util.random(0,1),util.random(0,1),util.random(0,1),util.random(0,1))
	love.graphics.points(machine.memory)
	love.graphics.print("Current FPS: " .. tostring(love.timer.getFPS()), 1, 1)
end
