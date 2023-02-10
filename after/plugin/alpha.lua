local dashboard = require('alpha.themes.dashboard')

local logo = [[
██╗    ██╗██╗██╗  ██╗   ██╗
██║    ██║██║██║  ╚██╗ ██╔╝
██║ █╗ ██║██║██║   ╚████╔╝ 
██║███╗██║██║██║    ╚██╔╝  
╚███╔███╔╝██║███████╗██║   
 ╚══╝╚══╝ ╚═╝╚══════╝╚═╝   
]]

dashboard.section.header.val = vim.split(logo, "\n")
dashboard.section.buttons.val = {
  dashboard.button("SPC s f", "  Find file"),
  dashboard.button("SPC s o", "  Recently opened files"),
  dashboard.button("SPC s g", "  Find word"),
}

dashboard.config.layout = {
  { type = "padding", val = 9 },
  unpack(dashboard.config.layout)
}

-- fix for neo-tree
dashboard.config.opts.noautocmd = true

require('alpha').setup(dashboard.config)

