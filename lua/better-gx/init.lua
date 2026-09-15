local M = {}

M.setup = function(opts)
	opts = opts or {}
	vim.notify("Hello from my-plugin!")
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

-- file handling
-- create file
-- open file

-- BetterGxEdit
-- BetterGxOpen
-- BetterGxHistory

return M
