vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    pattern = "*",
    desc = "highlight selection on yank",
    callback = function()
        vim.highlight.on_yank({ timeout = 200, visual = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    command = "wincmd L",
    desc = "open help in vertical split",
})

vim.api.nvim_create_autocmd("VimResized", {
    command = "wincmd =",
    desc = "auto resize splits when the terminal's window is resized",
})

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("no_auto_comment", {}),
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
    desc = "no auto continue comments on new line",
})
