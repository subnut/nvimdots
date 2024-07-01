local T = {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  branch = "v3.x",
  cmd = "Neotree",
}

T.keys = {
  ["insert"] = table.insert
}
T.keys:insert{
  "<leader>e",
  "<cmd>Neotree toggle<cr>",
  desc = "Toggle NeoTree",
}

local cfg = {}
T.config = true
T.opts = cfg

cfg.window = {
  mappings = {
    ["<Tab>"] = "toggle_node",
    ["<Space>"] = "noop", -- :h mapleader
  },
}
cfg.window.mappings.s = "open_split"
cfg.window.mappings.S = "open_vsplit"

cfg.filesystem = {
  cwd_target = {
    sidebar = "global",
    current = "tab",  -- Netrw style
  }
}

cfg.source_selector = {
  separator = "",
  statusline = true,
  content_layout = "center",
  highlight_tab = "TabLineFill",
  highlight_tab_active = "TabLine",
  highlight_background = "TabLineFill",
}

cfg.event_handlers = {
  ["insert"] = table.insert
}
cfg.event_handlers:insert{
  event = "file_open_requested",
  handler = function()
    require'neo-tree.command'.execute{
      action = "close"
    }
  end,
}

return T
