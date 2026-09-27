local storage = require("better-gx.storage")
local logger = require("better-gx.logger")
-- local global = require("better-gx")

local M = {}

---@param items BookmarkItem[]
---@return BookmarkItemFormatted[]
local function format_data(items)
	local formatted_items = {}

	for _, value in ipairs(items) do
		local word = string.match(value.url, "{{(.-)}}")

		if word == nil then
			local formatted_item = {
				text = value.name,
				value = value.url,
				desc = value.name,
			}

			formatted_items[#formatted_items + 1] = formatted_item
		else
			if word then
				logger.debug("Found word " .. word .. " in url " .. value.url)

				local formatted_item = {
					text = value.name,
					value = value.url,
					desc = value.name,
				}

				formatted_items[#formatted_items + 1] = formatted_item
			end
		end

		logger.debug(formatted_items)
	end

	return formatted_items
end

M.open_picker = function()
	local items = format_data(storage.get_content())
	local Snacks = require("snacks")

	Snacks.picker({
		title = "better-gx",
		items = items,
		source = "better-gx",
		layout = "select",
		format = function(item)
			return {
				{ item.text, "SnacksPickerLabel" },
				{ " " .. (item.desc or ""), "SnacksPickerComment" },
			}
		end,
		confirm = function(picker, item)
			picker:close()
			vim.ui.open(item.value)
		end,
	})
end

return M
