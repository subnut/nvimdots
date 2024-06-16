local T = {}
function add(spec)
  table.insert(T, spec)
end

add{
  "altermo/ultimate-autopair.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
  config = true,
}
add{
  "kylechui/nvim-surround",
  event = "VeryLazy",
  config = true,
  version = "*",  -- Recommended
}

return T
