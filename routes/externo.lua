local M = {}
local json = require("cjson")
local config = require("lapis.config")
local administracion_externo = require("providers.administracion_externo")

local function Listar(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    GET = function(self)
      local req = administracion_externo.client:listar{}
      return { req.body, layout = false}
    end
  }
end

local function Id(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    GET = function(self)
      local req = administracion_externo.client:id{externo_id = self.params.externo_id}
      return { req.body, layout = false}
    end
  }
end

local function GuardarDetalle(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    POST = function(self)
      local data =  json.decode(self.params["data"])
      local req = ""
      if data._id == "E" then
        req = administracion_externo.client:crear{externo = json.encode(data)}
      else
        req = administracion_externo.client:editar{externo = json.encode(data)}
      end
      return { req.body, layout = false}
    end
  }
end

M.Listar = Listar
M.Id = Id
M.GuardarDetalle = GuardarDetalle
return M
