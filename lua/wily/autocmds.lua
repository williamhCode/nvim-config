-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  callback = function()
    vim.highlight.on_yank({
      -- higroup = "Visual",
      timeout = 150,
      on_visual = false,
    })
  end,
})

-- go to last location when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("last_location", {}),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- set glsl filetype
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.vert", "*.frag" },
  callback = function()
    vim.bo.filetype = "glsl"
  end
})

-- file switching
local group = vim.api.nvim_create_augroup("fileswitch_mapping", {})
local create_fileswitch_map = function(extensions)
  local create_autocmd = function(patterns)
    vim.api.nvim_create_autocmd("BufEnter", {
      group = group,
      pattern = "*" .. patterns[1],
      callback = function()
        local path_root = vim.fn.expand('%:r')
        local file_exists = vim.fn.filereadable(path_root .. patterns[2])
        if file_exists == 1 then
          vim.keymap.set('n', "<leader>-", ":edit " .. path_root .. patterns[2] .. "<CR>",
            { silent = true, buffer = true })
        end
      end
    })
  end
  create_autocmd(extensions)
  create_autocmd({ extensions[2], extensions[1] })
end

create_fileswitch_map({ ".pyx", ".pxd" })
create_fileswitch_map({ ".vert", ".frag" })
