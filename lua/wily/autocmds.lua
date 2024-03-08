local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("wily_highlight_yank", {}),
  callback = function()
    vim.highlight.on_yank({
      -- higroup = "Visual",
      timeout = 150,
      on_visual = false,
    })
  end,
})

-- go to last location when opening a buffer
autocmd("BufReadPost", {
  group = augroup("wily_last_location", {}),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- set filetypes
autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup("wily_glsl_ft", {}),
  pattern = { "*.vert", "*.frag" },
  callback = function()
    vim.bo.filetype = "glsl"
  end
})

autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup("wily_cmake_ft", {}),
  pattern = "CMakeLists.txt",
  callback = function()
    vim.bo.filetype = "cmake"
  end
})

-- press q to close buffer
autocmd("FileType", {
  group = augroup("wily_close_buffers", {}),
  pattern = { "qf", "help" },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
    vim.opt_local.buflisted = false
  end
})

--- @return string: the root path of the current file
local get_path_root = function()
  local path = vim.fn.expand("%")
  local prev_path = nil
  while path ~= prev_path do
    prev_path = path
    path = vim.fn.fnamemodify(path, ":r")
  end
  return path
end

-- file switching
local group = augroup("wily_fileswitch_mapping", {})
local create_fileswitch_map = function(extensions)
  local create_autocmd = function(patterns)
    autocmd("BufEnter", {
      group = group,
      pattern = "*" .. patterns[1],
      callback = function()
        local path_root = get_path_root()
        if string.find(path_root, "%.") then
          path_root = string.gsub(path_root, "%..*$", "")
        end
        local file_exists = vim.fn.filereadable(path_root .. patterns[2])
        if file_exists == 1 then
          vim.keymap.set("n", "<leader>-", ":edit " .. path_root .. patterns[2] .. "<CR>",
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
create_fileswitch_map({ ".vert.wgsl", ".frag.wgsl" })
-- create_fileswitch_map({ ".c", ".h" })

-- nohlsearch when cursor moves or enters insert mode
vim.cmd([[
noremap <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
noremap! <expr> <Plug>(StopHL) execute('nohlsearch')[-1]

fu! HlSearch()
    let s:pos = match(getline('.'), @/, col('.') - 1) + 1
    if s:pos != col('.')
        call StopHL()
    endif
endfu

fu! StopHL()
    if !v:hlsearch || mode() isnot 'n'
        return
    else
        sil call feedkeys("\<Plug>(StopHL)", 'm')
    endif
endfu

augroup wily_search_highlight
au!
    au CursorMoved * call HlSearch()
    au InsertEnter * call StopHL()
augroup end
]])

-- avoid scrolling when switching buffers
vim.cmd([[
" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif
]])

-- quickfix auto-open
autocmd("QuickFixCmdPost", {
  group = augroup("wily_quickfix", {}),
  pattern = "[^l]*",
  callback = function()
    vim.cmd("botright cwindow")
  end,
})

-- LuaSnip supertab fix
autocmd("ModeChanged", {
  group = augroup("wily_clear_supertab", {}),
  pattern = "*",
  callback = function()
    if ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
      and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})

-- neovide meta fix
autocmd("InsertEnter", {
  callback = function()
    vim.g.neovide_input_ime = true
  end,
})
autocmd("InsertLeave", {
  callback = function()
    vim.g.neovide_input_ime = false
  end,
})
