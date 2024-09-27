vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

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
    hijack_netrw_behavior = "disabled",
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
        ["<BS>"] = "navigate_up_and_close",
      },
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        vim.cmd(string.format("silent !open '%s'", path))
      end,
      navigate_up_and_close = function(state)
        local fs = require("neo-tree.sources.filesystem")
        local utils = require("neo-tree.utils")
        local parent_path, _ = utils.split_path(state.path)
        if not utils.truthy(parent_path) then
          return
        end
        local path_to_reveal = nil
        local node = state.tree:get_node()
        if node then
          path_to_reveal = node:get_id()
        end
        if state.search_pattern then
          fs.reset_search(state, false)
        end
        fs._navigate_internal(state, parent_path, path_to_reveal, function()
          require("neo-tree.sources.common.commands").close_node(state)
        end, false)
      end
    },
  },
  commands = {
    copy_selector = function(state)
      local node = state.tree:get_node()
      local filepath = node:get_id()
      local filename = node.name
      local modify = vim.fn.fnamemodify

      local vals = {
        ["BASENAME"] = modify(filename, ":r"),
        ["EXTENSION"] = modify(filename, ":e"),
        ["FILENAME"] = filename,
        ["PATH (CWD)"] = modify(filepath, ":."),
        ["PATH (HOME)"] = modify(filepath, ":~"),
        ["PATH"] = filepath,
        ["URI"] = vim.uri_from_fname(filepath),
      }

      local options = vim.tbl_filter(
        function(val)
          return vals[val] ~= ""
        end,
        vim.tbl_keys(vals)
      )
      if vim.tbl_isempty(options) then
        vim.notify("No values to copy", vim.log.levels.WARN)
        return
      end
      table.sort(options)
      vim.ui.select(options, {
        prompt = "Choose to copy to clipboard:",
        format_item = function(item)
          return ("%s: %s"):format(item, vals[item])
        end,
      }, function(choice)
        local result = vals[choice]
        if result then
          vim.notify(("Copied: `%s`"):format(result))
          vim.fn.setreg("+", result)
        end
      end)
    end,
  },
  window = {
    position = "left",
    width = function()
      local width = vim.o.columns * 0.2
      width = math.max(width, 30)
      width = math.min(width, 40)
      return math.floor(width)
    end,
    mappings = {
      ["/"] = "none",
      ["z"] = "none",
      ["C"] = "close_all_nodes",
      ["L"] = "focus_preview",
      ["h"] = "close_node",
      ["l"] = "open",
      ["<TAB>"] = function(state)
        state.commands["open"](state)
        vim.cmd("Neotree focus")
      end,
      -- copy filename
      ["Y"] = "copy_selector",
    }
  }
})

local sidebar = require("wily.utils.sidebar")
sidebar.set_cmds("<D-b>",
  function() vim.cmd("Neotree toggle ./") end,
  function() vim.cmd("Neotree close") end
)
vim.keymap.set("n", "<leader>et", "<cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>ef", "<cmd>Neotree focus<CR>")
vim.keymap.set("n", "<leader>er", "<cmd>Neotree reveal<CR>")
vim.keymap.set("n", "<leader>eo", "<cmd>Neotree position=current dir=%:p:h reveal<CR>")
