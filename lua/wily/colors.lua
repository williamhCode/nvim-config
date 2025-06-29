-- colorschemes
local utils = require("wily.utils.colors")

local color = require("onedarkpro.helpers")
local colors = color.get_colors()

colors.git_add = "#73C991"
colors.git_add = "#60A27A"
colors.git_change = "#CE9866"
colors.git_delete = "#C74E39"
colors.git_delete = "#e06c75"

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
    LineNr = { fg = colors.gray },

    -- Syntax
    PreProc = { fg = colors.purple },
    Include = { fg = colors.purple },
    Operator = { fg = colors.white },
    Macro = { fg = colors.orange },
    PreCondit = { fg = colors.purple },
    StorageClass = { fg = colors.purple },
    Structure = { fg = colors.yellow },

    -- Treesitter
    ["@field"] = { fg = colors.red },
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { fg = colors.purple },
    ["@type.definition"] = { fg = colors.purple },
    ["@type.qualifier"] = { fg = colors.purple },
    ["@constant.builtin"] = { link = "@constant" },
    ["@function.builtin"] = { fg = colors.cyan },
    ["@punctuation.bracket"] = { fg = colors.fg },

    ["@lsp.type.struct.rust"] = { fg = colors.yellow },

    ["@lsp.type.comment"] = {},

    ["@field.lua"] = { fg = colors.red },
    ["@parameter.lua"] = { fg = colors.red, style = "italic" },
    ["@lsp.typemod.variable.defaultLibrary.lua"] = { fg = colors.red },

    ["@include.python"] = { fg = colors.purple },
    ["@type.builtin.python"] = { link = "@type" },
    ["@type.definition.python"] = { link = "@type" },
    ["@type.qualifier.python"] = { link = "@type" },

    ["@operator"] = { fg = colors.white },

    ["@type.c"] = { fg = colors.purple },
    ["@operator.c"] = { fg = colors.white },

    ["@operator.cpp"] = { fg = colors.white },
    ["@lsp.typemod.variable.readonly.cpp"] = {},

    ["@text.reference"] = { fg = colors.red },
    ["@text.literal"] = { link = "Comment" },
    ["@text.todo.unchecked"] = {},
    ["@text.todo.checked"] = {},
    ["@text.literal.block.markdown"] = {},

    -- TreesitterContext = { bg = colors.selection},

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
    -- DiagnosticUnderlineError = { fg = "NONE", sp = colors.red, style = "underdouble" },
    -- DiagnosticUnderlineWarn = { fg = "NONE", sp = colors.yellow, style = "underdouble" },
    DiagnosticUnderlineInfo = { fg = "NONE", sp = colors.blue, style = "underdashed" },
    DiagnosticUnderlineHint = { fg = "NONE", sp = colors.purple, style = "underdotted" },
    DiagnosticDeprecated = { fg = "NONE", sp = colors.purple, style = "underdotted" },

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

    DiffAdd = { bg = utils.darken(colors.git_add, 0.4, colors.bg) },
    DiffText = { bg = utils.darken(colors.git_add, 0.4, colors.bg) },
    DiffChange = { bg = utils.darken(colors.git_change, 0.4, colors.bg) },
    DiffDelete = { bg = utils.darken(colors.git_delete, 0.4, colors.bg) },

    DiffviewFolderSign = { fg = colors.blue },
    DiffviewFilePanelFileName = { fg = colors.fg },
    DiffviewFilePanelTitle = { fg = colors.orange, style = "bold" },
    DiffviewFilePanelCounter = { fg = colors.fg },
    DiffviewHash = { fg = colors.yellow },

    -- Neogit
    NeogitDiffAdd = { fg = colors.fg, bg = colors.diff_add },
    NeogitDiffDelete = { bg = colors.diff_delete },
    -- NeogitDiffAdd = { fg = colors.green,  },
    -- NeogitDiffDelete = { fg = colors.red },

    NeogitHunkHeaderHighlight = { fg = colors.bg, bg = colors.fg, style = "bold" },
    NeogitDiffAddHighlight = { fg = colors.fg, bg = colors.diff_add },
    NeogitDiffDeleteHighlight = { bg = colors.diff_delete },
    -- NeogitDiffAddHighlight = { fg = colors.green },
    -- NeogitDiffDeleteHighlight = { fg = colors.red },

    NeogitBranch = { fg = colors.yellow, style = "bold" },
    NeogitRemote = { fg = colors.green, style = "bold" },

    NeogitSectionHeader = { fg = colors.purple, style = "bold" },
    NeogitChangeModified = { fg = colors.purple, style = "bold" },

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

    FloatTitle = { fg = colors.bg, bg = colors.green },

    QuickFixLine = { bg = colors.color_column, style = "bold,italic" },
    qfLineNr = { fg = colors.comment },
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

-- rose pine configuration
local transparency = false

local groups = require("rose-pine.config").options.groups
local styles = require("rose-pine.config").options.styles

local highlight_groups = {
  WinBar = { fg = "text", bg = "NONE", bold = true },
  WinBarNC = { fg = "subtle", bg = "NONE", bold = true, inherit = false },
  DashboardHeader = { fg = "gold" },
  ["@property"] = { italic = true },
  ["@parameter"] = { italic = true },
  ["@lsp.typemod.variable.globalScope"] = { italic = true },
  -- variable initialization with () gets treated as functions by treesitter
  ["@lsp.typemod.variable.definition.cpp"] = { fg = "text" },

  -- TelescopeBorder = { fg = "overlay", bg = "overlay" },
  -- TelescopeNormal = { fg = "subtle", bg = "overlay" },
  -- TelescopeSelection = { fg = "text", bg = "highlight_med" },
  -- TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
  -- TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

  TelescopeTitle = { fg = "base", bg = "love" },
  TelescopePromptTitle = { fg = "base", bg = "pine" },
  TelescopePreviewTitle = { fg = "base", bg = "iris" },

  TelescopePromptNormal = { fg = "text", bg = "overlay" },
  TelescopePromptBorder = { bg = "overlay" },

  NeogurtImeNormal = { fg = "text", bg = "pine", blend = 25 },
  NeogurtImeSelected = { fg = "text", bg = "pine", blend = 25, underline = true, sp = "iris" },
}

if transparency then
  highlight_groups = vim.tbl_extend("force", highlight_groups, {
    DiagnosticVirtualTextError = { fg = groups.error },
    DiagnosticVirtualTextHint = { fg = groups.hint },
    DiagnosticVirtualTextInfo = { fg = groups.info },
    DiagnosticVirtualTextOk = { fg = groups.ok },
    DiagnosticVirtualTextWarn = { fg = groups.warn },

    DiagnosticUnderlineError = { fg = "NONE", undercurl = true },
    DiagnosticUnderlineWarn = { fg = "NONE", undercurl = true },

    -- FloatBorder = { fg = "muted", bg = "NONE" },
    -- FloatTitle = { fg = "foam", bg = "NONE", bold = styles.bold },
    Folded = { fg = "text", bg = "NONE" },
    -- NormalFloat = { bg = "NONE" },
    Normal = { fg = "text", bg = "NONE" },
    NormalNC = { fg = "text", bg = "NONE" },
    -- Pmenu = { fg = "subtle", bg = "NONE" },
    -- PmenuKind = { fg = "foam", bg = "NONE" },
    SignColumn = { fg = "text", bg = "NONE" },
    StatusLine = { fg = "subtle", bg = "NONE" },
    StatusLineNC = { fg = "muted", bg = "NONE" },
    TabLine = { bg = "NONE", fg = "subtle" },
    TabLineFill = { bg = "NONE" },
    TabLineSel = { fg = "text", bg = "NONE", bold = styles.bold },
  });
end

require("rose-pine").setup({
  variant = "auto",      -- auto, main, moon, or dawn
  dark_variant = "main", -- main, moon, or dawn
  dim_inactive_windows = false,
  -- extend_background_behind_borders = false,
  enable = {
    legacy_highlights = false,
    migrations = false,
    terminal = true,
  },
  styles = {
    bold = true,
    italic = false,
    -- transparency = true,
  },
  highlight_groups = highlight_groups
})

if vim.o.background == "light" then
  vim.cmd("colorscheme rose-pine")
else
  vim.cmd("colorscheme onedark")
end

local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
vim.api.nvim_set_hl(0, "NeogurtImeNormal", { fg = normal_hl.fg, bg = normal_hl.bg, sp = "green", underline = true })
