local fs = require("fs")


local F = string.format


local function read(year, day)
    return fs.readFileSync(F("./%d/day%d/day%d.txt", year, day, day))
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