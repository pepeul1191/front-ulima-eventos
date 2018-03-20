local M = {}
local constants = require("config.constants")

local function IndexCSS()
  if constants.AMBIENTE == "desarrollo" then
    return {
      "bower_components/bootstrap/dist/css/bootstrap.min",
      "bower_components/font-awesome/css/font-awesome.min",
      "assets/css/styles",
      "assets/css/login",
    }
  else
    return {
      "dist/login-min"
    }
  end
end

local function IndexJS()
  if constants.AMBIENTE == "desarrollo" then
    return {
      "bower_components/jquery/dist/jquery.min",
      "bower_components/bootstrap/dist/js/bootstrap.min",
    }
  else
    return {
      "dist/login-min"
    }
  end
end

M.IndexCSS = IndexCSS
M.IndexJS = IndexJS
return M
