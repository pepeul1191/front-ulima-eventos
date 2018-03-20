local M = {}
local config = require("lapis.config")
local externo_empleado = require("providers.administracion_externo")

local function Listar(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    GET = function(self)
      local req = externo_empleado.client:listar{}
      return { req.body, layout = false}
    end
  }
end

M.Listar = Listar
return M
