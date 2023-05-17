local map = vim.keymap.set
local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal

local M = {}

M.set_build_cmd = function(cmd)
  map("n", "<leader>b", function()
    vim.cmd("wall")
    vim.cmd(vim.fn.expandcmd(cmd))
  end, { buffer = true })
end

M.set_term_cmd = function(mapping, cmd)
  map("n", mapping, function()
    vim.cmd("wall")
    toggleterm.exec(vim.fn.expandcmd(cmd), vim.v.count)
  end, { buffer = true })
end

M.spawn_make = function()
  local lines = {}
  local makeprg = vim.o.makeprg
  if not makeprg then return end
  local cmd = vim.fn.expandcmd(makeprg)
  local errorformat = vim.o.errorformat

  local function on_stdout(t, job, data, name)
    if data then
      vim.list_extend(lines, data)
    end
  end

  local function on_exit(t, job, exit_code, name)
    -- remove ansi codes from lines
    for i, line in ipairs(lines) do
      lines[i] = vim.fn.substitute(line, [[\%(\e\[[0-9;]*m\)\+]], "", "g")
    end

    vim.fn.setqflist({}, " ", {
      title = cmd,
      lines = lines,
      efm = errorformat
    })
    vim.cmd("doautocmd QuickFixCmdPost")
  end

  local make_term = Terminal:new({
    cmd = cmd,
    on_stdout = on_stdout,
    on_exit = on_exit,
    -- close_on_exit = false
  })

  make_term:toggle()
end

return M
