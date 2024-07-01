if require'mycfg'.vim then
  return {}
end

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
    "neo-tree",
    "undotree",
    "query",  -- treesitter :InspectTree
  },
  ignore_focus = {
    "undotree",
    "neo-tree",
    "neo-tree-popup",
    "TelescopePrompt",
  }
}

cfg.sections = {}

cfg.sections.lualine_b = { "branch", "diff", "diagnostics" }
cfg.sections.lualine_b[2] = {
  "diff", source = function()
    return vim.b.gitsigns_status_dict
  end,
}
vim.api.nvim_create_autocmd("User", {
  pattern = 'GitSignsUpdate',
  callback = function()
    require'lualine'.refresh{
      scope = "window",
    }
  end,
})

cfg.sections.lualine_c = {
  { "filename", separator = "" },
  { "filename",
    path = 1,
    padding = 0,
    color = "StatusLineNC",
    file_status = false,
    cond = function()
      return vim.fn.expand("%:t")
          ~= vim.fn.expand("%")
    end,
    separator = {
      left = "|",
      right = "",
    },
  }
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
  { "filename",
    cond = function()
      return vim.fn.expand("%:t")
          ~= vim.fn.expand("%")
    end,
  },
  { "filename", path = 1,
    file_status = false, }
}
cfg.inactive_sections.lualine_z = {{ 'location', padding = 0 }}

return T
