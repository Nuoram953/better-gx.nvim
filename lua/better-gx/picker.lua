local storage = require("better-gx.storage")
local M = {}

---@param items BookmarkItem[]
---@return BookmarkItemFormatted[]
local function format_data(items)
	local formatted_items = {}
	for index, value in ipairs(items) do
		local formatted_item = {
			text = value.name,
			value = value.url,
			desc = value.name,
		}

		formatted_items[index] = formatted_item
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
	})
end

return M
