local util = require("../../util/util")


local sum = 0


do
    local current, gearIndex, gearLocation

    local lines = util.split(util.read(2023, 3), "\r\n")
    local n = ""
    local gears = { }

    for i, line in ipairs(lines) do
        for j = 1, #line do
            current = line:sub(j, j)

            if current:match("%d") then
                n = n .. current

                if not gearLocation then
                    for k = -(i > 1 and 1 or 0), (i < #lines and 1 or 0) do
                        gearIndex = lines[i + k]:sub(j - 1, j + 1):match("()*")
                        if gearIndex then
                            gearLocation = tostring(i + k)..tostring(j + (gearIndex - 1))

                            break
                        end
                    end
                end
            else
                if gearLocation then
                    if gears[gearLocation] then
                        sum = sum + (gears[gearLocation] * n)
                    else
                        gears[gearLocation] = n
                    end
                end

                gearLocation = nil
                n = ""
            end
        end
    end
end


p(sum)