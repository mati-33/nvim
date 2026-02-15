return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 9001,
    config = function()
        require("rose-pine").setup({
            variant = "dawn",
            palette = {
                dawn = {
                    _nc = "#16141f",
                    base = "#141618",
                    surface = "#1c1c1c",
                    overlay = "#303234",
                    text = "#ffffff",
                    gold = "#f6c177",
                    muted = "#cecacd",
                    subtle = "#908caa",
                    highlight_low = "#21202e",
                    highlight_med = "#403d52",
                    highlight_high = "#524f67",
                },
            },
            highlight_groups = {
                WinSeparator = { fg = "#303234" },
            },
        })
        vim.cmd("colorscheme rose-pine")
    end,
}
