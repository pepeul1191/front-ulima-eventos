local M = {}
local constants = require("config.constants")

local function IndexCSS()
  if constants.AMBIENTE == "desarrollo" then
    return {
      "bower_components/bootstrap/dist/css/bootstrap.min",
      "bower_components/font-awesome/css/font-awesome.min",
    }
  else
    return {
      "dist/home.min"
    }
  end
end

local function IndexJS()
  if constants.AMBIENTE == "desarrollo" then
    return {
      "bower_components/jquery/dist/jquery.min",
      "bower_components/bootstrap/dist/js/bootstrap.min",
      "bower_components/handlebars/handlebars.min",
      "bower_components/underscore/underscore-min",
      "bower_components/backbone/backbone-min",
    }
  else
    return {
      "dist/home.min"
    }
  end
end

M.IndexCSS = IndexCSS
M.IndexJS = IndexJS
return M
