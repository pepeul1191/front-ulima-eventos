local M = {}
local config = require("lapis.config")
local inspect = require("inspect")
local constants = require("config.constants")
local helpers = require("config.helpers")
local middleware = require("config.middleware")
local accesos_usuario = require("providers.accesos_usuario")
--local inspect = require('inspect')

local function Index(self)
  return {
    before = function(self)
      middleware.LoguedoHome(self)
    end,
    GET = function(self)
      self:write({redirect_to = constants.BASE_URL .. "administracion"})
    end
  }
end

M.Index = Index
return M
