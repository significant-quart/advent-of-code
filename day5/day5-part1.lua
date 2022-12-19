local util = require("../util/util")


local stacks = {}
local top = ""


do
    local input = util.read(5)

    local rows, cols
    cols = tonumber(input:match("%s(%d)%s\r\n"))

    for i, l in ipairs(util.split(util.read(5), "\r?\n")) do
        if rows == nil then
            -- we check if we found collumn headings and that is the line number which equals the number of rows + 1
            if l:match("^%s%d%s") then
                rows = i - 1
            else
                -- if rows has still not been set then each line is parsed to add characters to the appropriate collumn in stacks
                for y = 1, #l, 4 do
                    local char = l:sub(y, y + 3):match("%[(%u)%]")

                    local index = (y + 3) / 4
                    if not stacks[index] then
                        stacks[index] = {}
                    end

                    table.insert(stacks[index], char)
                end
            end

        -- if the line is greater than or equal to the number of rows + 2 then we begin parsing the movements
        elseif i >= (rows + 2) then
            local n, from, to = l:match("move (%d+) from (%d+) to (%d+)")
            n, from, to = tonumber(n), tonumber(from), tonumber(to)

            for y = 1, tonumber(n) do
                table.insert(stacks[to], 1, stacks[from][1])
                table.remove(stacks[from], 1)
            end
        end
    end

    for i = 1, cols do
        top = top .. stacks[i][1]
    end
end

p(top)