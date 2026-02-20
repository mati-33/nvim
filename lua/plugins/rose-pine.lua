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
            styles = {
                italic = false,
            },
            highlight_groups = {
                WinSeparator = { fg = "#303234" },
                TreesitterContext = { fg = "#ffffff", bg = "NONE" },
                TreesitterContextBottom = { underline = true, sp = "#303234" },
                MiniFilesBorder = { fg = "#1c1c1c" },
                MiniFilesBorderModified = { fg = "foam" },
                BlinkCmpDoc = { bg = "#1c1c1c" },
                BlinkCmpDocSeparator = { bg = "#1c1c1c" },
                ["@keyword.operator"] = { fg = "pine" },
                ["@constant.builtin.python"] = { fg = "foam", bold = true },
                ["@lsp.type.parameter.python"] = { fg = "text" },
                ["@lsp.type.property.python"] = { fg = "text" },
            },
        })
        vim.cmd("colorscheme rose-pine")
    end,
}
