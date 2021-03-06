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
    _id = {
      path = "/evento/_id/:_id",
      method = "GET",
      required_params = {
        "_id",
      },
    },
    nombre_url = {
      path = "/evento/nombre_url",
      method = "GET",
      required_params = {
        "nombre_url",
      },
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
    eliminar = {
      path = "/evento/guardar",
      method = "POST",
      required_params = {
        "data",
      },
    },
  },
}

M.client = client
return M
