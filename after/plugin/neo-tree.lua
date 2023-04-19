vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.fn.sign_define("DiagnosticSignError",
  { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
  { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
  { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
  { text = "", texthl = "DiagnosticSignHint" })

require("neo-tree").setup({
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.opt_local.scrolloff = 0
        vim.opt_local.sidescrolloff = 0
        -- vim.opt.cursorline = true
      end
    }
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      never_show = {
        ".DS_Store",
      },
    },
    use_libuv_file_watcher = true,
  },
  window = {
    width = function()
      local width = vim.o.columns * 0.2
      width = math.max(width, 30)
      width = math.min(width, 40)
      return math.floor(width)
    end,
    mappings = {
      -- ["P"] = { "toggle_preview", config = { use_float = false } },
      ["/"] = "none",
      ["z"] = "none",
      ["C"] = "close_all_nodes",
      ["L"] = "focus_preview",
      ["h"] = "close_node",
      ["l"] = "open",
      ["<TAB>"] = function(state)
        require("neo-tree.sources.filesystem.commands").open(state)
        require("neo-tree.command").execute({ action = "focus" })
      end
    }
  }
})

-- vim.keymap.set("n", "<M-s>b", "<cmd>Neotree toggle<CR>")
local sidebar = require("wily.utils.sidebar")
sidebar.set_cmds("<M-s>b",
  function()
    vim.cmd("Neotree toggle")
  end,
  function()
    vim.cmd("Neotree close")
  end
)
vim.keymap.set("n", "<leader>et", "<cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>ef", "<cmd>Neotree focus<CR>")
vim.keymap.set("n", "<leader>er", "<cmd>Neotree reveal<CR>")
