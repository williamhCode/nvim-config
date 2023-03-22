-- colorschemes
local utils = require("wily.utils.colors")

local color = require("onedarkpro.helpers")
local colors = color.get_colors()

require("onedarkpro").setup({
  plugins = {
    all = false,
    treesitter = true,
    nvim_lsp = true,
    lsp_semantic_tokens = true,
  },
  highlights = {
    -- Editor
    MatchParen = { bg = colors.selection },
    Search = { fg = colors.bg, bg = colors.yellow },
    IncSearch = { fg = colors.bg, bg = colors.orange },
    Cursor = { fg = colors.black, bg = colors.white },
    TermCursor = { fg = colors.black, bg = colors.white },
    CursorLine = { bg = colors.color_column },
    CursorLineNr = { fg = colors.line_number },
    TabLineSel = { fg = colors.bg, bg = colors.fg },

    -- Syntax
    PreProc = { fg = colors.purple },
    Include = { fg = colors.purple },
    Operator = { fg = colors.purple },
    Macro = { fg = colors.orange },
    PreCondit = { fg = colors.purple },
    -- Type = { fg = colors.purple },
    StorageClass = { fg = colors.purple },

    -- Treesitter
    ["@field"] = { fg = colors.red },
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { fg = colors.purple },
    ["@type.definition"] = { fg = colors.purple },
    ["@type.qualifier"] = { fg = colors.purple },
    ["@constant.builtin"] = { link = "@constant" },
    ["@function.builtin"] = { fg = colors.cyan },

    ["@field.lua"] = { fg = colors.red },
    ["@parameter.lua"] = { fg = colors.red, style = "italic" },
    ["@lsp.typemod.variable.defaultLibrary.lua"] = { fg = colors.red },

    ["@include.python"] = { fg = colors.purple },

    ["@type.c"] = { fg = colors.purple },
    ["@operator.c"] = { fg = colors.white },
    ["@operator.cpp"] = { fg = colors.white },

    ["@text.reference"] = { fg = colors.red },
    ["@text.literal"] = { link = "Comment" },

    -- Lsp
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = colors.blue },
    DiagnosticHint = { fg = colors.purple },

    DiagnosticSignError = { fg = colors.red },
    DiagnosticSignWarn = { fg = colors.yellow },
    DiagnosticSignInfo = { fg = colors.blue },
    DiagnosticSignHint = { fg = colors.purple },

    DiagnosticUnderlineError = { sp = colors.red, style = "undercurl" },
    DiagnosticUnderlineWarn = { sp = colors.yellow, style = "undercurl" },
    DiagnosticUnderlineInfo = { sp = colors.blue, style = "undercurl" },
    DiagnosticUnderlineHint = { sp = colors.purple, style = "undercurl" },

    DiagnosticVirtualTextError = { fg = colors.red, bg = utils.darken(colors.red, 0.1, colors.bg) },
    DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = utils.darken(colors.yellow, 0.1, colors.bg) },
    DiagnosticVirtualTextInfo = { fg = colors.blue, bg = utils.darken(colors.blue, 0.1, colors.bg) },
    DiagnosticVirtualTextHint = { fg = colors.purple, bg = utils.darken(colors.purple, 0.1, colors.bg) },

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
    TelescopeNormal = { fg = colors.fg, bg = colors.float_bg },
    TelescopeBorder = { fg = colors.gray, bg = colors.float_bg },

    TelescopePromptNormal = { fg = colors.fg, bg = colors.fg_gutter },
    TelescopePromptBorder = { fg = colors.fg, bg = colors.fg_gutter },
    TelescopePromptTitle = { fg = colors.float_bg, bg = colors.red },
    TelescopePromptCounter = { fg = colors.gray, bg = colors.fg_gutter },

    TelescopeResultsTitle = { fg = colors.float_bg, bg = colors.float_bg },

    TelescopePreviewTitle = { fg = colors.float_bg, bg = colors.green },

    TelescopeMatching = { fg = colors.orange, style = "bold" },

    TelescopeDirectoryCustom = { fg = colors.comment },

    -- Alpha
    DashboardHeader = { fg = colors.yellow },
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
