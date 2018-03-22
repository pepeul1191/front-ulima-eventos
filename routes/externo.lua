local M = {}
local config = require("lapis.config")
local administracion_externo = require("providers.administracion_externo")

local function Listar(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    GET = function(self)
      local req = administracion_externo.client:listar{}
      return { req.body, layout = false}
    end
  }
end

local function Id(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    GET = function(self)
      local req = administracion_externo.client:id{externo_id = self.params.externo_id}
      return { req.body, layout = false}
    end
  }
end

M.Listar = Listar
M.Id = Id
return M
