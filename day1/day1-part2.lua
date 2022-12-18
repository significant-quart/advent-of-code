local util = require("../util/util")


local topThree = { 0, 0, 0 }


do
    local elfCalories = 0

    for i, l in ipairs(util.split(util.read(1), "\n")) do
        if l == "\r" then
            for y = 1, 3 do
                if elfCalories > topThree[y] then

                    -- eject smallest from top three
                    if y <= 2 then
                        for z = 3, y, -1 do
                            topThree[z] = topThree[z - 1]
                        end
                    end

                    topThree[y] = elfCalories

                    break
                end
            end

            elfCalories = 0
        else
            elfCalories = elfCalories + tonumber(l)
        end
    end
end


p(topThree[1] + topThree[2] + topThree[3])