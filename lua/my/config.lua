-- defaults
vim.o.cmdheight = 1

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.undofile = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- others
vim.cmd.runtime {
  "lua/my/configs/*.lua",
  bang = true
}
