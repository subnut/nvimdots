local cfg = {}
local T = {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true, opts = cfg,
}

cfg.options = {
  globalstatus = false,
  icons_enabled = false,
  section_separators = {},
  component_separators = {
    left = "|", right = "|"
  },
  disabled_filetypes = {
    'neo-tree',
  },
  ignore_focus = {
    'neo-tree'
  }
}

return T
