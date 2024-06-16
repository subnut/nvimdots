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
  config = function(_, opts)
    if not mycfg.italics then return end
    vim.api.nvim_create_augroup("MyIcebergCustomizations", {})
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "iceberg",
      group = "MyIcebergCustomizations",
      desc = "My customizations for the iceberg colorscheme",
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
