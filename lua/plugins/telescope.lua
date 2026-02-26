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
        { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    lazy = false,
    config = function()
        require("telescope").setup({
            defaults = {
                ---@diagnostic disable-next-line: unused-local
                path_display = function(opts, path)
                    local tail = require("telescope.utils").path_tail(path)
                    path = string.format("%s  %s", tail, vim.fn.fnamemodify(path, ":."))

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
            pickers = {
                buffers = {
                    mappings = {
                        i = {
                            ["<C-r>"] = require("telescope.actions").delete_buffer,
                        },
                    },
                },
            },
        })

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")
        require("telescope").load_extension("live_grep_args")

        local b = require("telescope.builtin")
        local t = require("telescope.themes")

        vim.keymap.set("n", "<leader>sf", b.find_files, { desc = "search files" })
        vim.keymap.set("n", "<leader>sh", b.help_tags, { desc = "search help" })
        vim.keymap.set("n", "<leader>ss", b.builtin, { desc = "search telescope" })
        vim.keymap.set("n", "<leader>sw", b.grep_string, { desc = "search current word" })
        vim.keymap.set("n", "<leader>sr", b.resume, { desc = "last telescope picker" })
        vim.keymap.set("n", "<leader>sgs", b.git_status, { desc = "search git status" })
        vim.keymap.set("n", "<leader>sgb", b.git_branches, { desc = "search git branches" })
        vim.keymap.set("n", "<leader>sgl", b.git_bcommits, { desc = "search git log" })
        vim.keymap.set("n", "<leader><leader>", function()
            b.buffers(t.get_dropdown({ border = false, preview = false }))
        end, { desc = "active buffers" })

        vim.keymap.set("n", "gd", b.lsp_definitions, { desc = "go to definition" })
        vim.keymap.set("n", "grr", b.lsp_references, { desc = "search references" })
        vim.keymap.set("n", "gri", b.lsp_implementations, { desc = "search lsp_implementations" })
        vim.keymap.set("n", "<leader>D", b.lsp_type_definitions, { desc = "go to type definition" })

        vim.keymap.set("n", "<leader>s/", function()
            b.live_grep({
                grep_open_files = true,
                prompt_title = "grep open files",
            })
        end, { desc = "active buffers" })

        vim.keymap.set("n", "<leader>sg", function()
            require("telescope").extensions.live_grep_args.live_grep_args()
        end, { desc = "grep" })

        vim.keymap.set("n", "<leader>sp", function()
            b.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
        end, { desc = "search neovim plugins" })

        vim.keymap.set("n", "<leader>fs", function()
            b.spell_suggest(t.get_cursor({ border = false }))
        end, { desc = "fix spelling" })
    end,
}
