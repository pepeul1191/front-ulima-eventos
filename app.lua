local lapis = require("lapis")
local config = require("lapis.config").get()
local app = lapis.Application()

app:get("/", function()
  return "Welcome to Lapis xd " .. require("lapis.version")
end)

return app
