vim.g.tagbar_sort = 0
vim.g.tagbar_visibility_symbols = {
  public = " ",
  protected = " ",
}
vim.g.tagbar_autofocus = 1
vim.g.tagbar_position = "topleft vertical"

vim.g.tagbar_map_jump = "l"
vim.g.tagbar_map_preview = "<Tab>"
vim.g.tagbar_map_showproto = "p"

local sidebar = require("wily.utils.sidebar")
sidebar.set_cmds("<M-b>",
  function()
    local width = vim.o.columns * 0.2
    width = math.max(width, 30)
    width = math.min(width, 40)
    vim.g.tagbar_width = tostring(width)
    vim.cmd("TagbarToggle")
  end,
  vim.cmd.TagbarClose
)