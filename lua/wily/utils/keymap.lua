local M = {}

M.convert = function(mapping)
  if not vim.g.neovide then
    -- subsitute <D-letter> with <M-s>letter
    mapping = string.gsub(mapping, "<D%-(.)>", "<M-s>%1")
  end
  return mapping
end


return M
