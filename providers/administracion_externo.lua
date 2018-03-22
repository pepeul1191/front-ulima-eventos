local M = {}
local spore = require("Spore")
local constants = require("config.constants")

local client = spore.new_from_lua{
  base_url = constants.SERVICIOS.eventos,
  methods = {
    listar = {
      path = "/externo/listar",
      method = "GET",
    },
    id = {
      path = "/externo/_id/:externo_id",
      method = "GET",
      required_params = {
        "externo_id",
      },
    },
  },
}

M.client = client
return M
