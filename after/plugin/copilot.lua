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

