local M = {}

--[[
  Returns a callback that calls the given function with the remaining
  arguments as the arguments of that function
--]]
M.callback = function(func, ...) local args = { ... }
  return function() return func(unpack(args)) end
end

--[[
  NOTE:
       Doesn't support bang versions yet

  USAGE:
      .keymap.n("<leader>h", "<cmd>help<CR>")
      .keymap.i("hello", "bello")
      .keymap.nvi(... , ...)

  EQUIVALENT:
      .keymap.n("<leader>h", ..., ...)
      .keymap.n["<leader>h"](..., ...)
      .keymap.n["<leader>h"] = { ..., ... }

--]]
M.keymap = setmetatable({}, {
  __index = function(_, idx)
    local mode = setmetatable({}, {__index = table})
    idx:gsub('.', function(c) mode:insert(c) end)
    setmetatable(mode, nil)
    return setmetatable({}, {
      __call = function(_, k, v, o)
        vim.keymap.set(mode, k, v, o)
      end,
      __index = function(_, idx)
        return function(v, o)
          vim.keymap.set(mode, idx, v, o)
        end
      end,
      __newindex = function(_, idx, val)
        vim.keymap.set(mode, idx, val[1], val[2])
      end
    })
  end
})

return M
