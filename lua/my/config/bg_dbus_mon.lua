if vim.fn.executable("dbus-monitor") ~= 1
  then return {}  -- we need dbus-monitor
end

local self = ...
local M = {
  sched= "",
}

local cmd = {
  "dbus-monitor",
  "--binary",
  vim.iter{
    "type=signal",
    "path=/org/freedesktop/portal/desktop",
    "interface=org.freedesktop.portal.Settings",
    "member=SettingChanged",
    "arg0=org.freedesktop.appearance",
    "arg1=color-scheme",
  }:join(","),
}


-- Checks if a bg change is already scheduled
-- if not, then registers a scheduler for the same
local do_schedule_bg = function(bg)
  if require(self).sched == bg
    then return  -- already scheduled
  end
  require(self).sched = bg
  vim.schedule(function()
    vim.o.background = bg
    require(self).sched = nil
  end)
end


local opts = { text = false }
function opts.stdout (err, data)
  assert(not err, err)
  local sig = "\x01u\x00"
  local idx = data:reverse()
                  :find(sig:reverse())

  if idx == nil then
    -- Wrong message.
    return
  end

  local data = data:sub(-idx)
  if data:match("\x01") == nil  -- ie. color-scheme != 1
    then do_schedule_bg("light")
    else do_schedule_bg("dark")
  end
end
function opts.stderr (err, data)
  assert(not err, err)
  local str = "[STDERR] dbus-monitor: %s"
  vim.notify(str:format(data), vim.log.levels.INFO)
end


vim.system(cmd, opts,
  function(obj)
    local str = "[EXIT] dbus-monitor exited (exit code: %d)"
    vim.notify(str:format(obj.code), vim.log.levels.INFO)
  end)

return M
