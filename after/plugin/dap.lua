require("mason-nvim-dap").setup({
  ensure_installed = { "codelldb" },
  handlers = {
    function(config)
      require("mason-nvim-dap").default_setup(config)
    end,
    codelldb = function(config)
      config.configurations = {
        {
          name = "LLDB: Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            if vim.env.DEBUG_EXEC_PATH then
              return vim.env.DEBUG_EXEC_PATH
            end
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        }
      }
      require("mason-nvim-dap").default_setup(config)
    end,
  },
})

local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


local map = vim.keymap.set
map("n", "<leader>ds", "<cmd>DapContinue<CR>")
map("n", "<leader>de", "<cmd>DapTerminate<CR>")
