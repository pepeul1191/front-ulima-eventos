local M = {}
local spore = require("Spore")
local constants = require("config.constants")

local client = spore.new_from_lua{
  base_url = constants.SERVICIOS.administracion,
  methods = {
    listar = {
      path = "/empleado/listar",
      method = "GET",
    },
    id = {
      path = "/empleado/obtener/:empleado_id",
      method = "GET",
      required_params = {
        "empleado_id",
      },
    },
    empleado_codigo_buscar = {
      path = "/empleado/codigo_empleado/:archivo_id",
      method = "GET",
      required_params = {
        "archivo_id",
      },
    },
  },
}

M.client = client
return M
