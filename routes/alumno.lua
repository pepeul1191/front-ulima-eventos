local M = {}
local config = require("lapis.config")
local administracion_alumno = require("providers.administracion_alumno")

local function Listar(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    GET = function(self)
      local req = administracion_alumno.client:listar{}
      return { req.body, layout = false}
    end
  }
end

M.Listar = Listar
return M
