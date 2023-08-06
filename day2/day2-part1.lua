local util = require("../util/util")


local CHAR_MAP = {
    ["A"] = "X",
    ["B"] = "Y",
    ["C"] = "Z"
}

local LOSE_MAP = {
    ["A"] = "Z",
    ["B"] = "X",
    ["C"] = "Y"
}


local totalScore = 0


do
    for i, l in ipairs(util.split(util.read(2), "\r\n")) do
        local opp, me = l:match("(%w) (%w)")

        -- calculate total score by adding character byte decimal value minus 87 (X=88, Y=89, Z=90) to the result of the game found with CHAR_MAP and COUNTER_MAP
        totalScore = totalScore + (string.byte(me) - 87) + (CHAR_MAP[opp] == me and 3 or LOSE_MAP[opp] ~= me and 6 or 0)
    end
end


p(totalScore)