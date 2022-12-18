local util = require("../util/util")


local overlapping = 0


do
    local input = util.read(4)
    for p1Lower, p1Upper, p2Lower, p2Upper in input:gmatch("(%d+)-(%d+),(%d+)-(%d+)[\r\n]?") do
        p1Lower, p1Upper, p2Lower, p2Upper = tonumber(p1Lower), tonumber(p1Upper), tonumber(p2Lower), tonumber(p2Upper)

        -- if the range of pair 1 exceeds the range of pair 2 or vise versa they are *completely* overlapping
        if p1Lower <= p2Lower and p1Upper >= p2Upper or p2Lower <= p1Lower and p2Upper >= p1Upper then
            overlapping = overlapping + 1
        end
    end
end


p(overlapping)