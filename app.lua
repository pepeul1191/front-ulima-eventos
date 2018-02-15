local lapis = require('lapis')
local config = require('lapis.config').get()
local respond_to = require('lapis.application').respond_to
local app = lapis.Application()
app:enable('etlua')

-- LOGIN Y ERRORES ... ROUTES
local login = require('routes.login')
local error = require('routes.error')

app:get('/', function()
  return 'Welcome to Lapis xd ' .. require('lapis.version')
end)

-- LOGIN Y ERRORES ... RUTAS
app:match('homeIndex', '/login', respond_to(login.Index(self)))
app:match('accederLogin', '/login/acceder', respond_to(login.Acceder(self)))
app:match('errorAccess', '/error/access/:error', respond_to(error.Access(self)))

return app
