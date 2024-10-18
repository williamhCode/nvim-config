local M = {}

M.convert = function(mapping)
  if not (vim.g.neovide or vim.g.neogurt) then
    -- subsitute <D-letter> with <M-s>letter
    mapping = string.gsub(mapping, "<D%-(.)>", "<M-s>%1")
  end
  return mapping
end

M.map = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, M.convert(lhs), rhs, opts)
end

return M
