-- colorschemes
local util = require("wily.util.colors")

local color = require("onedarkpro.helpers")
local colors = color.get_colors()

require("onedarkpro").setup({
  plugins = {
    all = false,
    treesitter = true,
    native_lsp = true,
  },
  highlights = {
    -- Syntax
    MatchParen = { bg = colors.selection },
    IncSearch = { fg = colors.orange, bg = colors.selection },
    Cursor = { fg = colors.black, bg = colors.white },
    TermCursor = { fg = colors.black, bg = colors.white },

    -- Treesitter
    ["@constructor.python"] = { fg = "${yellow}" },

    -- Lsp
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

    -- Neo-tree
    NeoTreeRootName = { fg = colors.orange, style = "bold" },
    NeoTreeGitAdded = { fg = colors.green },
    NeoTreeGitDeleted = { fg = colors.red },
    NeoTreeGitModified = { fg = colors.yellow },
    NeoTreeGitConflict = { fg = colors.red, style = "bold,italic" },
    NeoTreeGitUntracked = { fg = colors.red, style = "italic" },
    NeoTreeIndentMarker = { fg = colors.gray },
    NeoTreeSymbolicLinkTarget = { fg = colors.purple },

    -- Telescope
    TelescopeBorder = { fg = colors.gray },
    TelescopeMatching = { fg = colors.orange, style = "bold" },
    TelescopePromptPrefix = { fg = colors.green },
  },
  styles = {
    types = "NONE",
    methods = "NONE",
    numbers = "NONE",
    strings = "NONE",
    comments = "italic",
    keywords = "NONE",
    constants = "NONE",
    functions = "NONE",
    operators = "NONE",
    variables = "NONE",
    parameters = "italic",
    conditionals = "NONE",
    virtual_text = "NONE",
  },
})

vim.cmd("colorscheme onedark")

-- require("onedark").setup()
-- require("gruvbox").setup()
-- vim.cmd("colorscheme gruvbox")
