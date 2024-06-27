-- defaults
vim.o.cmdheight = 1

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.undofile = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local lcs = {}
lcs.nbsp = "+"  -- default
lcs.trail = "◆" -- important
lcs.lead = "∙"
lcs.tab = "→ "
-- lcs.tab = ">…"
lcs.extends = "»"
lcs.precedes = "«"
vim.opt.lcs = lcs
