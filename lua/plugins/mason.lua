return {
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    --lsp
                    "lua-language-server",
                    "ty",
                    "gopls",
                    --formatters
                    "ruff",
                    "stylua",
                    --linters
                },
            })
        end,
    },
}
