local M = {}
local config = require("lapis.config")
local administracion_alumno = require("providers.administracion_alumno")
local inspect = require("inspect")
local ftp = require("socket.ftp")
local json = require("cjson")
local archivo_provider = require("providers.archivo")
local utils = require("config.utils")
local constants = require("config.constants")

local function Subir(self)
  return {
    before = function(self)
      --TODO: solo pasa si está logueado
    end,
    POST = function(self)
      local rpta = {}
      local file = self.params.myFile
      -- generar nombre del archivo  a subir a '/tmp' con el servicio de archivos
      local nombre_tmp_req = archivo_provider.client:obtener_id{}
      local temp_nombre_original = utils.split_dot(file.filename)
      local extension = temp_nombre_original[utils.count(temp_nombre_original)]
      -- nomber el archivo a /tmp
      local ruta_nombre_archivo_tmp = "/tmp/" .. nombre_tmp_req.body .. "." .. extension
      local xFile = io.open(ruta_nombre_archivo_tmp, "w")
      xFile:write(self.params.myFile.content)
      xFile:close()
      -- subir archivo de /tmp por FTP
      local f, e = ftp.put{
        host = constants.FTP.host,
        user = constants.FTP.user,
        password = constants.FTP.pass,
        command = "appe",
        argument = constants.FTP.directorio .. nombre_tmp_req.body .. "." .. extension,
        source = ltn12.source.file(io.open(ruta_nombre_archivo_tmp, "r"))
      }
      if(e ~= nil) then
        -- TODO: manejo de error
      else
        -- mandar al servicio de archivos los metadatos del archivo subido y retonar id
        local archivo = {
          id = nombre_tmp_req.body,
          --nombre = "XD",
          nombre_generado = nombre_tmp_req.body .. "." .. extension,
          extension = extension,
          ruta = constants.FTP.directorio .. nombre_tmp_req.body .. "." .. extension,
          --altura = 1,
          --anchura = 1,
          --mime = "",
        }
        local req = archivo_provider.client:crear{data = json.encode(archivo)}
        if (inspect(req.status) == '200') then
          local temp = json.decode(req.body)
          table.insert(temp.mensaje, constants.SERVICIOS.archivos .. nombre_tmp_req.body .. "." .. extension)
          rpta = json.encode(temp)
          return { rpta, layout = false}
        else
          rpta = req.body
          return { rpta, layout = false}
        end
      end
    end
  }
end

M.Subir = Subir
return M
