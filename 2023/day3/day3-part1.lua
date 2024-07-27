local util = require("../../util/util")


local sum = 0


do
    local current, valid

    local lines = util.split(util.read(2023, 3), "\r\n")
    local n = ""

    for i, line in ipairs(lines) do
        for j = 1, #line do
            current = line:sub(j, j)

            if current:match("%d") then
                n = n .. current

                if not valid then
                    for k = -(i > 1 and 1 or 0), (i < #lines and 1 or 0) do
                        if lines[i + k]:sub(j - 1, j + 1):match("[^%.%d]") then
                            valid = true

                            break
                        end
                    end
                end
            else
                sum = sum + (valid and tonumber(n) or 0)

                valid = false
                n = ""
            end
        end
    end
end


p(sum)