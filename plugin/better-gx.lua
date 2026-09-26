local storage = require("better-gx.storage")
local picker = require("better-gx.picker")

vim.api.nvim_create_user_command("BetterGxEdit", function()
	storage.edit()
end)

vim.api.nvim_create_user_command("BetterGxOpen", function()
	picker.open_picker()
end)
