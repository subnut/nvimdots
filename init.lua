vim.o.cmdheight = 1

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.undofile = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.env.TERM == "wezterm" then
  vim.o.termguicolors = true
end

if vim.loop.fs_stat(vim.fn.stdpath("data") .. "/.venv") then
  vim.g.python3_host_prog = vim.fn.stdpath("data") .. "/.venv/bin/python"
else
  vim.notify(
    "g:python_host_prog not set — "
      .. vim.fn.stdpath("data")
      .. "/.venv not found",
    vim.log.levels.WARN)
end
