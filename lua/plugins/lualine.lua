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
    'undotree',
  },
  ignore_focus = {
    'undotree',
    'neo-tree',
    'neo-tree-popup',
    'TelescopePrompt',
  }
}

cfg.sections = {}

cfg.sections.lualine_b = { "branch", "diff", "diagnostics" }
cfg.sections.lualine_b[2] = {
  "diff", source = function()
    return vim.b.gitsigns_status_dict
  end,
}

cfg.sections.lualine_x = {
  { "encoding", cond = function()
      return vim.bo.fileencoding ~= "utf-8"
    end
  },
  { "fileformat", cond = function()
      return vim.bo.fileformat ~= "unix"
    end
  },
  { "filetype",
    colored = false,
    icons_enabled = true,
    icon = { align = "right", }
  },
}

-- inactive sections
cfg.inactive_sections = {}
for _,x in ipairs{"a", "b", "c", "x", "y", "x"} do
  cfg.inactive_sections["lualine_" .. x] = {}
end

cfg.inactive_sections.lualine_a = {
  { "filetype",
    colored = false,
    icon_only = true,
    icons_enabled = true,
    separator = "",
    padding = 0,
  },
  { "filename", padding = 0 }
}
cfg.inactive_sections.lualine_z = {{ 'location', padding = 0 }}

return T
