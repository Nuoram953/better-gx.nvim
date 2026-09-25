local storage = require("better-gx.storage")

vim.api.nvim_create_user_command("BetterGxEdit", function()
	storage.edit()
end)

vim.api.nvim_create_user_command("BetterGxOpen", function()
	local content = storage.get_content()
	vim.print(content[1].url)
end)
