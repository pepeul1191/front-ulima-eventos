local M = {}
local config = require('lapis.config')
local inspect = require('inspect')
local constants = require('config.constants')
local helpers = require('config.helpers')
local middleware = require('config.middleware')

local function Index(self)
  return {
    before = function(self)
      --TODO
    end,
    GET = function(self)
      self.constants = constants
      self.helpers = helpers
      self.csss = {'bower_components/bootstrap/dist/css/bootstrap.min', 'bower_components/font-awesome/css/font-awesome.min'}
      self.jss = {'bower_components/jquery/dist/jquery.min', 'bower_components/bootstrap/dist/js/bootstrap.min'}
      self.title = 'Login'
      self.mensaje = false
      return { render = 'login.index', layout = 'layouts.blank'}
    end
  }
end

local function Acceder(self)
  return {
    before = function(self)
      middleware.ValidarCSRF(self)
    end,
    POST = function(self)
      usuario = self.params['usuario']
      contrasenia = self.params['contrasenia']
      if usuario == 'pips' and contrasenia == '123' then
        return { 'usuario: ' .. usuario .. '<br> contraseña: ' .. contrasenia, layout = false }
      else
        self.constants = constants
        self.helpers = helpers
        self.csss = {'bower_components/bootstrap/dist/css/bootstrap.min', 'bower_components/font-awesome/css/font-awesome.min'}
        self.jss = {'bower_components/jquery/dist/jquery.min', 'bower_components/bootstrap/dist/js/bootstrap.min'}
        self.title = 'Login'
        self.mensaje = true
        return { render = 'login.index', layout = 'layouts.blank'}
      end
    end
  }
end

M.Acceder = Acceder
M.Index = Index

return M
