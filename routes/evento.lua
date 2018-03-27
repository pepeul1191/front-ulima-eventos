local M = {}
local config = require("lapis.config")
local json = require("cjson")
local constants = require("config.constants")
local helpers = require("config.helpers")
local inspect = require("inspect")
local helper = require("helpers.evento")
local administracion_evento = require("providers.administracion_evento")
local evento_participante = require("providers.evento_participante")
local administracion_alumno = require("providers.administracion_alumno")

local function Index(self)
  return {
    before = function(self)
    end,
    GET = function(self)
      self.constants = constants
      self.helpers = helpers
      self.csss = helper.IndexCSS()
      self.jss = helper.IndexJS()
      self.title = "Eventos ULima "
      self.mensaje = false
      return { render = "evento.index", layout = "layouts.blank" }
    end
  }
end

local function Listar(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    GET = function(self)
      local req = administracion_evento.client:listar{}
      return { req.body, layout = false}
    end
  }
end

local function GuardarDetalle(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    POST = function(self)
      local data =  json.decode(self.params["data"])
      local req = ""
      if data._id == "E" then
        req = administracion_evento.client:crear{evento = json.encode(data)}
      else
        req = administracion_evento.client:editar{evento = json.encode(data)}
      end
      return { req.body, layout = false}
    end
  }
end

local function Guardar(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    POST = function(self)
      local data =  self.params["data"]
      req = administracion_evento.client:eliminar{data = data}
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
      local _id =  self.params["_id"]
      req = administracion_evento.client:_id{_id = _id}
      return { req.body, layout = false}
    end
  }
end

local function NombreUrl(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    GET = function(self)
      local nombre_url =  self.params["nombre_url"]
      req = administracion_evento.client:nombre_url{nombre_url = nombre_url}
      return { req.body, layout = false}
    end
  }
end

local function Inscripcion(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    GET = function(self)
      self.nombre_url =  self.params["nombre_url"]
      self.constants = constants
      self.helpers = helpers
      self.csss = helper.InscripcionCSS()
      self.jss = helper.InscripcionJS()
      self.title = "Eventos ULima - Inscripción"
      return { render = "evento.inscripcion", layout = false}
    end
  }
end

local function AlumnoCodigoBuscar(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    GET = function(self)
      local codigo_alumno =  self.params["codigo_alumno"]
      req = administracion_alumno.client:alumno_codigo_buscar{codigo_alumno = codigo_alumno}
      return { req.body, layout = false}
    end
  }
end

M.Index = Index
M.Id = Id
M.Listar = Listar
M.GuardarDetalle = GuardarDetalle
M.Guardar = Guardar
M.Inscripcion = Inscripcion
M.NombreUrl = NombreUrl
M.AlumnoCodigoBuscar = AlumnoCodigoBuscar
return M
