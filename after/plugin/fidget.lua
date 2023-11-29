require("fidget").setup({
  progress = {
    ignore_done_already = true,
    ignore = { "jdtls" },

    display = {
      render_limit = 5,
      done_ttl = 1,
    },
  },

  notification = {
    window = {
      winblend = 0,
    }
  }
})
