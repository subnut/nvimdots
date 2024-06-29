local cfg = {}
local T = {
  "nvim-telescope/telescope.nvim",
  version = "*", opts = cfg,
}

cfg.defaults = {
  mappings = {
    n = { q = require'telescope.actions'.close, },
  },
}

T.cmd = "Telescope"
T.keys = {{
  "<leader>t",
  "<cmd>Telescope<CR>",
  { desc = "Open Telescope" },
}}
T.config = function(_, opts)
  require'telescope'.setup(opts)
  require'telescope'.load_extension'projects'
end
T.dependencies = {
  {"nvim-lua/plenary.nvim"},
  {"ahmedkhalf/project.nvim",
    opts = { manual_mode = true },
    main = "project_nvim",
    cmd = "ProjectRoot",
  },
}

return T
