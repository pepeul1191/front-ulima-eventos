local M = {}
local config = require("lapis.config")
local json = require("cjson")
local constants = require("config.constants")
local helpers = require("config.helpers")
local accesos_usuario = require("providers.accesos_usuario")
local administracion_alumno = require("providers.administracion_alumno")
local administracion_empleado = require("providers.administracion_empleado")
local administracion_externo = require("providers.administracion_externo")
local evento_participante = require("providers.evento_participante")

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
        "bower_components/handlebars/handlebars.min",
        "bower_components/underscore/underscore-min",
        "bower_components/backbone/backbone-min",
        "assets/js/registro",
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

local function Alumno(self)
  return {
    before = function(self)
      --TODO
    end,
    POST = function(self)
      local data =  json.decode(self.params["data"])
      local req1 = administracion_alumno.client:id{alumno_id = data.id}
      local alumno = json.decode(req1.body)
      alumno.evento_id = data.evento_id
      alumno.correo_adicional = data.correo_adicional
      alumno.telefono_adicional = data.telefono_adicional
      req = evento_participante.client:alumno{data = json.encode(alumno)}
      return { req.body, layout = false}
    end
  }
end

local function Empleado(self)
  return {
    before = function(self)
      --TODO
    end,
    POST = function(self)
      local data =  json.decode(self.params["data"])
      local req1 = administracion_empleado.client:id{empleado_id = data.id}
      local empleado = json.decode(req1.body)
      empleado.evento_id = data.evento_id
      empleado.correo_adicional = data.correo_adicional
      empleado.telefono_adicional = data.telefono_adicional
      req = evento_participante.client:empleado{data = json.encode(empleado)}
      return { req.body, layout = false}
    end
  }
end

local function Externo(self)
  return {
    before = function(self)
      --TODO
    end,
    POST = function(self)
      local data =  json.decode(self.params["data"])
      if data.id == "E" then
        local req1 = administracion_externo.client:crear{externo = self.params["data"]}
        local res1 = json.decode(req1.body)
        data.externo_id = res1.mensaje[2]
        req = evento_participante.client:externo{data = json.encode(data)}
        rpta = json.decode(req.body)
        rpta.mensaje[2] = res1.mensaje[2]
        return {json.encode(rpta) , layout = false}
      else
        data.externo_id = data.id
        req = evento_participante.client:externo{data = json.encode(data)}
        return { req.body, layout = false}
      end
    end
  }
end

M.Index = Index
M.ValidarUsuarioRepetido = ValidarUsuarioRepetido
M.ValidarCorreoRepetido = ValidarCorreoRepetido
M.Alumno = Alumno
M.Empleado = Empleado
M.Externo = Externo
return M
