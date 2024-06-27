local T = {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  keys = { insert = table.insert },
}

T.opts = {
  WindowLayout = 2,
}

T.keys:insert({
  "<leader>u", "<cmd>UndotreeToggle<CR>",
  desc = "Toggle UndoTree"
})

T.config = function(_, opts)
  for k, v in pairs(opts) do
    vim.g["undotree_"..k] = v
  end
end

return T
