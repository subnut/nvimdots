local T = {}
if not mycfg.lsp then
  return T
end

local servers = {
  --[[ C ]]      "clangd",
  --[[ Zig ]]    "zls",
  --[[ Python ]] "pylsp",

  --[[ D ]]     {"serve-d", "serve_d"},
  --[[ Lua ]]   {"lua-language-server", "lua_ls"},
  --[[ Rust ]]  {"rust-analyzer", "rust_analyzer"},
  --[[ Typst ]] {"typst-lsp", "typst_lsp"},

}

local config = {}

T = {"neovim/nvim-lspconfig"}
T.config = function(_, __)
  for _,server in ipairs(servers) do
    local exe = type(server) == "string" and server or server[1]
    local lsp = type(server) == "string" and server or server[2]
    local cfg = config[lsp] or {}
    if vim.fn.executable(exe) > 0 then
      require'lspconfig'[lsp].setup(cfg)
    end
  end
end

return T
