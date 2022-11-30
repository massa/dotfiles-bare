-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

keymap("n", "<Leader><Up>", ":cp<CR>", opts)
keymap("n", "<Leader><Left>", ":cr<CR>", opts)
keymap("n", "<Leader><Down>", ":cn<CR>", opts)
keymap("n", "<Leader><Right>", ":cnf<CR>", opts)
keymap("n", "<Leader><Insert>", ":cw<CR>", opts)
keymap("n", "<Leader><Leader>", " w _", opts)
keymap("n", "<F2>", ":w<CR>", opts)
keymap("n", "<F3>", " n _", opts)
keymap("n", "<F4>", ":q<CR>", opts)
keymap("n", "<Leader><F4>", ":q!<CR>", opts)
keymap("n", "<S-F4>", ":qa!<CR>", opts)
keymap("n", "<F9>", "<Esc>:make<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>f", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Custom
keymap("n", "<leader>p", "<cmd> PasteImg <CR>", opts)
keymap("n", "<leader>e", "$", opts)
keymap("n", "S", "<cmd> %s//g", opts)
keymap("n", "<F5>", "<cmd> UndotreeToggle <CR> <cmd> UndotreeFocus <CR>", opts)
keymap("n", "<C-\\>", "<cmd> TZAtaraxis <CR>", opts)
keymap("n", "<Leader>1", "1gt<CR>", opts)
keymap("n", "<Leader>2", "2gt<CR>", opts)
keymap("n", "<Leader>3", "3gt<CR>", opts)
keymap("n", "<Leader>4", "4gt<CR>", opts)
keymap("n", "<Leader>5", "5gt<CR>", opts)
keymap("n", "<Leader>t", "<cmd> tabnew<CR>", opts)
keymap("n", "<Leader>c", "<cmd> tabclose<CR>", opts)

