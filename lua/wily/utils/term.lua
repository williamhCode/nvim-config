local map = vim.keymap.set
local toggleterm = require("toggleterm")

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

M.set_global_build_cmd = function(mapping, cmd)
  map("n", mapping, function()
    vim.cmd("wall")
    vim.cmd(vim.fn.expandcmd(cmd))
  end)
end

M.set_global_term_cmd = function(mapping, cmd)
  map("n", mapping, function()
    vim.cmd("wall")
    toggleterm.exec(vim.fn.expandcmd(cmd), vim.v.count)
  end)
end

local Terminal = require("toggleterm.terminal").Terminal
Current_make_term = nil

M.spawn_make = function()
  local lines = {}
  local currLine = ""

  ---@param data string[]
  local function on_stdout(t, job, data, name)
    if data then
      for _, line in ipairs(data) do
        currLine = currLine .. line
        if currLine:sub(-1) == "\r" then
          table.insert(lines, currLine)
          currLine = ""
        end
      end
    end
  end

  local cmd = vim.fn.expandcmd(vim.o.makeprg);
  local efm = vim.o.errorformat

  local function on_exit(t, job, exit_code, name)
    -- remove ansi codes from lines
    for i, line in ipairs(lines) do
      lines[i] = vim.fn.substitute(line, [[\%(\e\[[0-9;]*[a-zA-Z]\)\+\|\r]], "", "g")
    end

    -- don't populate quickfix if successful or interrupted
    if exit_code == 0 or exit_code == 130 then
      Current_make_term:close()
    else
      Current_make_term:close()

      vim.fn.setqflist({}, " ", {
        title = cmd,
        lines = lines,
        efm = efm,
      })
      -- open quickfix if there are errors
      local height = math.floor(vim.o.lines * 0.35)
      vim.cmd("botright copen " .. height)
      -- vim.cmd("doautocmd QuickFixCmdPost")
    end
  end

  vim.cmd("cclose")
  if Current_make_term then
    Current_make_term:close()
  end

  Current_make_term = Terminal:new({
    cmd = cmd,
    direction = "vertical",
    on_stdout = on_stdout,
    on_exit = on_exit,
    close_on_exit = false,
  })

  Current_make_term:toggle()
  vim.cmd("stopinsert")
end

M.toggle_current_make_term = function()
  if Current_make_term then
    Current_make_term:toggle()
  end
end

-- Current_make_term = nil

-- M.spawn_make = function()
--   local lines = {}
--   local currLine = ""

--   ---@param data string[]
--   local function on_stdout(job, data, name)
--     if data then
--       for _, line in ipairs(data) do
--         currLine = currLine .. line
--         if currLine:sub(-1) == "\r" then
--           table.insert(lines, currLine)
--           currLine = ""
--         end
--       end
--     end
--   end

--   local cmd = vim.fn.expandcmd(vim.o.makeprg);
--   local efm = vim.o.errorformat

--   local function on_exit(job, exit_code, name)
--     -- remove ansi codes from lines
--     for i, line in ipairs(lines) do
--       lines[i] = vim.fn.substitute(line, [[\%(\e\[[0-9;]*[a-zA-Z]\)\+\|\r]], "", "g")
--     end

--     vim.fn.setqflist({}, " ", {
--       title = cmd,
--       lines = lines,
--       efm = efm,
--     })

--     -- don't open quickfix if successful or interrupted
--     if exit_code == 0 or exit_code == 130 then
--       Current_make_term:close()
--     else
--       Current_make_term:close()
--       -- open quickfix if there are errors
--       local height = math.floor(vim.o.lines * 0.35)
--       vim.cmd("botright copen " .. height)
--       -- vim.cmd("doautocmd QuickFixCmdPost")
--     end
--   end

--   vim.cmd("cclose")
--   if Current_make_term then
--     Current_make_term:close()
--   end

--   Current_make_term = require("terminal").terminal:new({
--     layout = {
--       open_cmd = "botright vnew"
--     },
--     cmd = cmd,
--     on_stdout = on_stdout,
--     on_exit = on_exit,
--     autoclose = false,
--   })

--   Current_make_term:open()
--   vim.cmd("stopinsert")
-- end

-- M.toggle_current_make_term = function()
--   if Current_make_term then
--     Current_make_term:toggle()
--   end
-- end

return M
