local M = {}
local config = require("lapis.config")
local inspect = require('inspect')

local function Index(self)
  return {
    before = function(self)

    end,
    GET = function(self)
      return { render = "login.index", layout = "layouts.blank"}
    end
  }
end

M.Index = Index

return M