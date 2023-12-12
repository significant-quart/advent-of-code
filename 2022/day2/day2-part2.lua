local util = require("../../util/util")


local LOSE_MAP = {
    ["A"] = "Z",
    ["B"] = "X",
    ["C"] = "Y"
}

local WIN_MAP = {
    ["A"] = "Y",
    ["B"] = "Z",
    ["C"] = "X"
}

local DECISION_SCORE = {
    ["X"] = 0,
    ["Y"] = 3,
    ["Z"] = 6
}


local totalScore = 0


do
    for i, l in ipairs(util.split(util.read(2022, 2), "\r\n")) do
        local opp, decision = l:match("(%w) (%w)")

        -- determine our hand based on decision of game
        -- in the case of a draw, simply use the letter at the opposite side of the alphabet (A=X,B=Y,C=Z)
        local me = (decision == "X" and LOSE_MAP[opp] or decision == "Y" and string.char(string.byte(opp) + 23) or WIN_MAP[opp])

        totalScore = totalScore + (string.byte(me) - 87) + (DECISION_SCORE[decision])
    end
end


p(totalScore)