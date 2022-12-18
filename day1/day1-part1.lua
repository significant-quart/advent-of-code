local util = require("../util/util")


local maxCalories = 0


do
    local elfCalories = 0

    for i, l in ipairs(util.split(util.read(1), "\n")) do

        -- if EOL then find maximum between current highest and current count
        if l == "\r" then
            maxCalories = math.max(elfCalories, maxCalories)
            elfCalories = 0
        else
            elfCalories = elfCalories + tonumber(l)
        end
    end
end


p(maxCalories)