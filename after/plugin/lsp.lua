-- vim.lsp.set_log_level("debug")

local lsp = require("wily.utils.lsp")

lsp.servers({
  "lua_ls",
  "pyright",
  "clangd",
  "jdtls",
  -- "omnisharp_mono",
  "omnisharp",
  "bashls",
  "texlab",
  "cmake",
  "rust_analyzer",
  "marksman",
  -- "wgsl_analyzer",
  "zls",
  "asm_lsp",
  "tsserver",
  -- "eslint"
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

-- lsp.configure("eslint", {
--   settings = {
--     eslint = {
--       format = {
--         enable = true
--       }
--     }
--   }
-- })

lsp.configure("omnisharp", {
  cmd = { "omnisharp" },

  -- Enables support for reading code style, naming convention and analyzer
  -- settings from .editorconfig.
  enable_editorconfig_support = true,

  -- If true, MSBuild project system will only load projects for files that
  -- were opened in the editor. This setting is useful for big C# codebases
  -- and allows for faster initialization of code navigation features only
  -- for projects that are relevant to code that is being edited. With this
  -- setting enabled OmniSharp may load fewer projects and may thus display
  -- incomplete reference lists for symbols.
  enable_ms_build_load_projects_on_demand = false,

  -- Enables support for roslyn analyzers, code fixes and rulesets.
  enable_roslyn_analyzers = false,

  -- Specifies whether 'using' directives should be grouped and sorted during
  -- document formatting.
  organize_imports_on_format = false,

  -- Enables support for showing unimported types and unimported extension
  -- methods in completion lists. When committed, the appropriate using
  -- directive will be added at the top of the current file. This option can
  -- have a negative impact on initial completion responsiveness,
  -- particularly for the first few completion sessions after opening a
  -- solution.
  enable_import_completion = false,

  -- Specifies whether to include preview versions of the .NET SDK when
  -- determining which version to use for project loading.
  sdk_include_prereleases = true,

  -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
  -- true
  analyze_open_documents_only = false,
})

lsp.setup()
