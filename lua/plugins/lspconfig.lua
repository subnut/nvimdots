local T = {}
if not mycfg.lsp then
  return T
end

local servers = {
  --[[ C ]]      "clangd",
  --[[ Zig ]]    "zls",
  --[[ LaTeX ]]  "texlab",
  --[[ Python ]] "pylsp",

  --[[ D ]]     {"serve-d", "serve_d"},
  --[[ Lua ]]   {"lua-language-server", "lua_ls"},
  --[[ Rust ]]  {"rust-analyzer", "rust_analyzer"},
  --[[ Typst ]] {"typst-lsp", "typst_lsp"},

}

local serverconf = {}
local globalconf = {}

local function getconf(lsp) local cfg = {}
  for k,v in pairs(globalconf) do cfg[k] = v end
  for k,v in pairs(serverconf[lsp] or {}) do cfg[k] = v end
  return cfg
end

T = {"neovim/nvim-lspconfig"}
T.config = function(_, __)
  for _,server in ipairs(servers) do
    local exe = type(server) == "string" and server or server[1]
    local lsp = type(server) == "string" and server or server[2]
    if vim.fn.executable(exe) > 0 then
      require'lspconfig'[lsp].setup(getconf(lsp))
    end
  end
end

if mycfg.cmp then
  T.dependencies = { "nvim-cmp", "cmp-nvim-lsp" }
  globalconf.capabilities = require'cmp_nvim_lsp'.default_capabilities()
end

return T
