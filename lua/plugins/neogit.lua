return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",

    -- Diff integration (optional)
    -- TODO: Figure out what this does,
    --       and how it alters Neogit's behaviour
    --
    -- "sindrets/diffview.nvim",
  },
  cmd = "Neogit",
  config = true,
}
