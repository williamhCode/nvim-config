require("copilot").setup({
  suggestion = {
    auto_trigger = false,
    keymap = {
      accept = "<M-e>",
      next = "<M-n>",
    }
  },
  filetypes = {
    toggleterm = false,
    TelescopePrompt = false,
  }
})
