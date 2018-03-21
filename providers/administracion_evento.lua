local M = {}
local spore = require("Spore")
local constants = require("config.constants")

local client = spore.new_from_lua{
  base_url = constants.SERVICIOS.eventos,
  methods = {
    listar = {
      path = "/evento/listar",
      method = "GET",
    },
    crear = {
      path = "/evento/crear",
      method = "POST",
      required_params = {
        "evento",
      },
    },
    editar = {
      path = "/evento/editar",
      method = "POST",
      required_params = {
        "evento",
      },
    },
  },
}

M.client = client
return M
