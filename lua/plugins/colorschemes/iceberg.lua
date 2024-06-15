return {
  "cocopon/iceberg.vim",
  event = "UIEnter",
  init = function()
    vim.cmd("colorscheme iceberg | hi Comment gui=italic")
  end
}
