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

map("n", "<leader>m", "<cmd>Grapple tag<cr>");
-- map("n", "<leader>m", "<cmd>Grapple toggle<cr>");
map("n", "<leader>h", "<cmd>Grapple toggle_tags<cr>");
map("n", "<leader>H", "<cmd>Grapple toggle_scopes<cr>");
-- map("n", "<leader>j", "<cmd>Grapple cycle forward<cr>");
-- map("n", "<leader>J", "<cmd>Grapple cycle backward<cr>");
for i = 1, 9 do
  map("n", "<leader>" .. i, "<cmd>Grapple select index=" .. i .. "<cr>")
end
