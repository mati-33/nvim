return {
    { "tpope/vim-fugitive" },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("neogit").setup({
                graph_style = "unicode",
                disable_context_highlighting = true,
            })

            vim.keymap.set("n", "<leader>ng", "<cmd>Neogit<cr>", { desc = "open neogit" })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol",
                    delay = 10,
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                    use_focus = true,
                },
            })

            local gs = require("gitsigns")

            vim.keymap.set("n", "<leader>gp", gs.preview_hunk_inline, { desc = "show inline diff" })
            vim.keymap.set("n", "<leader>bl", gs.toggle_current_line_blame, { desc = "toggle git blame virtual text" })
            vim.keymap.set("n", "<leader>gb", gs.blame, { desc = "show git blame" })
            vim.keymap.set("n", "<leader>bp", gs.blame_line, { desc = "show git blame under cursor" })
            vim.keymap.set({ "n", "v" }, "<leader>gr", gs.reset_hunk, { desc = "reset changes under cursor" })
            vim.keymap.set("n", "[h", function()
                gs.nav_hunk("next")
            end, { desc = "go to next changes" })
            vim.keymap.set("n", "]h", function()
                gs.nav_hunk("prev")
            end, { desc = "go to previous changes" })
        end,
    },
}
