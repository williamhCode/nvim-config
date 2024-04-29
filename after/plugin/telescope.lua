local Path = require("plenary.path")
local telescope = require("telescope")
local utils = require("telescope.utils")
local builtin = require("telescope.builtin")
local map = vim.keymap.set

local project_actions = require("telescope._extensions.project.actions")
local command = [[
selected=$({ 
    echo ~/;
    echo ~/.dotfiles;
    echo ~/.config/nvim; 
    echo ~/Documents/Notes;
    echo ~/Documents/Work/Resume stuff;
    find ~/Documents/Coding -mindepth 2 -maxdepth 2 -type d; 
})
echo $selected
]]
local base_dirs = vim.fn.systemlist(command)
-- resolve paths
for i, dir in ipairs(base_dirs) do
  base_dirs[i] = vim.fn.resolve(dir)
end
-- vim.print(base_dirs)

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
      sort_lastused = true,
    },
    oldfiles = {
      cwd_only = true,
    }
  },
  fzf = {
    fuzzy = true,                   -- false will only do exact matching
    override_generic_sorter = true, -- override the generic sorter
    override_file_sorter = true,    -- override the file sorter
    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
  },

  extensions = {
    project = {
      -- base_dirs = base_dirs,
      on_project_selected = function(prompt_bufnr)
        project_actions.change_working_directory(prompt_bufnr, false)
        -- local harpoon = require("harpoon")
        -- harpoon:list():select(1)
      end
    }
  }
})

telescope.load_extension("fzf")
-- telescope.load_extension("project")

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
map("n", "<leader>sg", builtin.live_grep)
map("n", "<leader>sb", builtin.buffers)

-- telescope project
-- map("n", "<leader>sp", function() telescope.extensions.project.project({display_type = "full"}) end)
