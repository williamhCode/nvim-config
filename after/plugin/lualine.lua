local no_filename = {
  "toggleterm",
  "neo-tree",
  "TelescopePrompt",
  "mason",
  "lazy"
}

local path = vim.env.HOME .. "/.local/share/nvim/lazy/lualine.nvim/lua/lualine/?.lua"
package.path = package.path .. ";" .. path

local onedark = require("themes.onedark")

local winbar_settings = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {
    {
      "filetype",
      icon_only = true,
      color = { bg = "bg" }
    },
    {
      "filename",
      padding = 0,
      color = { bg = "bg", gui = "bold" },
      symbols = {
        modified = "●",
      }
    },
  },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {}
}

require("lualine").setup({
  options = {
    theme = onedark,
    globalstatus = true,
    component_separators = "|",
    section_separators = "",
    disabled_filetypes = {
      statusline = { "alpha" },
      winbar = { "alpha", "neo-tree", "tagbar", "undotree", "diff", "qf" },
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      {
        "diagnostics",
        symbols = {
          error = " ",
          warn = " ",
          hint = " ",
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
  winbar = winbar_settings,
  inactive_winbar = winbar_settings,
  -- extensions = { "neo-tree", "toggleterm" }
})

