local T = {}
for _,key in ipairs({
  "lsp",
  "treesitter",
  "italics",
}) do T[key] = false end

T.lsp = true
return T
