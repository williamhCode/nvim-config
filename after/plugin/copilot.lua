require("copilot").setup({
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<M-e>",
    }
  },
  filetypes = {
    toggleterm = false,
    TelescopePrompt = false,
  }
})
