local no_filename = {
  "toggleterm",
  "neo-tree",
  "TelescopePrompt",
  "mason",
  "lazy",
}

local path = vim.env.HOME .. "/.local/share/nvim/lazy/lualine.nvim/lua/lualine/?.lua"
package.path = package.path .. ";" .. path

local onedark = require("themes.onedark")
-- onedark.normal.c = "Normal"

local theme
if vim.o.background == "light" then
  theme = "auto"
else
  theme = onedark
end

local winbar = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {
    {
      "filetype",
      padding = { left = 1, right = 0 },
      icon_only = true,
      color = { bg = "bg", },
    },
    {
      "filename",
      padding = 0,
      path = 0,
      color = "WinBar",
      symbols = {
        modified = "●",
      }
    },
  },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {}
}

local inactive_winbar = vim.deepcopy(winbar)
inactive_winbar.lualine_c[2].color = "WinBarNC"

require("lualine").setup({
  options = {
    theme = theme,
    globalstatus = true,
    component_separators = "",
    section_separators = "",
    disabled_filetypes = {
      statusline = { "alpha" },
      winbar = {
        "alpha",
        "neo-tree",
        "tagbar",
        "undotree",
        "diff",
        "qf",
        "DiffviewFiles",
        "DiffviewFileHistory",
        "NeogitStatus",

        "dap-repl",
        "dapui_breakpoints",
        "dapui_console",
        "dapui_scopes",
        "dapui_stacks",
        "dapui_watches",

        "dap-view",
        "dap-view-term",
      },
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { { require("wily.utils.lualine.grapple") } },
    lualine_c = {
      {
        "diagnostics",
        symbols = {
          error = " ",
          warn = " ",
          hint = "󰌶 ",
          info = " ",
        }
      },
      {
        "filename",
        path = 1,
        cond = function()
          for _, filetype in ipairs(no_filename) do
            if vim.bo.filetype == filetype then
              return false
            end
          end
          return true
        end
      },
      {
        "filename",
        path = 0,
        cond = function()
          if vim.bo.filetype == "toggleterm" then
            return true
          end
          return false
        end
      },
    },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  tabline = {
    lualine_a = {
      {
        "tabs",
        max_length = 1000,
        mode = 2, -- 0: Shows tab_nr
                  -- 1: Shows tab_name
                  -- 2: Shows tab_nr + tab_name
        path = 0, -- 0: just shows the filename
                  -- 1: shows the relative path and shorten $HOME to ~
                  -- 2: shows the full path
                  -- 3: shows the full path and shorten $HOME to ~
      },
    },
  },
  winbar = winbar,
  inactive_winbar = inactive_winbar,
})

