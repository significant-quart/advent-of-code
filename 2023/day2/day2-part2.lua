local util = require("../../util/util")


local sum = 0


do
    local cubeCount

    for _, l in ipairs(util.split(util.read(2023, 2), "\n")) do
        cubeCount = { r = 0, g = 0, b = 0}

        for cubes, colour, eog in l:gmatch("%s(%d+) ([rgb])[a-z]+(;?)") do
            cubes = tonumber(cubes)

            if cubes > cubeCount[colour] then
                cubeCount[colour] = cubes
            end
        end

        sum = sum + (cubeCount["r"] * cubeCount["g"] * cubeCount["b"])
    end
end


p(sum)