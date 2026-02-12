return {
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                --lsp
                "lua-language-server",
                "ty",
                "gopls",
                --formatters
                "ruff",
                "stylua",
            },
        },
    },
}
