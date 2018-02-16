local M = {}
local config = require('lapis.config')
local inspect = require('inspect')
local constants = require('config.constants')
local helpers = require('config.helpers')
local middleware = require('config.middleware')
local accesos_usuario = require('providers.accesos_usuario')
--local inspect = require('inspect')

local function Index(self)
  return {
    before = function(self)
      --TODO
    end,
    GET = function(self)
      self.constants = constants
      self.helpers = helpers
      self.csss = {'dist/styles.min'}
      self.jss = {'dist/app.min'}
      self.title = 'Login'
      self.mensaje = false
      self.menu = '[{"url":"#/","nombre":"Home"},{"url":"#/buscar","nombre":"Buscar"},{"url":"#/contacto","nombre":"Contacto"}]'
      self.data = ''
      return { render = 'home.index', layout = 'layouts.site'}
    end
  }
end

M.Index = Index

return M
