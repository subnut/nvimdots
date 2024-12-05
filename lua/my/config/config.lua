-- defaults
vim.o.cmdheight = 1

vim.o.title = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.undofile = true
vim.wo.wrap = false -- TODO: Set for new windows on WinNew autocmd

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
lcs.multispace = lcs.lead
vim.opt.lcs = lcs
