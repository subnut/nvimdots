local map = require'my.utils'.keymap

map.n(
  "<leader>l",
  function() vim.o.list = not vim.o.list end,
  { desc = "Toggle 'list' option" }
)
