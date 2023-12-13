local M = {}

---@type table<string, table<function, function>>
local data = {}

---@param mapping string
---@param toggle function
---@param close function
M.set_cmds = function(mapping, toggle, close)
  mapping = require("wily.utils.keymap").convert(mapping)
  data[mapping] = { toggle, close }
  vim.keymap.set("n", mapping,
    function()
      for key, value in pairs(data) do
        if key ~= mapping then
          value[2]()
        end
      end
      data[mapping][1]()
    end)
end

return M
