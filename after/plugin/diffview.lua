local actions = require("diffview.actions")

require("diffview").setup({
  enhanced_diff_hl = true,
  view = {
    merge_tool = {
      layout = "diff3_mixed",
    },
  },
  hooks = {
    view_opened = function(view)
      local bufnr = vim.fn.bufnr()
      vim.keymap.set("n", "q", "<cmd>DiffviewClose<CR>", { buffer = bufnr })
    end,
  },
  keymaps = {
    file_panel = {
      { "n", "J", actions.select_next_entry, { desc = "Open the diff for the next file" } },
      { "n", "K", actions.select_prev_entry, { desc = "Open the diff for the previous file" } },
    },
    file_history_panel = {
      { "n", "J", actions.select_next_entry, { desc = "Open the diff for the next file" } },
      { "n", "K", actions.select_prev_entry, { desc = "Open the diff for the previous file" } },
    }
  }
})

local map = vim.keymap.set
map("n", "<leader>gd", "<Cmd>DiffviewOpen<CR>")
map("n", "<leader>gh", "<Cmd>DiffviewFileHistory<CR>")
map("n", "<leader>gH", "<Cmd>DiffviewFileHistory %<CR>")
