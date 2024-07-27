local util = require("../../util/util")


local MAX_CUBES_MAP = {
    ["r"] = 12,
    ["g"] = 13,
    ["b"] = 14
}


local sum = 0


do
    local gameId

    for _, l in ipairs(util.split(util.read(2023, 2), "\n")) do
        gameId = tonumber(l:match("^Game (%d+)"))

        for cubes, colour, eog in l:gmatch("%s(%d+) ([rgb])[a-z]+(;?)") do
            if tonumber(cubes) > MAX_CUBES_MAP[colour] then
                sum = sum - gameId

                break
            end
        end

        sum = sum + gameId
    end
end


p(sum)