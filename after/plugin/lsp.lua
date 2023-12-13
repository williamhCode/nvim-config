-- vim.lsp.set_log_level("debug")

local lsp = require("wily.utils.lsp")

lsp.servers({
  "lua_ls",
  "pyright",
  "clangd",
  "jdtls",
  -- "omnisharp_mono",
  "bashls",
  "texlab",
  "cmake",
  "rust_analyzer",
  "marksman",
  -- "wgsl_analyzer",
  "zls",
  "asm_lsp",
})

lsp.on_attach(function(client, bufnr)
  if client.server_capabilities.signatureHelpProvider then
    require("lsp-overloads").setup(client, {
      ui = {
        border = "none",
        close_events = { "CursorMoved", "CursorMovedI", "InsertCharPre" },
        -- floating_window_above_cur_line = true,
      },
    })
  end

  if client.server_capabilities.documentHighlightProvider then
    local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = group,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = group,
    })
  end

  -- if client.server_capabilities.semanticTokensProvider then
  -- end

  local map = vim.keymap.set
  local opts = { buffer = bufnr }
  map("n", "<leader>sd", "<cmd>Telescope lsp_document_symbols<CR>", opts)
  map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
  map("n", "gI", "<cmd>Telescope lsp_implementations<CR>", opts)
  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gh", vim.lsp.buf.hover, opts)
  map("n", "gs", vim.lsp.buf.signature_help, opts)
  map("i", "<M-x>", vim.lsp.buf.signature_help, opts)
  map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  if client.name ~= "texlab" then
    map("n", "<leader>lca", vim.lsp.buf.code_action, opts)
    map("n", "<leader>lrn", vim.lsp.buf.rename, opts)
  end
  map({ "n", "v" }, "<M-F>", function() vim.lsp.buf.format({ async = true }) end, opts)
end)

-- server setups
lsp.nvim_workspace()

lsp.configure("jdtls", {
  settings = {
    java = {
      signatureHelp = {
        enabled = true
      },
      -- ["format.settings.url"] = "/Users/williamhou/.config/jdtls-format-settings.xml",
      -- ["format.settings.profile"] = "MyProfile",
    }
  }
})

lsp.configure("lua_ls", {
  settings = {
    Lua = {
      -- diagnostics = {
      --   disable = { "missing-fields" }
      -- },
      format = {
        enable = true,
        defaultConfig = {
          -- indent_style = "space",
          indent_size = "2",
          continuation_indent = "2",
          quote_style = "double",
          align_array_table = "false"
        }
      },
    }
  }
})

lsp.configure("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        autoImportCompletions = false,
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})

lsp.configure("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      rustfmt = {
        -- rangeFormatting = {
        --   enable = true
        -- }
      }
    }
  }
})

lsp.setup()
