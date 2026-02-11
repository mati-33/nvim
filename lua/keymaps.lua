-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true, desc = "disable the spacebar key's default behavior in Normal and Visual modes" })

-- Clear highlights with <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "clear highlights with <Esc>" })

-- Save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", { desc = "save file without auto-formatting" })

-- Delete single character without copying into register
vim.keymap.set("n", "x", '"_x', { desc = "delete single character without copying into register" })

-- Scroll with smaller jumps
vim.keymap.set("n", "<C-d>", "10j", { desc = "scroll 10 lines down" })
vim.keymap.set("n", "<C-u>", "10k", { desc = "scoll 10 lines up" })

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", { desc = "resize up" })
vim.keymap.set("n", "<Down>", ":resize +2<CR>", { desc = "resize down" })
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", { desc = "resize left" })
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", { desc = "resize right" })

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "previous buffer" })
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", { desc = "close buffer" })
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", { desc = "new buffer" })

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "split window vertically" })
vim.keymap.set("n", "<leader>h", "<C-w>s", { desc = "split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "make split windows equal width & height" })
vim.keymap.set("n", "<leader>xs", ":close<CR>", { desc = "close current split window" })

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "go to split up" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "go to split down" })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "go to split left" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "go to split right" })

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "open new tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close current tab" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "go to next tab" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "go to previous tab" })

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "toggle line wrapping" })

-- Keep highlight when indenting
vim.keymap.set("v", "<", "<gv", { desc = "indent left and keep highlight" })
vim.keymap.set("v", ">", ">gv", { desc = "indent right and keep highlight" })

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', { desc = "keep last yanked when pasting" })

-- Diagnostic
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "open diagnostics list" })

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "exit terminal mode" })
