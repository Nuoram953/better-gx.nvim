local M = {}

M.setup = function(opts)
	opts = opts or {}
	vim.notify("Hello from my-plugin!")
end

vim.api.nvim_create_user_command("BetterGxEdit", function()
	local files = vim.api.nvim_get_runtime_file("lua/better-gx/", false)
	if #files == 0 then
		vim.notify("Plugin root directory not found!", vim.log.levels.ERROR)
		return
	end

	local target_file = files[1] .. "bookmarks.json"

	local stat = vim.uv.fs_stat(target_file)[1]

	if not stat then
		vim.notify("File not found. Creating: " .. target_file, vim.log.levels.INFO)

		vim.fn.mkdir(vim.fs.dirname(target_file), "p")

		local default_array =
			{ { title = "Neovim Documentation", url = "https://neovim.io/doc/", tags = { "neovim", "docs" } } }

		local json_string = vim.json.encode(default_array)

		local file = io.open(target_file, "w")
		if file then
			file:write(json_string)
			file:close()
		else
			vim.notify("Failed to create file!", vim.log.levels.ERROR)
			return
		end
	end

	vim.cmd.vsplit(vim.fn.fnameescape(target_file))
end, {})

vim.api.nvim_create_user_command("BetterGxOpen", function(opts)
	print("Executed :Command! Arguments passed: " .. opts.args)
end, { nargs = "*" })

vim.api.nvim_create_user_command("BetterGxHistory", function(opts)
	print("Executed :Command! Arguments passed: " .. opts.args)
end, { nargs = "*" })

return M
