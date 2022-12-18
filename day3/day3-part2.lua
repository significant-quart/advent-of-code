local util = require("../util/util")


local prioritySum = 0


do
    local indexedChars = {}

    for i, l in ipairs(util.split(util.read(3), "\r\n")) do
        local relativeIndex = (i % 3) + (i % 3 == 0 and 3 or 0)

        for y = 1, #l do
            local char = l:sub(y, y)

            if indexedChars[char] == nil and relativeIndex == 1 or indexedChars[char] == (relativeIndex - 1) then
                indexedChars[char] = relativeIndex

                if relativeIndex == 3 then
                    local charByte = string.byte(char)

                    prioritySum = prioritySum + (charByte >= 97 and charByte - 96 or charByte - 38)

                    indexedChars = {}

                    break
                end
            end
        end
   end
end


p(prioritySum)