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
                path_display = { "truncate" },
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
    end,
    keys = {
        { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "search files" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "search help" },
        { "<leader>ss", "<cmd>Telescope<cr>", desc = "search telescope" },
        { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "search current word" },
        { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "grep" },
        { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "last telescope picker" },
        { "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "active buffers" },
        { "<leader>sgs", "<cmd>Telescope git_status<cr>", desc = "search git status" },
        { "<leader>sgb", "<cmd>Telescope git_branches<cr>", desc = "search git branches" },
        { "<leader>sgl", "<cmd>Telescope git_bcommits<cr>", desc = "search git log" },
        {
            "<leader>s/",
            function()
                require("telescope.builtin").live_grep({
                    grep_open_files = true,
                    prompt_title = "grep open files",
                })
            end,
            desc = "grep open files",
        },
    },
}
