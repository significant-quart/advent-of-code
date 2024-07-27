local util = require("../../util/util")


local sum = 0


do
    local digitsOnly

    for _, l in ipairs(util.split(util.read(2023, 1), "\n")) do

        -- strip line of non-digit characters
        digitsOnly = l:gsub("[^%d+]", "")

        sum = sum + tonumber(digitsOnly:sub(1, 1) .. digitsOnly:sub(#digitsOnly, #digitsOnly))
    end
end


p(sum)