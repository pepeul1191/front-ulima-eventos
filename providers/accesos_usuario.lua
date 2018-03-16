local M = {}
local spore = require("Spore")
local constants = require("config.constants")

local client = spore.new_from_lua{
  base_url = constants.SERVICIOS.accesos,
  methods = {
    acceder = {
      path = "/usuario/acceder",
      method = "POST",
      required_params = {
        "usuario",
        "contrasenia",
      },
    },
    listar = {
      path = "/usuario/listar",
      method = "GET",
    },
    validar_correo_repetido = {
      path = "/usuario/correo_repetido",
      method = "POST",
      required_params = {
        "data",
      },
    },
    validar_usuario_repetido = {
      path = "/usuario/nombre_repetido",
      method = "POST",
      required_params = {
        "data",
      },
    },
  },
}

M.client = client
return M
