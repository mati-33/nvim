return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
    },
    lazy = false,
    config = function()
        require("telescope").setup({
            defaults = {
                ---@diagnostic disable-next-line: unused-local
                path_display = function(opts, path)
                    local tail = require("telescope.utils").path_tail(path)
                    path = string.format("%s  %s", tail, path)

                    local highlights = {
                        { { #tail, #path }, "Comment" },
                    }

                    return path, highlights
                end,
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                borderchars = { "", "", "", "", "", "", "", "" },
                mappings = {
                    i = {
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-l>"] = require("telescope.actions").select_default,
                        ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
                    },
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_cursor({ border = false }),
                },
            },
        })
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")

        local b = require("telescope.builtin")

        vim.keymap.set("n", "<leader>sf", b.find_files, { desc = "search files" })
        vim.keymap.set("n", "<leader>sh", b.help_tags, { desc = "search help" })
        vim.keymap.set("n", "<leader>ss", b.builtin, { desc = "search telescope" })
        vim.keymap.set("n", "<leader>sw", b.grep_string, { desc = "search current word" })
        vim.keymap.set("n", "<leader>sg", b.live_grep, { desc = "grep" })
        vim.keymap.set("n", "<leader>sr", b.resume, { desc = "last telescope picker" })
        vim.keymap.set("n", "<leader>sgs", b.git_status, { desc = "search git status" })
        vim.keymap.set("n", "<leader>sgb", b.git_branches, { desc = "search git branches" })
        vim.keymap.set("n", "<leader>sgl", b.git_bcommits, { desc = "search git log" })
        vim.keymap.set("n", "<leader><leader>", b.buffers, { desc = "active buffers" })
        vim.keymap.set("n", "<leader>s/", function()
            b.live_grep({
                grep_open_files = true,
                prompt_title = "grep open files",
            })
        end, { desc = "active buffers" })
    end,
}
