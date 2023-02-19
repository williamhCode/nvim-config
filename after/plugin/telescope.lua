local Path = require("plenary.path")

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
    path_display = function(opts, path)
      -- make relative to cwd for oldfiles
      path = Path:new(path):make_relative(opts.cwd)
      local tail = require("telescope.utils").path_tail(path)
      local head = string.sub(path, 1, #path - #tail - 1)
      return string.format("%-15s  %s", tail, head)
    end,
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

local map = vim.keymap.set
local builtin = require("telescope.builtin")

local function better_find_files(opts)
  opts = opts or {}
  -- we only want to do it if we have a gitignore and no .git dir
  if vim.fn.filereadable(".gitignore") == 1 and vim.fn.isdirectory(".git/") == 0 and vim.fn.filereadable(".git") == 0 then
    opts.find_command = { "rg", "--files", "--glob", "--ignore-file", ".gitignore" }
  end
  builtin.find_files(opts)
end

map("n", "<C-p>", ":Telescope<CR>")
map("n", "<leader>sf", better_find_files)
map("n", "<leader>sg", builtin.live_grep)
map("n", "<leader>sb", builtin.buffers)
map("n", "<leader>so", builtin.oldfiles)
