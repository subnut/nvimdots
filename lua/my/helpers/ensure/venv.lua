local venvdir = vim.fn.stdpath("data") .. "/venv"
if vim.loop.fs_stat(venvdir) then
  vim.g.python3_host_prog = venvdir .. "/bin/python3"
else
  vim.notify(
    "g:python_host_prog not set — " .. venvdir .. " not found",
    vim.log.levels.WARN)
end
