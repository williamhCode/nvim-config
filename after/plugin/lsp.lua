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
  -- "zls",
  -- "asm_lsp",
  "tsserver",
  -- "volar",
  "html",
  "nim_langserver",
})

lsp.on_attach(function(client, bufnr)
  -- if client.server_capabilities.signatureHelpProvider then
  --   require("lsp-overloads").setup(client, {
  --     ui = {
  --       border = "none",
  --       -- close_events = { "CursorMoved", "CursorMovedI", "InsertCharPre" },
  --       -- floating_window_above_cur_line = true,
  --     },
  --   })
  -- end

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
  map("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>", opts)
  if client.name == "omnisharp" then
    vim.cmd [[
    nnoremap gr <cmd>lua require('omnisharp_extended').telescope_lsp_references()<cr>
    " nnoremap <C-]> <cmd>lua require('omnisharp_extended').telescope_lsp_definition()<cr>
    nnoremap gt <cmd>lua require('omnisharp_extended').telescope_lsp_type_definition()<cr>
    nnoremap gI <cmd>lua require('omnisharp_extended').telescope_lsp_implementation()<cr>
    ]]
  else
    map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    -- map("n", "<C-]>", "<cmd>Telescope lsp_definitions<CR>", opts)
    map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
    map("n", "gI", "<cmd>Telescope lsp_implementations<CR>", opts)
  end
  map("n", "gd", vim.lsp.buf.declaration, opts)
  map("n", "gh", vim.lsp.buf.hover, opts)
  map("n", "gs", vim.lsp.buf.signature_help, opts)
  map("i", "<C-s>", vim.lsp.buf.signature_help, opts)
  map({ "n", "v" }, "<leader>lca", vim.lsp.buf.code_action, opts)
  map("n", "<leader>lrn", vim.lsp.buf.rename, opts)
  -- map({ "n", "v" }, "<M-F>", function() vim.lsp.buf.format({ async = true }) end, opts)
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

lsp.configure("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
  }
  -- settings = {
  --   clangd = {
  --     arguments = {
  --       "--clang-tidy",
  --       "--background-index",
  --     }
  --   }
  -- }
})

local util = require("lspconfig.util")

lsp.configure("pyright", {
  root_dir = function(fname)
    local root_files = {
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
      "pyrightconfig.json",
      ".git",
      ".venv",
    }
    return util.root_pattern(unpack(root_files))(fname)
  end,
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

local mason_registry = require("mason-registry")
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path() ..
  "/node_modules/@vue/language-server"

lsp.configure("tsserver", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
})

-- lsp.configure("volar", {
--   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
--   init_options = {
--     vue = {
--       hybridMode = false,
--     },
--   },
-- })

lsp.configure("omnisharp", {
  cmd = { "omnisharp" },

  settings = {
    FormattingOptions = {
      -- Enables support for reading code style, naming convention and analyzer
      -- settings from .editorconfig.
      EnableEditorConfigSupport = true,
      -- Specifies whether 'using' directives should be grouped and sorted during
      -- document formatting.
      OrganizeImports = nil,
    },
    MsBuild = {
      -- If true, MSBuild project system will only load projects for files that
      -- were opened in the editor. This setting is useful for big C# codebases
      -- and allows for faster initialization of code navigation features only
      -- for projects that are relevant to code that is being edited. With this
      -- setting enabled OmniSharp may load fewer projects and may thus display
      -- incomplete reference lists for symbols.
      LoadProjectsOnDemand = nil,
    },
    RoslynExtensionsOptions = {
      -- Enables support for roslyn analyzers, code fixes and rulesets.
      EnableAnalyzersSupport = nil,
      -- Enables support for showing unimported types and unimported extension
      -- methods in completion lists. When committed, the appropriate using
      -- directive will be added at the top of the current file. This option can
      -- have a negative impact on initial completion responsiveness,
      -- particularly for the first few completion sessions after opening a
      -- solution.
      EnableImportCompletion = nil,
      -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
      -- true
      AnalyzeOpenDocumentsOnly = nil,
    },
    Sdk = {
      -- Specifies whether to include preview versions of the .NET SDK when
      -- determining which version to use for project loading.
      IncludePrereleases = true,
    },
  },
})

lsp.setup()
