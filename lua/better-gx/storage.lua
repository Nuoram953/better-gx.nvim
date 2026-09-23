local logger = require("better-gx.logger")

local M = {}
local default_bookmark_content = ""

M.get_path = function()
	local path = vim.fn.stdpath("data") .. "/better-gx/bookmarks.json"
	local dir = vim.fs.dirname(path)

	local dir_stat = vim.uv.fs_stat(dir)
	if dir_stat == nil then
		logger.info("Creating directory " .. dir)
		vim.fn.mkdir(dir, "p")
	end

	local file_stat = vim.uv.fs_stat(path)
	if file_stat == nil then
		logger.info("Creating empty bookmark file " .. path)
		vim.fn.writefile(default_bookmark_content, path)
	end

	return path
end

M.edit = function()
	local path = M.get_path()

	vim.cmd.edit(path)
end

return M
