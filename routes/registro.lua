local M = {}
local config = require("lapis.config")
local json = require("cjson")
local constants = require("config.constants")
local helpers = require("config.helpers")
local accesos_usuario = require("providers.accesos_usuario")

local function Index(self)
  return {
    before = function(self)
      --TODO
    end,
    GET = function(self)
      self.constants = constants
      self.helpers = helpers
      self.csss = {
        "bower_components/bootstrap/dist/css/bootstrap.min",
        "bower_components/font-awesome/css/font-awesome.min",
        "assets/css/registro",
      }
      self.jss = {
        "bower_components/jquery/dist/jquery.min",
        "bower_components/bootstrap/dist/js/bootstrap.min",
      }
      self.title = "Login"
      self.mensaje = false
      return { render = "registro.index", layout = false }
    end
  }
end

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

M.Index = Index
M.ValidarUsuarioRepetido = ValidarUsuarioRepetido
M.ValidarCorreoRepetido = ValidarCorreoRepetido
return M
