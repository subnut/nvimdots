local idx = 1 --[[

  1. iceberg
  2. gruvbox.nvim
  3. gruvbox-material

]]

local tbl = {}
local arr = {}

function add(n)
  table.insert(arr, n)
  return function(x)
    table.insert(tbl, x)
  end
end


add'iceberg'{
  "cocopon/iceberg.vim",
}
add'gruvbox'{
  "ellisonleao/gruvbox.nvim",
  config = true,
}
add'gruvbox-material'{
  "sainnhe/gruvbox-material",
  opts = {
    enable_bold = true,
    enable_italic = true,
  },
  config = function(_, opts)
    for k, v in pairs(opts) do
      vim.g["gruvbox_material_"..k] = v
    end
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
