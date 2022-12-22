local util = require("../util/util")


do
    local input = util.read(6)

    local seen = {}

    for i = 1, #input do
        local char = input:sub(i, i)

        table.insert(seen, char)

        if #seen >= 2 then
            for y = 1, #seen - 1 do
                if seen[y] == char then
                    seen = {char}

                    break
                end
            end

            if #seen == 4 then
                p(i)

                return
            end
        end
    end
end