local util = require("../util/util")


local forDeletion


do
    local fs = {
        ["/"] = {
            ["size"] = 0
        }
    }

    local currentDir = fs

    local command, arg, size, tempCurrentDir

    for i, l in ipairs(util.split(util.read(7), "\r\n")) do
        command, arg = l:match("^[$ ]*(%w+)%s?(.*)")

        if command == "cd" then
            if arg == ".." then
                currentDir = currentDir["parent"]
            else
                if not currentDir[arg] then
                    currentDir[arg] = {
                        ["parent"] = currentDir,
                        ["size"] = 0
                    }
                end

                currentDir = currentDir[arg]
            end
        elseif command:match("^%d+$") then
            size = tonumber(command)

            if size then
                currentDir["size"] = currentDir["size"] + size

                tempCurrentDir = currentDir
                while tempCurrentDir["parent"] ~= nil do
                    tempCurrentDir["parent"]["size"] = tempCurrentDir["parent"]["size"] + size
                    tempCurrentDir = tempCurrentDir["parent"]
                end
            end
        end
    end

    local sizeRequired = math.abs(40000000 - fs["/"]["size"])
    forDeletion = { "/", fs["/"]["size"] }

    -- recursively search for smallest directory
    local function findSmallestSuitableDir(dir, dirName)
        if dir["size"] < sizeRequired then
            return
        end

        if dir["size"] >= sizeRequired and dir["size"] < forDeletion[2] then
            forDeletion = { dirName, dir["size"] }
        end

        for k, ent in pairs(dir) do
            if k ~= "size" and k ~= "parent" then
                findSmallestSuitableDir(ent, k)
            end
        end
    end

    findSmallestSuitableDir(fs["/"], "/")
end


p(forDeletion[2])