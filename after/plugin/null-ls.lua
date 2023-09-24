require("mason-null-ls").setup({
  ensure_installed = { "black" }
})

local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

null_ls.setup({
  on_attach = function(client, bufnr)
    local map = vim.keymap.set
    local opts = { buffer = bufnr }
    if vim.o.filetype ~= "python" then
      map("n", "[d", vim.diagnostic.goto_prev, opts)
      map("n", "]d", vim.diagnostic.goto_next, opts)
      map("n", "<leader>lf", vim.diagnostic.open_float, opts)
    end
    vim.opt.formatexpr = ""
  end,
  sources = {
    null_ls.builtins.formatting.black,
  },
})

local cython_lint = {
  name = "cython_lint",
  filetypes = { "pyrex" },
  method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
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

local u = require("null-ls.utils")
local from_errorformat = function(efm, source)
  return function(params, done)
    local output = vim.fn.substitute(params.output, [[\%(\e\[[0-9;]*m\)\+]], "", "g")

    if not output then
      return done()
    end

    local diagnostics = {}
    local lines = u.split_at_newline(params.bufnr, output)

    local qflist = vim.fn.getqflist({ efm = efm, lines = lines })
    local severities = { e = 1, w = 2, i = 3, n = 4 }

    for _, item in pairs(qflist.items) do
      if item.valid == 1 then
        local col = item.col > 0 and item.col - 1 or 0
        table.insert(diagnostics, {
          row = item.lnum,
          col = col,
          source = source,
          message = item.text,
          severity = severities[item.type],
        })
      end
    end

    return done(diagnostics)
  end
end

local wgsl_validation = {
  name = "wgsl_validation",
  filetypes = { "wgsl" },
  method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
  -- generator = null_ls.generator({
  --   command = "naga",
  --   args = { "$FILENAME" },
  --   format = "raw",
  --   from_stderr = true,
  --   on_output = from_errorformat(
  --     table.concat({
  --       "%Eerror: ",
  --       "%Eerror: %m",
  --       "%C   ┌─ %f:%l:%c",
  --     }, ","),
  --     "naga"
  --   ),
  -- }),
  generator = null_ls.generator({
    command = "./tint",
    args = { "--format", "wgsl", "--validate", "$FILENAME" },
    format = "raw",
    from_stderr = true,
    on_output = from_errorformat(
      table.concat({
        "%E%f:%l:%c error: %m",
      }, ","),
      "tint"
    ),
  }),
}

null_ls.register(cython_lint)
null_ls.register(wgsl_validation)
