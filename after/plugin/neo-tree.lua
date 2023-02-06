
vim.fn.sign_define("DiagnosticSignError",
{text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
{text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
{text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
{text = "", texthl = "DiagnosticSignHint"})

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      hide_dotfiles = false
    }
  },
  window = {
    mappings = {
      ["l"] = "none",
      ["h"] = "close_node",
      ["l"] = "open"
    }
  }
})

vim.keymap.set('n', "<M-s>b", ":Neotree toggle<CR>", { silent = true } )
vim.keymap.set('n', "<leader>et", ":Neotree toggle<CR>", { silent = true } )
vim.keymap.set('n', "<leader>ef", ":Neotree focus<CR>", { silent = true } )
vim.keymap.set('n', "<leader>er", ":Neotree reveal<CR>", { silent = true } )

