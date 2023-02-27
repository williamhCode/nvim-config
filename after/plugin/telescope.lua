local Path = require("plenary.path")
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
        ["<M-h>"] = { "<C-w>", type = "command" },
      }
    },
    winblend = 10,
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
      sort_lastused = true,
    },
    oldfiles = {
      cwd_only = true,
    }
  },
})

local opts = {
  path_display = function(opts, path)
    -- make relative to cwd for oldfiles
    path = Path:new(path):make_relative(opts.cwd)
    local tail = utils.path_tail(path)
    local head = string.sub(path, 1, math.max(#path - #tail - 1, 0))
    return string.format("%-15s  %s", tail, head)
  end,
}

local entry_maker = require("wily.util.telescope.make_entry").gen_from_file(opts)

map("n", "<leader>sf", function()
  require("wily.util.telescope").better_find_files({
    entry_maker = entry_maker,
  })
end)

map("n", "<leader>so", function()
  builtin.oldfiles({
    entry_maker = entry_maker,
  })
end)

map("n", "<C-p>", ":Telescope<CR>")
map("n", "<leader>sg", builtin.live_grep)
map("n", "<leader>sb", builtin.buffers)
