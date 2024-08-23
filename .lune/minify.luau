--!native
--!optimize 2
--!strict

local fs = require("@lune/fs")
local serde = require("@lune/serde")

local FILE_NAME = "Blue Theme of Death-color-theme.json"

if not fs.isDir("mini") then
	fs.writeDir("mini")
end

fs.writeFile(`mini/{FILE_NAME}`, serde.encode("json", serde.decode("json", fs.readFile(`themes/{FILE_NAME}`)), false))
