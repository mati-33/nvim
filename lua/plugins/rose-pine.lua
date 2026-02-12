return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 9001,
    config = function()
        require("rose-pine").setup({
            styles = {
                transparency = true,
            },
        })
        vim.cmd("colorscheme rose-pine")
    end,
}
