local do_warn = false

local ok, err = pcall(require, ... .. '.' .. vim.env.TERM)
if not ok and do_warn then vim.notify(...
    .. [[: no configuration found for $TERM = "]]
    .. vim.env.TERM .. '"', vim.log.levels.WARN)
end
