local M = {}
local constants = require("config.constants")

local function IndexCSS()
  if constants.AMBIENTE == "desarrollo" then
    return {
      "bower_components/bootstrap/dist/css/bootstrap.min",
      "bower_components/font-awesome/css/font-awesome.min",
      "bower_components/swp-plugins/assets/css/mootools.autocomplete",
      "bower_components/swp-plugins/assets/css/mootools.grid",
      "bower_components/swp-plugins/assets/css/mootools.validations",
      "assets/css/styles",
    }
  else
    return {
      "dist/app-min"
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
      "bower_components/backbone.marionette/lib/backbone.marionette.min",
      "bower_components/swp-plugins/assets/js/mootools-core.min",
      "bower_components/swp-plugins/assets/js/mootools.min",
      "bower_components/swp-plugins/assets/js/mootools-interfaces.min",
      "bower_components/swp-plugins/assets/js/jquery.upload",
      "bower_components/swp-plugins/assets/js/mootools.chain",
      "bower_components/swp-plugins/assets/js/mootools.dao",
      "bower_components/swp-plugins/assets/js/mootools.autocomplete",
      "bower_components/swp-plugins/assets/js/mootools.form",
      "bower_components/swp-plugins/assets/js/mootools.observer",
      "bower_components/swp-plugins/assets/js/mootools.grid",
      "layouts/app",
      "views/_table_evento",
      "views/_table_alumno",
      "views/_table_empleado",
      "views/alumno",
      "views/empleado",
      "views/evento",
      "views/externo",
      "routes/app",
    }
  else
    return {
      "dist/app-min"
    }
  end
end

M.IndexCSS = IndexCSS
M.IndexJS = IndexJS
return M
