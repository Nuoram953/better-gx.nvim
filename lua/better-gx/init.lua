local M = {}

local config = {}
local default_opts = {}

M.setup = function(opts)
	config = vim.tbl_deep_extend("force", default_opts, opts or {})
end

M.get_config = function()
	return config
end

--[[
You can have an url with {{variable}}
if variable is a list it will create an entry for each

setup = {
  variable={
    env={
      dev="dev"
      stage="stage"
    }
  }
}

in json file
https://{{env}}.test.app.com

when calling betterGxOpen

will add entry

https://dev.test.app.com
https://stage.test.app.com

]]

-- user commands
-- BetterGxEdit
-- BetterGxOpen
-- BetterGxHistory

return M
