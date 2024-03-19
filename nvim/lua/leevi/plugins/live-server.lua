return {
  "aurum77/live-server.nvim",
  config = function()
    require("leevi.plugins.live-server")
  end,
  cmd = {
    "LiveServer",
    "LiveServerStart",
    "LiveServerStop",
    "LiveServerInstall",
  },
  build = function()
    require("live_server.util").install()
  end
}
