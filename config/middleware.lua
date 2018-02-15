local M = {}
local constants = require('config.constants')

local function ValidarCSRF(self)
  if self.params['csrf'] ~= 'constants.CSRF' then
    self:write({redirect_to = constants.BASE_URL .. 'error/access/505'})
  end
end

M.ValidarCSRF = ValidarCSRF

return M
