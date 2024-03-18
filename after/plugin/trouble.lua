-- https://github.com/folke/trouble.nvim?tab=readme-ov-file#setup
require("trouble").setup({
  mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  padding = false,
  cycle_results = false,
  action_keys = {
      jump = { "<cr>", "l", "<2-leftmouse>" },
      preview = "<tab>",
      close_folds = {"zM", "zm"},
      open_folds = {"zR", "zr"},
      toggle_fold = {"zA", "za"},
      previous = "k",
      next = "j",
      help = "?"
  },
  auto_preview = false,
})

local map = require("wily.utils.keymap").map
map("n", "<D-k>", function() require("trouble").toggle() end)
