local modroot = ...
local mod = setmetatable({}, {
  __index = function(_, idx)
    require(modroot .. '.' .. idx)
  end
})

_ = mod.config
_ = mod.keymaps
_ = mod.terminals
_ = mod.rescursor
_ = mod.background
_ = mod.bg_dbus_mon
