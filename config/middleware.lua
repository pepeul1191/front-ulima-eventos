local M = {}
local constants = require("config.constants")

local function ValidarCSRF(self)
  if self.params["csrf"] ~= constants.CSRF then
    self:write({redirect_to = constants.BASE_URL .. "error/access/505"})
  end
end

local function LoguedoHome(self)
  if self.session.estado ~= "activo" then
    self:write({redirect_to = constants.BASE_URL .. "eventos"})
  end
end

M.LoguedoHome = LoguedoHome
M.ValidarCSRF = ValidarCSRF
return M
