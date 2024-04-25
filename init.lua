require'my.config'

if vim.loop.fs_stat(vim.fn.stdpath("data") .. "/venv") then
  vim.g.python3_host_prog = vim.fn.stdpath("data") .. "/venv/bin/python3"
else
  vim.notify(
    "g:python_host_prog not set — "
      .. vim.fn.stdpath("data")
      .. "/venv not found",
    vim.log.levels.WARN)
end
