local T = {}
if not mycfg.cmp then
  return T
end

T = {"hrsh7th/nvim-cmp"}
T.opts = {}

T.opts.snippet = {
  expand = function(args)
    vim.snippet.expand(args.body)
  end,
}

local sources = {
  buffer = "hrsh7th/cmp-buffer",
  nvim_lsp = "hrsh7th/cmp-nvim-lsp",
}

T.dependencies = {}
T.opts.sources = {}
for k,v in pairs(sources) do
  table.insert(T.opts.sources, { name = k })
  table.insert(T.dependencies, v)
end

local function getmap()
  local cmp = require'cmp'
  return cmp.mapping.preset.insert{
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<CR>'] = cmp.mapping.confirm{select=true},
    ['<C-Space>'] = cmp.mapping.complete(),
  }
end

T.config = function(_, opts)
  opts.mapping = getmap()
  require'cmp'.setup(opts)
end

return T
