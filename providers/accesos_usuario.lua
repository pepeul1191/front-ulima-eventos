local constants = require('config.constants')
local http = require('socket.http')
local io = require('io')
local ltn12 = require('ltn12')
local M = {}

local function Acceder(usuario, contrasenia)
  local rq_resp = {}
  res, code, response_headers = http.request{url = constants.SERVICIOS.accesos .. 'usuario/acceder?usuario=' .. usuario .. '&contrasenia=' .. contrasenia, method = 'POST', sink = ltn12.sink.table(rq_resp)}
  return table.concat(rq_resp)
end

local function Listar()
  local rq_resp = {}
  res, code, response_headers = http.request{url = constants.SERVICIOS.accesos .. 'usuario/listar', method = 'GET', sink = ltn12.sink.table(rq_resp)}
  return table.concat(rq_resp)
end

M.Acceder = Acceder
M.Listar = Listar

return M
