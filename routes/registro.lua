local M = {}
local config = require('lapis.config')
local accesos_usuario = require('providers.accesos_usuario')

local function ValidarUsuarioRepetido(self)
  return {
    before = function(self)
      --TODO
    end,
    POST = function(self)
      local id = 'E' -- es E porque el usuario a registrar sería nuevo y no tiene todavía un id
      local nombre = self.params['nombre']
      return { accesos_usuario.ValidarUsuarioRepetido(id, nombre), layout = false }
    end
  }
end

M.ValidarUsuarioRepetido = ValidarUsuarioRepetido

return M
