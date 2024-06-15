return {
  { "m4xshen/autoclose.nvim",
   event = "InsertEnter",
   config = true,
   disabled = true,
  },
  { "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6", --recommended as each new version will have breaking changes
  },
  { "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true,
  },
}
