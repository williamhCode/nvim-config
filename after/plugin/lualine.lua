local no_filename = {
  "toggleterm",
  "neo-tree"
}

local onedark = require("lualine.themes.onedark")

require("lualine").setup({
  options = {
    theme = onedark,
    globalstatus = true,
    component_separators = "|",
    section_separators = "",
    disabled_filetypes = { statusline = { "mason", "lazy", "alpha" } },
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
    },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  }
})
