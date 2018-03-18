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
      --TODO
    end,
    GET = function(self)
      self.constants = constants
      self.helpers = helpers
      self.csss = {
        "bower_components/bootstrap/dist/css/bootstrap.min",
        "bower_components/font-awesome/css/font-awesome.min",
        "assets/css/styles",
        "assets/css/login",
      }
      self.jss = {
        "bower_components/jquery/dist/jquery.min",
        "bower_components/bootstrap/dist/js/bootstrap.min",
      }
      self.title = "Login"
      self.mensaje = false
      self.menu = '[{"url":"#/","nombre":"Home"},{"url":"#/buscar","nombre":"Buscar"},{"url":"#/contacto","nombre":"Contacto"}]'
      self.data = ''
      return { render = "administracion.index", layout = "layouts.app"}
    end
  }
end

M.Index = Index
return M
