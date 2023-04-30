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
dashboard.section.header.opts.hl = "DashboardHeader"
dashboard.section.buttons.val = {
  dashboard.button("SPC s f", "  Find file"),
  dashboard.button("SPC s o", "  Recently opened files"),
  dashboard.button("SPC s g", "  Find word"),
}

local padding_val = math.floor((vim.o.lines - 16) * 0.30)
dashboard.config.layout = {
  { type = "padding", val = padding_val },
  unpack(dashboard.config.layout)
}

-- fix for neo-tree
dashboard.config.opts.noautocmd = true

require('alpha').setup(dashboard.config)

