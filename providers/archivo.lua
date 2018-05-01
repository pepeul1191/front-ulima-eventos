local M = {}
local spore = require("Spore")
local constants = require("config.constants")

local client = spore.new_from_lua{
  base_url = constants.SERVICIOS.archivos,
  methods = {
    obtener_id = {
      path = "/imagen/obtener_id",
      method = "GET",
    },
    crear = {
      path = "/imagen/crear",
      method = "POST",
      required_params = {
        "data",
      },
    },
    nombre = {
      path = "/imagen/obtener_nombre_archivo/:archivo_id",
      method = "GET",
      required_params = {
        "archivo_id",
      },
    },
  },
}

M.client = client
return M
