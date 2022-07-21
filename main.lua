local love = require("love")
local paddle = require("paddle")

local paddleBlue
local paddleRed

function love.load()
    paddleBlue = paddle.new()
    paddleBlue.color = "blue"
    paddleBlue.position.x = 12
    paddleBlue.position.y = 270

    paddleRed = paddle.new()
    paddleRed.color = "red"
    paddleRed.position.x = 946
    paddleRed.position.y = 270
end

function love.update(delta)
    paddleBlue.update(delta)
    paddleRed.update(delta)
end

function love.draw()
    -- Draw sides
    -- Draw paddles
    paddleBlue.draw()
    paddleRed.draw()
end
