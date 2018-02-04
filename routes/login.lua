local M = {}
local config = require('lapis.config')
local inspect = require('inspect')
local constants = require('config.constants')

local function Index(self)
  return {
    before = function(self)

    end,
    GET = function(self)
      self.constants = constants
      return { render = 'login.index', layout = 'layouts.blank'}
    end
  }
end

M.Index = Index

return M