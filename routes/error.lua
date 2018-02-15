local M = {}
local config = require('lapis.config')
local inspect = require('inspect')
local constants = require('config.constants')
local helpers = require('config.helpers')

local function Access(self)
  return {
    before = function(self)
      --TODO: Nada
    end,
    POST = function(self)
      error = self.params.error
      return { 'error: ' .. error }
    end,
    GET = function(self)
      error = self.params.error
      return { 'error: ' .. error }
    end,
  }
end

M.Access = Access

return M
