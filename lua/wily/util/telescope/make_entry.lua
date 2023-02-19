local utils = require("telescope.utils")
local Path = require("plenary.path")

local make_entry = {}

local handle_entry_index = function(opts, t, k)
  local override = ((opts or {}).entry_index or {})[k]
  if not override then
    return
  end

  local val, save = override(t, opts)
  if save then
    rawset(t, k, val)
  end
  return val
end

do
  local lookup_keys = {
    ordinal = 1,
    value = 1,
    filename = 1,
    cwd = 2,
  }

  make_entry.gen_from_file = function(opts)
    opts = opts or {}

    local cwd = vim.fn.expand(opts.cwd or vim.loop.cwd())

    local disable_devicons = opts.disable_devicons

    local mt_file_entry = {}

    mt_file_entry.cwd = cwd
    mt_file_entry.display = function(entry)
      local tail = utils.path_tail(entry.value)

      local hl_group
      local display = utils.transform_path(opts, entry.value)

      display, hl_group = utils.transform_devicons(entry.value, display, disable_devicons)

      -- find the index of the end of the tail in the path
      local _, i = string.find(display, tail, 1, true)

      if hl_group then
        return display, { { { 1, 3 }, hl_group }, { { i, #display }, "TelescopeDirectoryCustom" } }
      else
        return display
      end
    end

    mt_file_entry.__index = function(t, k)
      local override = handle_entry_index(opts, t, k)
      if override then
        return override
      end

      local raw = rawget(mt_file_entry, k)
      if raw then
        return raw
      end

      if k == "path" then
        local retpath = Path:new({ t.cwd, t.value }):absolute()
        if not vim.loop.fs_access(retpath, "R", nil) then
          retpath = t.value
        end
        return retpath
      end

      return rawget(t, rawget(lookup_keys, k))
    end

    if opts.file_entry_encoding then
      return function(line)
        line = vim.iconv(line, opts.file_entry_encoding, "utf8")
        return setmetatable({ line }, mt_file_entry)
      end
    else
      return function(line)
        return setmetatable({ line }, mt_file_entry)
      end
    end
  end
end

return make_entry
