local util = require("../../util/util")


local totalSize = 0


do
    local fs = {
        ["/"] = {
            ["size"] = 0
        }
    }

    local currentDir = fs

    local command, arg, size, tempCurrentDir

    for i, l in ipairs(util.split(util.read(2022, 7), "\r\n")) do
        command, arg = l:match("^[$ ]*(%w+)%s?(.*)")

        if command == "cd" then
            if arg == ".." then
                if currentDir["size"] <= 100000 then
                    totalSize = totalSize + currentDir["size"]
                end

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

                -- update size of all parent directories
                tempCurrentDir = currentDir
                while tempCurrentDir["parent"] ~= nil do
                    tempCurrentDir["parent"]["size"] = tempCurrentDir["parent"]["size"] + size
                    tempCurrentDir = tempCurrentDir["parent"]
                end
            end
        end
    end
end


p(totalSize)