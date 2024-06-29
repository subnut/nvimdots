local mapcreate = function()
  local map = require'my.utils'.keymap
  map.nxo["<leader>s"] = "<Plug>(leap-forward)"
  map.nxo["<leader>S"] = "<Plug>(leap-backward)"
end

return {
  "ggandor/leap.nvim",
  lazy = true,
  config = function(_, opts)
    for k,v in pairs(opts) do
      require'leap'.opts[k] = v
    end
  end,
  opts = {
    safe_labels = "", -- no autojump
    labels = "asdfghjkl;qwertyuiopvmn",
    special_keys = {
      next_target = '<enter>',
      prev_target = '<BS>',
      next_group = '<space>',
      prev_group = '<tab>',
    },
  },
  keys = {
    "<Plug>(leap)",
    "<Plug>(leap-forward)",
    "<Plug>(leap-backward)",
    "<Plug>(leap-forward-to)",
    "<Plug>(leap-backward-to)",
    "<Plug>(leap-forward-till)",
    "<Plug>(leap-backward-till)",
    "<Plug>(leap-from-window)",
  },
  init = mapcreate,
}
