require("copilot").setup({
  suggestion = {
    auto_trigger = false,
    keymap = {
      accept = "<M-e>",
      next = "<M-n>",
      -- prev = "<M-p>",
    }
  },
  filetypes = {
    toggleterm = false,
    TelescopePrompt = false,
  }
})

-- toggle copilot
local auto_trigger = false
vim.keymap.set("n", "<leader>ta", function()
  require("copilot.suggestion").toggle_auto_trigger()
  auto_trigger = not auto_trigger
  local message = auto_trigger and "enabled" or "disabled"
  print("auto_trigger " .. message)
end, { silent = true })
