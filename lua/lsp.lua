vim.lsp.enable({
    "lua_ls",
    "ty",
    "gopls",
    "ts_ls",
    "html",
    "dockerls",
    "yamlls",
})

vim.diagnostic.config({ virtual_text = true })

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or { { " ", "FloatBorder" } }
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
