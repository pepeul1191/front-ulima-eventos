local M = {}

M.AMBIENTE = "desarrollo"
M.BASE_URL = "http://localhost:9090/"
M.STATIC_URL = "http://localhost:9100/"
M.CSRF = "TLXTtwXA-_et0s5uKPPcAGm5dtQIAjXgHmmM"
M.SERVICIOS = {
  accesos = "http://localhost:5000/",
  eventos = "http://localhost:3000/",
  administracion = "http://localhost:4000/",
  archivos = "http://192.168.1.11:3031/",
}
M.FTP = {
  host = "192.168.1.11",
  user = "pepe",
  pass = "kiki123",
  directorio = "Documentos/python/archivos/static/",
}

return M
