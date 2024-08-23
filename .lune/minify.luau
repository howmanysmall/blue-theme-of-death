--!native
--!optimize 2
--!strict

local fs = require("@lune/fs")
local serde = require("@lune/serde")
local stdio = require("@lune/stdio")

local FILE_NAME = "Blue Theme of Death-color-theme.json"

if not fs.isDir("mini") then
	fs.writeDir("mini")
end

local asLuauTable = serde.decode("json", fs.readFile(`themes/{FILE_NAME}`))
local shouldRemoveTokenColors = stdio.prompt("confirm", "Do you want to remove 'tokenColors'?")
if shouldRemoveTokenColors then
	asLuauTable.tokenColors = nil
end

fs.writeFile(`mini/{FILE_NAME}`, serde.encode("json", asLuauTable, false))
