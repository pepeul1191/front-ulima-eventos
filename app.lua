local lapis = require("lapis")
local app = lapis.Application()

app:get("/", function()
  return "Welcome to Lapis xd " .. require("lapis.version")
end)

return app
