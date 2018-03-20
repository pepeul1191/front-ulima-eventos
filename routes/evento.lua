local M = {}
local config = require("lapis.config")
local json = require("cjson")
local constants = require("config.constants")
local helpers = require("config.helpers")

local function Index(self)
  return {
    before = function(self)
    end,
    GET = function(self)
      self.constants = constants
      self.helpers = helpers
      self.csss = {
        "bower_components/bootstrap/dist/css/bootstrap.min",
        "bower_components/font-awesome/css/font-awesome.min",
      }
      self.jss = {
        "bower_components/jquery/dist/jquery.min",
        "bower_components/bootstrap/dist/js/bootstrap.min",
        "bower_components/handlebars/handlebars.min",
        "bower_components/underscore/underscore-min",
        "bower_components/backbone/backbone-min",
      }
      self.title = "Eventos ULima "
      self.mensaje = false
      return { render = "evento.index", layout = "layouts.blank" }
    end
  }
end

M.Index = Index
return M
