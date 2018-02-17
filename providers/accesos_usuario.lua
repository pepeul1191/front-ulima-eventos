local constants = require('config.constants')
local utils = require('config.utils')
local http = require('socket.http')
local io = require('io')
local ltn12 = require('ltn12')
local json = require('cjson')
local inspect = require('inspect')
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

local function ValidarUsuarioRepetido(id, usuario)
  local rq_resp = {}
  local data = {
  	['id'] = id, 
  	['usuario'] = usuario
  }
  data = json.encode(data)
  utils.url_enconde(data)
  res, code, response_headers = http.request{url = constants.SERVICIOS.accesos .. 'usuario/nombre_repetido?data=' .. data, method = 'POST', sink = ltn12.sink.table(rq_resp)}
  return tostring(rq_resp[1])
end

local function ValidarCorreoRepetido(id, correo)
  local rq_resp = {}
  local data = {
  	['id'] = id, 
  	['correo'] = correo
  }
  data = json.encode(data)
  utils.url_enconde(data)
  res, code, response_headers = http.request{url = constants.SERVICIOS.accesos .. 'usuario/correo_repetido?data=' .. data, method = 'POST', sink = ltn12.sink.table(rq_resp)}
  return tostring(rq_resp[1])
end


M.Acceder = Acceder
M.Listar = Listar
M.ValidarUsuarioRepetido = ValidarUsuarioRepetido
M.ValidarCorreoRepetido = ValidarCorreoRepetido

return M
