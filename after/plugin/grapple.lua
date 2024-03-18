require("grapple").setup({
  scope = "git",
  style = "relative",
  tag_title = function(scope)
    return "Grapple " .. scope.name
  end,
  win_opts = {
    -- Can be fractional
    width = 60,
    height = 10,
    row = 0.5,
    col = 0.5,

    relative = "editor",
    border = "solid",
    focusable = false,
    style = "minimal",
    title_pos = "center",

    -- Custom: fallback title for Grapple windows
    title = "Grapple",

    -- Custom: adds padding around window title
    title_padding = " ",
  },
})

local map = require("wily.utils.keymap").map

map("n", "<leader>m", function()
  require("grapple").tag({
    -- use filename for name
    name = vim.fn.expand("%:t:r"),
  })
end)
-- map("n", "<leader>m", "<cmd>Grapple toggle<cr>");
map("n", "<leader>k", "<cmd>Grapple toggle_tags<cr>");
map("n", "<leader>K", "<cmd>Grapple toggle_scopes<cr>");
-- map("n", "<leader>j", "<cmd>Grapple cycle forward<cr>");
-- map("n", "<leader>J", "<cmd>Grapple cycle backward<cr>");
map("n", "<leader>1", "<cmd>Grapple select index=1<cr>");
map("n", "<leader>2", "<cmd>Grapple select index=2<cr>");
map("n", "<leader>3", "<cmd>Grapple select index=3<cr>");
map("n", "<leader>4", "<cmd>Grapple select index=4<cr>");
