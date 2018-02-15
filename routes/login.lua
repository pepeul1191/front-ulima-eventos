local M = {}
local config = require('lapis.config')
local inspect = require('inspect')
local constants = require('config.constants')
local helpers = require('config.helpers')

local function Index(self)
  return {
    before = function(self)

    end,
    GET = function(self)
      self.constants = constants
      self.helpers = helpers
      self.csss = {'bower_components/bootstrap/dist/css/bootstrap.min', 'bower_components/font-awesome/css/font-awesome.min'}
      self.jss = {'bower_components/jquery/dist/jquery.min', 'bower_components/bootstrap/dist/js/bootstrap.min'}
      self.title = 'Login'
      return { render = 'login.index', layout = 'layouts.blank'}
    end
  }
end

M.Index = Index

return M
