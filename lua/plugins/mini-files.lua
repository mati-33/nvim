return {
    "nvim-mini/mini.files",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    version = false,
    lazy = false,
    config = function()
        local mf = require("mini.files")
        mf.setup({
            options = {
                use_as_default_explorer = true,
            },
            mappings = {
                synchronize = "s",
            },
        })

        vim.keymap.set("n", "\\", function()
            if not mf.close() then
                mf.open()
            end
        end, { desc = "toggle mini files" })

        vim.keymap.set("n", "|", function()
            mf.open(vim.api.nvim_buf_get_name(0))
        end, { desc = "open mini files in current file directory" })
    end,
}
