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
                "typescript-language-server",
                "html-lsp",
                "yaml-language-server",
                "dockerfile-language-server",
                --formatters
                "ruff",
                "stylua",
                "prettier",
                "shfmt",
            },
        },
    },
}
