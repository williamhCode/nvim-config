local no_filename = {
  "toggleterm",
  "neo-tree",
  "TelescopePrompt",
  "mason",
  "lazy"
}

local onedark = require("lualine.themes.onedark")

require("lualine").setup({
  options = {
    theme = onedark,
    globalstatus = true,
    component_separators = "|",
    section_separators = "",
    disabled_filetypes = { statusline = { --[[ "TelescopePrompt", "mason", "lazy", ]] "alpha" } },
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
        end
      },
    },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  }
})
