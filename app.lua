local lapis = require("lapis")
local config = require("lapis.config").get()
local respond_to = require("lapis.application").respond_to
local app = lapis.Application()
app:enable("etlua")

app:match("/test/conexion", function(self)
  return "ok"
end)

-- HANDLERS
local home = require("routes.home")
local registro = require("routes.registro")
local login = require("routes.login")
local error = require("routes.error")
local evento = require("routes.evento")
local administracion = require("routes.administracion")
local alumno = require("routes.alumno")
-- HOME
app:match("homeIndex", "/", respond_to(home.Index(self)))
-- LOGIN
app:match("loginIndex", "/login", respond_to(login.Index(self)))
app:match("accederLogin", "/login/acceder", respond_to(login.Acceder(self)))
app:match("loginSalir", "/salir", respond_to(login.Salir(self)))
app:match("loginVer", "/ver", respond_to(login.Ver(self)))
-- ALUMNO
app:match("AlumnoListar", "/alumno/listar", respond_to(alumno.Listar(self)))
-- EVENTO
app:match("EventoViewIndex", "/eventos", respond_to(evento.Index(self)))
app:match("EventoListar", "/evento/listar", respond_to(evento.Listar(self)))
-- REGISTRO
app:match("registroViewIndex", "/registro", respond_to(registro.Index(self)))
app:match("registroValidarUsuarioRepetido", "/registro/validar_usuario_repetido", respond_to(registro.ValidarUsuarioRepetido(self)))
app:match("registroValidarCorreoRepetido", "/registro/validar_correo_repetido", respond_to(registro.ValidarCorreoRepetido(self)))
-- ADMINISTRACION
app:match("administracion", "/administracion", respond_to(administracion.Index(self)))
-- ERRORES
app:match("errorAccess", "/error/access/:error", respond_to(error.Access(self)))

return app
