local love = require("love")
local vec2 = require("vec2")

local paddle = {
    blueImg = love.graphics.newImage("images/paddleBlue.png");
    redImg = love.graphics.newImage("images/paddleRed.png");
}

function paddle.new()
    local newPaddle = {
        position = vec2.new(0, 0);
        color = "blue";
    }
    -- Paddle functions
    function newPaddle.update(delta)
        -- Get input keys based on color
        local inputUp ; local inputDown
        if newPaddle.color == "blue" then
            inputUp = "w" ; inputDown = "s"
        else
            inputUp = "up" ; inputDown = "down"
        end
        -- Paddle movement
        local speed = 210
        local pHeight = paddle.blueImg:getHeight()
        if love.keyboard.isDown(inputDown) then
            newPaddle.position.y = newPaddle.position.y + speed * delta
        elseif love.keyboard.isDown(inputUp) then
            newPaddle.position.y = newPaddle.position.y - speed * delta
        end
        -- Make sure paddle stays on screen
        if newPaddle.position.y < pHeight/2 + 6 then
            newPaddle.position.y = pHeight/2 + 6
        elseif newPaddle.position.y > 534 - pHeight/2 then
            newPaddle.position.y = 534 - pHeight/2
        end
    end

    function newPaddle.draw()
        local pWidth = paddle.blueImg:getWidth()
        local pHeight = paddle.blueImg:getHeight()
        -- Get image based on color
        local img
        if newPaddle.color == "blue" then
            img = paddle.blueImg
        else img = paddle.redImg end
        -- Draw paddle
        love.graphics.draw(
            img,
            newPaddle.position.x, newPaddle.position.y,
            0, 1, 1, pWidth/2, pHeight/2
        )
    end

    return newPaddle
end

return paddle
