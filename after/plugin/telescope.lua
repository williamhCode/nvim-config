local Path = require("plenary.path")
local telescope = require("telescope")
local utils = require("telescope.utils")
local builtin = require("telescope.builtin")
local map = vim.keymap.set

require("telescope").setup({
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    sorting_strategy = "ascending",
    layout_strategy = "flex",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        -- height = 0.8,
        -- width = 0.70,
        -- preview_width = 0.45
      },
    },
    file_ignore_patterns = {
      "^%.git/",
      "^%.git$",
      ".DS_Store",
    },
    mappings = {
      n = {
        ["<C-c>"] = require("telescope.actions").close,
      },
      i = {
        ["<C-s>"] = "select_horizontal"
      }
    },
    -- winblend = 10,
    border = true,
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    color_devicons = true,
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      additional_args = { "--hidden" }
    },
    buffers = {
      sort_mru = true,
    },
    oldfiles = {
      cwd_only = true,
    },
    lsp_document_symbols = {
      symbol_width = 40,
    }
  },
  fzf = {
    fuzzy = true,                   -- false will only do exact matching
    override_generic_sorter = true, -- override the generic sorter
    override_file_sorter = true,    -- override the file sorter
    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
  },

  extensions = {
  }
})

telescope.load_extension("fzf")

local opts = {
  path_display = function(opts, path)
    -- make relative to cwd for oldfiles
    path = Path:new(path):make_relative(opts.cwd)
    local tail = utils.path_tail(path)
    local head = string.sub(path, 1, math.max(#path - #tail - 1, 0))
    return string.format("%-15s  %s", tail, head)
  end,
}

local entry_maker = require("wily.utils.telescope.make_entry").gen_from_file(opts)

map("n", "<leader>sf", function()
  require("wily.utils.telescope").better_find_files({
    -- entry_maker = entry_maker,
  })
end)

map("n", "<leader>so", function()
  builtin.oldfiles({
    -- entry_maker = entry_maker,
  })
end)

map("n", "<C-p>", ":Telescope<CR>")
map("n", "<leader>sb", builtin.buffers)
map("n", "<leader>sg", builtin.live_grep)
map("n", "<leader>s/", "<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=smart_case<cr>")
map("n", "<leader>sk", "<cmd>Telescope quickfix<cr>")
map("n", "<leader>sd", "<cmd>Telescope diagnostics bufnr=0 sort_by=severity<cr>")
