local M = {}
local spore = require("Spore")
local constants = require("config.constants")

local client = spore.new_from_lua{
  base_url = constants.SERVICIOS.administracion,
  methods = {
    listar = {
      path = "/alumno/listar",
      method = "GET",
    },
    id = {
      path = "/alumno/obtener/:alumno_id",
      method = "GET",
      required_params = {
        "alumno_id",
      },
    },
    alumno_codigo_buscar = {
      path = "/alumno/codigo_alumno/:codigo_alumno",
      method = "GET",
      required_params = {
        "codigo_alumno",
      },
    },
  },
}

M.client = client
return M
