local lapis = require('lapis')
local config = require('lapis.config').get()
local respond_to = require('lapis.application').respond_to
local app = lapis.Application()
app:enable('etlua')

app:match("/test/conexion", function(self)
  return "ok"
end)

--HOME
local home = require('routes.home')
local registro = require('routes.registro')
local login = require('routes.login')
local error = require('routes.error')

-- HOME
app:match('homeIndex', '/', respond_to(home.Index(self)))
-- LOGIN
app:match('loginIndex', '/login', respond_to(login.Index(self)))
app:match('accederLogin', '/login/acceder', respond_to(login.Acceder(self)))
app:match("loginSalir", "/salir", respond_to(login.Salir(self)))
app:match("loginVer", "/ver", respond_to(login.Ver(self)))
-- REGISTRO
app:match('registroValidarUsuarioRepetido', '/registro/validar_usuario_repetido', respond_to(registro.ValidarUsuarioRepetido(self)))
-- ERRORES
app:match('errorAccess', '/error/access/:error', respond_to(error.Access(self)))

return app
