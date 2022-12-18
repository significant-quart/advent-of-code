local fs = require("fs")


local F = string.format


local function read(day)
    return require("fs").readFileSync(F("./day%d/day%d.txt", day, day))
end

local function split(input, sep)
    local ret = {}
    for str in input:gmatch("([^"..sep.."]+)") do
        table.insert(ret, str)
    end

    return ret
end


return {
    F = F,

    read = read,
    split = split
}