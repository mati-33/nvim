return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        vim.lsp.enable({
            "lua_ls",
            "ty",
            "gopls",
            "ts_ls",
            "html",
            "dockerls",
            "yamlls",
        })
    end,
}
