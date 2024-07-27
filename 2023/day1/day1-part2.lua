local util = require("../../util/util")


local WORD_DIGIT_MAP = {
    ["one"] = "1",
    ["two"] = "2",
    ["three"] = "3",
    ["four"] = "4",
    ["five"] = "5",
    ["six"] = "6",
    ["seven"] = "7",
    ["eight"] = "8",
    ["nine"] = "9"
}

local WORD_MIN_LENGTH, WORD_MAX_LENGTH = 3, 5

local sum = 0


do
    local currentChar, currentWord

    local current, first

    for _, l in ipairs(util.split(util.read(2023, 1), "\n\r?")) do
        current, first = nil, nil

        for i = 1, #l do
            currentChar = l:sub(i, i)

            if currentChar:match("%d") then
                current = currentChar
            else
                for y = WORD_MIN_LENGTH, WORD_MAX_LENGTH do
                    currentWord = l:sub(i, i + (y - 1))

                    if WORD_DIGIT_MAP[currentWord] then
                        current = WORD_DIGIT_MAP[currentWord]

                        break
                    end
                end
            end

            if first == nil then
                first = current
            end
        end

        sum = sum + tonumber(first .. current)
    end
end


p(sum)