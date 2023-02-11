local no_filename = {
  "toggleterm",
  "neo-tree"
}

require("lualine").setup({
  options = {
    theme = "onedark",
    globalstatus = true,
    component_separators = "|",
    section_separators = "",
    disabled_filetypes = { statusline = { "TelescopePrompt", "mason", "lazy", "alpha" } },
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
      -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
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
    -- lualine_x = {
    --   {
    --     "diff",
    --     symbols = {
    --       added = " ",
    --       modified = " ",
    --       removed = " ",
    --     },
    --   },
    -- },
    lualine_x = { "filetype" }
    -- lualine_y = { "filetype" },
    -- lualine_z = {
    --   { "progress", separator = "", padding = { left = 1, right = 0 } },
    --   { "location", padding = { left = 0, right = 1 } },
    -- },
  }
})
