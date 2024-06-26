local M = {}

--[[
  Returns a callback that calls the given function with the remaining
  arguments as the arguments of that function
--]]
M.callback = function(func, ...) local args = { ... }
  return function() return func(unpack(args)) end
end

--[[
  NOTE: Doesn't support bang versions yet
  USAGE:
      .keymap.n("<leader>h", "<cmd>help<CR>")
      .keymap.i("hello", "bello")
      .keymap.nvi(... , ...)
--]]
M.keymap = setmetatable({}, {
  __index = function(_, idx)
    local mode = setmetatable({}, {__index = table})
    idx:gsub('.', function(c) mode:insert(c) end)
    setmetatable(mode, nil)
    return function(a, b, c)
      vim.keymap.set(mode, a, b, c)
    end
  end
})

return M
