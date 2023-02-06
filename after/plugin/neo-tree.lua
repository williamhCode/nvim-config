vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

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
      hide_dotfiles = false,
      never_show = {
        ".DS_Store",
      },
    },
  },
  window = {
    mappings = {
      ["l"] = "none",
      ["h"] = "close_node",
      ["l"] = "open",
      ["<TAB>"] = function(state)
        require("neo-tree.sources.filesystem.commands").open(state)
        require("neo-tree.command").execute({ action = "focus" })
      end
    }
  }
})

vim.keymap.set('n', "<M-s>b", "<cmd>Neotree toggle<CR>")
vim.keymap.set('n', "<leader>et", "<cmd>Neotree toggle<CR>")
vim.keymap.set('n', "<leader>ef", "<cmd>Neotree focus<CR>")
vim.keymap.set('n', "<leader>er", "<cmd>Neotree reveal<CR>")

