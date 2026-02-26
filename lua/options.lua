vim.wo.number = true
vim.wo.signcolumn = "yes"
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.wrap = false
vim.o.linebreak = true
vim.o.mouse = "a"
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.cursorline = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.hlsearch = true
vim.o.showmode = true
vim.o.termguicolors = true
vim.o.whichwrap = "bs<>[]hl"
vim.o.numberwidth = 2
vim.o.swapfile = false
vim.o.smartindent = true
vim.o.showtabline = 0
vim.o.backspace = "indent,eol,start"
vim.o.pumheight = 10
vim.o.conceallevel = 0
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 1
vim.o.breakindent = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.completeopt = "menuone,noselect"
vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-")
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")
vim.opt.fillchars = { diff = " " }
vim.o.laststatus = 3

vim.diagnostic.config({ virtual_text = true })
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or { { " ", "FloatBorder" } }
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
