---@class grapple.lualine.component
---@field options grapple.lualine.options
local Component = require("lualine.component"):extend()

---@class grapple.lualine.options
local defaults = {
  -- icon = "󰛢",
  inactive = " %s ",
  active = "[%s]",
}

---@class grapple.lualine.options
function Component:init(opts)
  opts = vim.tbl_deep_extend("keep", opts or {}, defaults)
  Component.super:init(opts)
end

function Component:update_status()
  if package.loaded["grapple"] == nil then
    return
  end

  local ok, grapple = pcall(require, "grapple")
  if not ok then
    return
  end

  local tags, err = grapple.tags()
  if not tags then
    return err
  end

  local current = grapple.find({ buffer = 0 })

  local App = require("grapple.app")
  local app = App.get()
  local quick_select = app.settings:quick_select()
  local output = { "󰛢 " }
  for i, tag in ipairs(tags) do
    -- stylua: ignore
    -- local tag_str = tag.name and tag.name
    --     or quick_select[i] and quick_select[i]
    --     or i
    local tag_str = vim.fn.fnamemodify(tag.path, ":t:r")

    local tag_fmt = self.options.inactive
    if current and current.path == tag.path then
      tag_fmt = self.options.active
    end
    table.insert(output, string.format(tag_fmt, tag_str))
  end

  if #output == 1 then
    output = { "󰛢" }
  end

  return table.concat(output)
end

return Component
