local M = {}
local spore = require("Spore")
local constants = require("config.constants")

local client = spore.new_from_lua{
  base_url = constants.SERVICIOS.eventos,
  methods = {
    alumno = {
      path = "/participante/alumno/agregar",
      method = "POST",
      required_params = {
        "data",
      },
    },
    empleado = {
      path = "/participante/empleado/agregar",
      method = "POST",
      required_params = {
        "data",
      },
    },
  },
}

M.client = client
return M
