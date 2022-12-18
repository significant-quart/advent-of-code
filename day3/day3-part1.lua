local util = require("../util/util")


local prioritySum = 0


do
    for i, l in ipairs(util.split(util.read(3), "\r\n")) do
        local indexedChars = {}
        local midPoint = #l / 2

        for y = 1, #l do
            local char = l:sub(y, y)

            -- first have index char else if past midpoint and char exists it is added to the priority
            if indexedChars[char] and y > midPoint then
                local charByte = string.byte(char)

                prioritySum = prioritySum + (charByte >= 97 and charByte - 96 or charByte - 38)

                break
            elseif y <= midPoint then
                indexedChars[char] = 1
            end
        end
    end
end


p(prioritySum)