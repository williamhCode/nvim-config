-- colorschemes
local util = require("wily.util.colors")

local color = require("onedarkpro.helpers")
local colors = color.get_preloaded_colors()

require("onedarkpro").setup({
  plugins = {
    all = false,
    native_lsp = true,
    treesitter = true,
    -- neo_tree = true,
  },
  highlights = {
    ["@constructor.python"] = { fg = "${yellow}" },

    DiagnosticError = { fg = "${red}" },
    DiagnosticWarn = { fg = "${yellow}" },
    DiagnosticInfo = { fg = "${blue}" },
    DiagnosticHint = { fg = "${purple}" },

    DiagnosticSignError = { fg = "${red}" },
    DiagnosticSignWarn = { fg = "${yellow}" },
    DiagnosticSignInfo = { fg = "${blue}" },
    DiagnosticSignHint = { fg = "${purple}" },

    DiagnosticUnderlineError = { sp = "${red}", style = "undercurl" },
    DiagnosticUnderlineWarn = { sp = "${yellow}", style = "undercurl" },
    DiagnosticUnderlineInfo = { sp = "${blue}", style = "undercurl" },
    DiagnosticUnderlineHint = { sp = "${purple}", style = "undercurl" },

    DiagnosticVirtualTextError = { fg = "${red}", bg = util.darken(colors.red, 0.1, colors.bg) },
    DiagnosticVirtualTextWarn = { fg = "${yellow}", bg = util.darken(colors.yellow, 0.1, colors.bg) },
    DiagnosticVirtualTextInfo = { fg = "${blue}", bg = util.darken(colors.blue, 0.1, colors.bg) },
    DiagnosticVirtualTextHint = { fg = "${purple}", bg = util.darken(colors.purple, 0.1, colors.bg) },

    NeoTreeRootName = { fg = colors.orange, style = "bold" },
  }
})

vim.cmd("colorscheme onedark")

-- require("onedark").setup()
-- require("gruvbox").setup()
-- vim.cmd("colorscheme gruvbox")

-- highlights
-- vim.api.nvim_set_hl(0, "Search", {
--   fg = "LightBlue",
--   bg = "Brown"
-- })
