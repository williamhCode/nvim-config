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

-- https://github.com/igorlfs/nvim-dap-view?tab=readme-ov-file#configuration
require("dap-view").setup({
  winbar = {
    show = true,
    sections = { "watches", "exceptions", "breakpoints", "threads", "repl" },
    default_section = "watches",
  },
  windows = {
    height = 12,
    terminal = {
      position = "left",
      start_hidden = false,
    },
  }
})

local dap, dv = require("dap"), require("dap-view")
dap.listeners.before.attach["dap-view-config"] = function()
  dv.open()
end
dap.listeners.before.launch["dap-view-config"] = function()
  dv.open()
end
dap.listeners.before.event_terminated["dap-view-config"] = function()
  dv.close()
end
dap.listeners.before.event_exited["dap-view-config"] = function()
  dv.close()
end

local map = vim.keymap.set
map("n", "<leader>dc", "<cmd>DapContinue<CR>")
map("n", "<leader>dt", "<cmd>DapTerminate<CR>")
map("n", "<leader>dr", "<cmd>DapRestart<CR>")

-- local Hydra = require("hydra")

-- Hydra({
--   mode = "n",
--   body = "<leader>d",
--   heads = {
--     { "c", "<cmd>DapContinue<cr>" },
--     { "t", "<cmd>DapTerminate<cr>" },
--     { "r", "<cmd>DapRestart<cr>" },
--   }
-- })

