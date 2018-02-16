local M = {}
local config = require('lapis.config')
local inspect = require('inspect')
local constants = require('config.constants')
local helpers = require('config.helpers')
local middleware = require('config.middleware')
local accesos_usuario = require('providers.accesos_usuario')
local inspect = require('inspect')

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
      if accesos_usuario.Acceder(usuario, contrasenia) == '1' then
        self.session.estado = 'activo'
				self.session.tiempo = os.date('*t')
				self.session.usuario = self.params['usuario']
        return self:write({redirect_to = constants.BASE_URL})
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

local function Salir(self)
  return {
    GET = function(self)
      self.session.estado = nil
      self.session.tiempo = nil
      self.session.usuario = nil
      self:write({redirect_to = self:url_for("loginIndex")})
    end
  }
end

local function Ver(self)
  return {
    before = function(self)
      --
    end,
    GET = function(self)
      --self:headers
      --return accesos_usuario.Listar
      return { json = { usuario = self.session.usuario, tiempo = self.session.tiempo, estado = self.session.estado } }
    end
  }
end

M.Acceder = Acceder
M.Index = Index
M.Ver = Ver
M.Salir = Salir

return M
