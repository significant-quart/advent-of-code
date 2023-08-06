local util = require("../util/util")


do
    local input = util.read(6)

    local seen = {}

    for i = 1, #input do
        local char = input:sub(i, i)

        table.insert(seen, char)

        if #seen >= 2 then
            for y = 1, #seen - 1 do

                -- only clear seen characters up to the duplicate
                if seen[y] == char then
                    for z = 1, y do
                        table.remove(seen, 1)
                    end

                    break
                end
            end

            if #seen == 14 then
                p(i)

                return
            end
        end
    end
end