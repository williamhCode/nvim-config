require("mason-null-ls").setup({
  ensure_installed = { "black" }
})

local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

null_ls.setup({
  on_attach = function(client, bufnr)
    if vim.o.filetype == "pyrex" then
      vim.opt.formatexpr = ""
    end
    local map = vim.keymap.set
    local opts = { buffer = bufnr }
    map('n', "[d", vim.diagnostic.goto_prev, opts)
    map('n', "]d", vim.diagnostic.goto_next, opts)
    map('n', "<leader>lf", vim.diagnostic.open_float, opts)
  end,
  sources = {
    null_ls.builtins.formatting.black
  },
})

local cython_lint = {
  method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
  filetypes = { "pyrex" },
  generator = null_ls.generator({
    command = "cython-lint",
    args = { "$FILENAME" },
    format = "line",
    from_stderr = true,
    on_output = helpers.diagnostics.from_patterns({
      {
        pattern = [[:(%d+):(%d+):(.*)]],
        groups = { "row", "col", "message" },
        overrides = {
          diagnostic = {
            severity = 2
          },
        },
      },
    }),
  }),
}

null_ls.register(cython_lint)
