local util = require("../util/util")


local overlapping = 0


do
    local input = util.read(4)
    for p1Lower, p1Upper, p2Lower, p2Upper in input:gmatch("(%d+)-(%d+),(%d+)-(%d+)[\r\n]?") do
        p1Lower, p1Upper, p2Lower, p2Upper = tonumber(p1Lower), tonumber(p1Upper), tonumber(p2Lower), tonumber(p2Upper)

        -- if the upper of pair 1 is greater than or equal to the lower of pair 2 but less than or equal to the upper of pair 2 (and vice versa) they are overlapping
        if p1Upper >= p2Lower and p1Upper <= p2Upper or p2Upper >= p1Lower and p2Upper <= p1Upper then
            overlapping = overlapping + 1
        end
    end
end


p(overlapping)