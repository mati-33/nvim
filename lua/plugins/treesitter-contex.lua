return {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
        require("treesitter-context").setup({
            enable = true,
            multiwindow = false,
            max_lines = 3,
            min_window_height = 0,
            line_numbers = true,
            multiline_threshold = 2,
            trim_scope = "inner",
            mode = "cursor",
            zindex = 20,
        })
    end,
}
