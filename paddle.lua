local love = require("love")
local vec2 = require("vec2")

local paddle = {}

function paddle.new()
    local newPaddle = {
        position = vec2.new(0, 0);
        color = "blue";
    }
    -- Paddle functions
    function newPaddle.update(delta)

    end

    function newPaddle.draw()

    end

    return newPaddle
end

return paddle
