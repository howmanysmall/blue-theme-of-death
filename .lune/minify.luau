--!native
--!optimize 2
--!strict

local fs = require("@lune/fs")
local serde = require("@lune/serde")

local FILE_NAME = "Blue Theme of Death-color-theme.json"
local asLuauTable = serde.decode("json", fs.readFile(`base-theme/{FILE_NAME}`))
fs.writeFile(`themes/{FILE_NAME}`, serde.encode("json", asLuauTable, false))
