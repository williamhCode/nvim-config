require('Comment').setup({
    ignore = '^$'
})

local map = vim.keymap.set 

map('n', "<M-s>/", "<Plug>(comment_toggle_linewise_current)")
map('x', "<M-s>/", "<Plug>(comment_toggle_linewise_visual)")
