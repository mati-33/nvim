return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    branch = "master",
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            highlight = {
                enable = true,
                disable = { "python" },
            },
            indent = {
                enable = true,
            },
        })
    end,
}
