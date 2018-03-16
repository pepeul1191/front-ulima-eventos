local M = {}
local config = require("lapis.config")
local json = require("cjson")
local accesos_usuario = require("providers.accesos_usuario")

local function ValidarUsuarioRepetido(self)
  return {
    before = function(self)
      --TODO
    end,
    POST = function(self)
      local id = "E" -- es E porque el usuario a registrar sería nuevo y no tiene todavía un id
      local nombre = self.params["nombre"]
      local data = {
      	["id"] = id,
      	["usuario"] = nombre
      }
      local req = accesos_usuario.client:validar_usuario_repetido{ data = json.encode(data), }
      return { req.body, layout = false }
    end
  }
end

local function ValidarCorreoRepetido(self)
  return {
    before = function(self)
      --TODO
    end,
    POST = function(self)
      local id = "E" -- es E porque el usuario a registrar sería nuevo y no tiene todavía un id
      local correo = self.params["correo"]
      local data = {
      	["id"] = id,
      	["correo"] = correo
      }
      local req = accesos_usuario.client:validar_correo_repetido{ data = json.encode(data), }
      return { req.body, layout = false }
    end
  }
end

M.ValidarUsuarioRepetido = ValidarUsuarioRepetido
M.ValidarCorreoRepetido = ValidarCorreoRepetido

return M
