local util = require("../../util/util")


local visible = 0

-- is tree x visible?
-- 1 loop from left to tree, right to tree, etc (4 total)

do
    local input = util.read(2022, 8)
    local rows = util.split(input, "\r\n")
    local width, height = #rows[1], #rows

    local currentTree, t, currentlyVisible

    local function checkBounds(col, row, tree)
        for i = 1, (col - 1) do
            currentTree = tonumber(rows[row]:sub(i, i))

            if currentTree > tree then
                break
            elseif i == (col - 1) then
                return true
            end
        end

        for i = width, (col + 1), -1 do
            
        end
    end

    for col = 1, width do
        for row = 1, height do
            currentTree = tonumber(rows[row]:sub(col, col))

            if col == 1 or row == 1 or col == width or row == height then
                visible = visible + 1
            else
                currentlyVisible = true

                while currentlyVisible do
                    for i = 1, (col - 1) do
                        currentTree = tonumber(rows[row]:sub(i, i))
            
                        if currentTree > t then
                            break
                        elseif i == (col - 1) then
                            return true
                        end
                    end
            
                    for i = width, (col + 1), -1 do
                        
                    end



                    currentlyVisible = false
                end

                if currentlyVisible then
                    visible = visible + 1
                end
            end
        end
    end
end

p(visible)