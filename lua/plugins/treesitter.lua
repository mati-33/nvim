return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    branch = "main",
    -- borrowed from kickstart.nvim
    config = function()
        ---@param buf integer
        ---@param language string
        local function try_attach(buf, language)
            if not vim.treesitter.language.add(language) then
                return
            end

            vim.treesitter.start(buf, language)

            local has_indent_query = vim.treesitter.query.get(language, "indents") ~= nil
            if has_indent_query then
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
        end

        local available_parsers = require("nvim-treesitter").get_available()
        local installed_parsers = require("nvim-treesitter").get_installed("parsers")

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local buf, filetype = args.buf, args.match
                local language = vim.treesitter.language.get_lang(filetype)

                if not language then
                    return
                end

                if vim.tbl_contains(installed_parsers, language) then
                    try_attach(buf, language)
                elseif vim.tbl_contains(available_parsers, language) then
                    require("nvim-treesitter").install(language):await(function()
                        try_attach(buf, language)
                    end)
                else
                    try_attach(buf, language)
                end

                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
