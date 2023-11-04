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
    -- diffview = true,
  },
  options = {
    transparency = true
  },
  highlights = {
    NormalFloat = { bg = colors.float_bg },
    FloatBorder = { bg = colors.float_bg, fg = colors.gray },

    -- Editor
    MatchParen = { fg = "NONE", bg = colors.selection },
    Search = { fg = colors.bg, bg = colors.yellow },
    IncSearch = { fg = colors.bg, bg = colors.orange },
    Cursor = { fg = colors.black, bg = colors.white },
    TermCursor = { fg = colors.black, bg = colors.white },
    CursorLine = { bg = colors.color_column },
    CursorLineNr = { fg = colors.fg },
    TabLineSel = { fg = colors.bg, bg = colors.fg },
    SpecialKey = { fg = colors.comment },

    -- Syntax
    PreProc = { fg = colors.purple },
    Include = { fg = colors.purple },
    Operator = { fg = colors.purple },
    Macro = { fg = colors.orange },
    PreCondit = { fg = colors.purple },
    StorageClass = { fg = colors.purple },
    -- Structure = { fg = colors.yellow },

    -- Treesitter
    ["@field"] = { fg = colors.red },
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { fg = colors.purple },
    ["@type.definition"] = { fg = colors.purple },
    ["@type.qualifier"] = { fg = colors.purple },
    ["@constant.builtin"] = { link = "@constant" },
    ["@function.builtin"] = { fg = colors.cyan },

    ["@lsp.type.struct.rust"] = { fg = colors.yellow },

    ["@lsp.type.comment"] = {},

    ["@field.lua"] = { fg = colors.red },
    ["@parameter.lua"] = { fg = colors.red, style = "italic" },
    ["@lsp.typemod.variable.defaultLibrary.lua"] = { fg = colors.red },

    ["@include.python"] = { fg = colors.purple },
    ["@type.builtin.python"] = { link = "@type" },
    ["@type.definition.python"] = { link = "@type" },
    ["@type.qualifier.python"] = { link = "@type" },

    ["@type.c"] = { fg = colors.purple },
    ["@operator.c"] = { fg = colors.white },

    ["@operator.cpp"] = { fg = colors.white },
    ["@lsp.typemod.variable.readonly.cpp"] = {},

    ["@text.reference"] = { fg = colors.red },
    ["@text.literal"] = { link = "Comment" },
    ["@text.todo.unchecked"] = {},
    ["@text.todo.checked"] = {},

    -- Lsp
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = colors.blue },
    DiagnosticHint = { fg = colors.purple },

    DiagnosticSignError = { fg = colors.red },
    DiagnosticSignWarn = { fg = colors.yellow },
    DiagnosticSignInfo = { fg = colors.blue },
    DiagnosticSignHint = { fg = colors.purple },

    DiagnosticUnderlineError = { fg = "NONE", sp = colors.red, style = "undercurl" },
    DiagnosticUnderlineWarn = { fg = "NONE", sp = colors.yellow, style = "undercurl" },
    DiagnosticUnderlineInfo = { fg = "NONE", sp = colors.blue, style = "undercurl" },
    DiagnosticUnderlineHint = { fg = "NONE", sp = colors.purple, style = "undercurl" },

    DiagnosticVirtualTextError = { fg = colors.red, bg = utils.darken(colors.red, 0.1, colors.bg) },
    DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = utils.darken(colors.yellow, 0.1, colors.bg) },
    DiagnosticVirtualTextInfo = { fg = colors.blue, bg = utils.darken(colors.blue, 0.1, colors.bg) },
    DiagnosticVirtualTextHint = { fg = colors.purple, bg = utils.darken(colors.purple, 0.1, colors.bg) },

    -- DiagnosticVirtualTextError = { fg = colors.red },
    -- DiagnosticVirtualTextWarn = { fg = colors.yellow },
    -- DiagnosticVirtualTextInfo = { fg = colors.blue },
    -- DiagnosticVirtualTextHint = { fg = colors.purple },

    LspSignatureActiveParameter = { fg = colors.orange, style = "bold" },

    -- Neo-tree
    NeoTreeRootName = { fg = colors.orange, style = "bold" },
    NeoTreeGitAdded = { fg = colors.green },
    NeoTreeGitDeleted = { fg = colors.red },
    NeoTreeGitModified = { fg = colors.yellow },
    NeoTreeGitConflict = { fg = colors.red, style = "bold,italic" },
    NeoTreeGitUntracked = { fg = colors.red, style = "italic" },
    NeoTreeIndentMarker = { fg = colors.gray },
    NeoTreeSymbolicLinkTarget = { fg = colors.purple },

    -- Diff
    diffAdded = { fg = colors.green },
    diffChanged = { fg = colors.yellow },
    diffRemoved = { fg = colors.red },

    -- DiffAdd = { bg = "#054a4d" },
    -- DiffChange = { bg = colors.diff_add },
    DiffDelete = { fg = colors.gray, bg = colors.bg },
    DiffText = { bg = "#562C30" },

    DiffviewFolderSign = { fg = colors.blue },
    DiffviewFilePanelFileName = { fg = colors.fg },
    DiffviewFilePanelTitle = { fg = colors.orange, style = "bold" },
    DiffviewFilePanelCounter = { fg = colors.fg },
    DiffviewHash = { fg = colors.yellow },

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

    -- Tagbar
    TagbarHighlight = { fg = colors.orange, style = "bold" },
    TagbarScope = { fg = colors.yellow },
    TagbarType = { fg = colors.purple },

    -- Fidget
    -- FidgetTask = { link = "Normal" },
  },
  styles = {
    types = "NONE",
    methods = "NONE",
    numbers = "NONE",
    strings = "NONE",
    comments = "NONE",
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

-- require("catppuccin").setup({
--   flavour = "latte",
--   integrations = {
--     cmp = true,
--     neotree = true,
--     treesitter = true,
--     telescope = {
--       enabled = true,
--       -- style = "nvchad"
--     }
--   },
-- })

-- link FidgetTask highlight to background
vim.cmd("colorscheme onedark")

-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme github_light")
