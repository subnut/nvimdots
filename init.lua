require'my.config'

require'my.helpers.ensure.venv'
require'my.helpers.ensure.lazy'

require'lazy'.setup {
  lockfile = vim.fn.stdpath("data") .. "/lazylock.json",
  install = { colorscheme = { "default" }},
  import = "plugins",
}
