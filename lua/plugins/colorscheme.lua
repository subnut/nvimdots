local idx = 1 --[[

  1. edge
  2. melange
  3. iceberg
  4. gruvbox.nvim
  5. gruvbox-material

]]

local tbl = {}
local arr = {}

function add(n)
  table.insert(arr, n)
  return function(x)
    table.insert(tbl, x)
  end
end


add'edge'{
  "sainnhe/edge",
  opts = {
    style = "aura",
    enable_italic = true,
  },
  config = function(_, opts)
    for k, v in pairs(opts) do
      vim.g["edge_"..k] = v
    end
  end
}
add'melange'{
  "savq/melange-nvim",
}
add'iceberg'{
  "cocopon/iceberg.vim",
  config = function(_, opts)
    if not mycfg.italics then return end
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "iceberg",
      desc = "My customizations for the iceberg colorscheme",
      group = vim.api.nvim_create_augroup("mycolor_iceberg", {}),
      callback = function(_)
        vim.cmd.highlight("Comment gui=italic")
      end
    })
  end
}
add'gruvbox'{
  "ellisonleao/gruvbox.nvim",
  config = true,
}
add'gruvbox-material'{
  "sainnhe/gruvbox-material",
  opts = {
    enable_bold = true,
    enable_italic = mycfg.italics,
    background = vim.o.background == "dark"
                  and "hard" or "medium"
  },
  config = function(_, opts)
    for k, v in pairs(opts) do
      vim.g["gruvbox_material_"..k] = v
    end
    vim.api.nvim_create_autocmd("ColorSchemePre", {
      pattern = "gruvbox-material",
      desc = "My customizations for the gruvbox-material colorscheme",
      group = vim.api.nvim_create_augroup("mycolor_gruvbox_material", {}),
      callback = function()
        vim.g.gruvbox_material_background =
          vim.o.background == "dark" and "hard" or "medium"
      end
    })
  end,
}


local main = tbl[idx] -- The main (startup) colorscheme
main.priority = 1000
main.lazy = false

local init = main.init
main.init = main.init
  and function() init()
    vim.cmd.colorscheme(arr[idx])
  end
  or function()
    vim.cmd.colorscheme(arr[idx])
  end

return tbl
