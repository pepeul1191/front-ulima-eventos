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
  },
}

M.client = client
return M
