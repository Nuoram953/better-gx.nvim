local storage = require("better-gx.storage")

vim.api.nvim_create_user_command("BetterGxEdit", function()
	storage.edit()
end)
