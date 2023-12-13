vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.fn.sign_define("DiagnosticSignError",
  { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
  { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
  { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
  { text = "󰌵", texthl = "DiagnosticSignHint" })

require("neo-tree").setup({
  default_component_configs = {
    icon = {
      folder_empty = "󰜌",
      folder_empty_open = "󰜌",
    },
    git_status = {
      symbols = {
        renamed  = "󰁕",
        unstaged = "󰄱",
      },
    },
  },
  document_symbols = {
    kinds = {
      File = { icon = "󰈙", hl = "Tag" },
      Namespace = { icon = "󰌗", hl = "Include" },
      Package = { icon = "󰏖", hl = "Label" },
      Class = { icon = "󰌗", hl = "Include" },
      Property = { icon = "󰆧", hl = "@property" },
      Enum = { icon = "󰒻", hl = "@number" },
      Function = { icon = "󰊕", hl = "Function" },
      String = { icon = "󰀬", hl = "String" },
      Number = { icon = "󰎠", hl = "Number" },
      Array = { icon = "󰅪", hl = "Type" },
      Object = { icon = "󰅩", hl = "Type" },
      Key = { icon = "󰌋", hl = "" },
      Struct = { icon = "󰌗", hl = "Type" },
      Operator = { icon = "󰆕", hl = "Operator" },
      TypeParameter = { icon = "󰊄", hl = "Type" },
      StaticMethod = { icon = "󰠄 ", hl = "Function" },
    }
  },
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
    window = {
      mappings = {
        ["O"] = "system_open",
      },
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        vim.cmd(string.format("silent !open '%s'", path))
      end,
    },
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
        state.commands["open"](state)
        vim.cmd("Neotree focus")
      end
    }
  }
})

local sidebar = require("wily.utils.sidebar")
sidebar.set_cmds("<D-b>",
  function() vim.cmd("Neotree toggle") end,
  function() vim.cmd("Neotree close") end
)
vim.keymap.set("n", "<leader>et", "<cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>ef", "<cmd>Neotree focus<CR>")
vim.keymap.set("n", "<leader>er", "<cmd>Neotree reveal<CR>")
