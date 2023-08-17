local util = require "util"
local machine = require "cpu"

function love.load()
end

function love.keypressed(key)
end

function love.update()
end

function love.draw()
	--machine.instruct.SET(util.random(0,love.graphics.getWidth()/love.graphics.getPointSize()),util.random(0,love.graphics.getHeight()/love.graphics.getPointSize()),util.random(0,1),util.random(0,1),util.random(0,1),util.random(0,1))
	love.graphics.points(machine.memory)
	love.graphics.print("Current FPS: " .. tostring(love.timer.getFPS()), 1, 1)
end
