vim.o.bg =
  vim.system({
    "gsettings", "get",
    "org.gnome.desktop.interface",
    "color-scheme"
  }):wait()
    .stdout
    :match("dark") == nil
      and "light"
      or "dark"
