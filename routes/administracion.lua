local M = {}
local config = require("lapis.config")
local inspect = require("inspect")
local json = require("cjson")
local constants = require("config.constants")
local helpers = require("config.helpers")
local helper = require("helpers.administracion")
local middleware = require("config.middleware")
local accesos_usuario = require("providers.accesos_usuario")
--local inspect = require('inspect')

local function Index(self)
  return {
    before = function(self)
      middleware.LoguedoHome(self)
    end,
    GET = function(self)
      self.constants = constants
      self.helpers = helpers
      self.csss = helper.IndexCSS()
      self.jss = helper.IndexJS()
      self.title = "Eventos Académicos"
      self.mensaje = false
      self.modulos = json.encode({
        {url = "accesos/", nombre = "Accesos"},
        {url = "administracion/", nombre = "Administración"},
      })
      self.items =  json.encode({
        {subtitulo = "Opciones", items =
    			{
            {item = "Gestión de Eventos", url = "administracion#/evento"},
            {item = "Gestión de Alumnos", url = "administracion#/alumno"},
    				{item = "Gestión de Empleados", url = "administracion#/empleado"},
    				{item = "Gestión de Externos", url = "administracion#/externo"},
    			}
    		},
      })
      self.data = "{}"
      return {render = "home.index", layout = "layouts.app"}
    end
  }
end

M.Index = Index
return M
