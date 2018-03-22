local M = {}
local config = require("lapis.config")
local administracion_empleado = require("providers.administracion_empleado")

local function Listar(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    GET = function(self)
      local req = administracion_empleado.client:listar{}
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
      local req = administracion_empleado.client:id{empleado_id = self.params.empleado_id}
      return { req.body, layout = false}
    end
  }
end

M.Listar = Listar
M.Id = Id
return M
