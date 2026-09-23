local M = {}

---@type vim.Log
M.log = vim.log.new({
	name = "better-gx",
	level = vim.log.levels.DEBUG,
})

return M.log
