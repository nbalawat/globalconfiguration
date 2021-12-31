local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Better navigation and cut and paste functionality
keymap("n", "<leader><CR>", ":so ~/.config/nvim/init.vim<CR>", opts)
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", 'gg"+yG', opts)
keymap("n", "Y", "yg$", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "J", "mzj`z", opts)
keymap("n", "<leader>e", ":Explore 15<CR>", opts)

-- Navigate buffers
keymap("n", "<leader><S-l>", ":bnext<CR>", opts)
keymap("n", "<leader><S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
keymap("v", "<leader>y", '"+y', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope related key remaps

_G.telescope_find_files_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").find_files({search_dirs = {_path}})
end
_G.telescope_live_grep_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").live_grep({search_dirs = {_path}})
end
_G.telescope_files_or_git_files = function()
 local utils = require('telescope.utils')
 local builtin = require('telescope.builtin')
 local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
 if ret == 0 then
   builtin.git_files()
 else
   builtin.find_files()
 end
end

keymap('n', '<leader><space>', ':lua telescope_files_or_git_files()<CR>')
keymap('n', '<leader>fp', ':lua telescope_find_files_in_path()<CR>')
keymap('n', '<leader>ft', ':lua telescope_find_files_in_path("./tests")<CR>')
keymap('n', '<leader>fgp', ':lua telescope_live_grep_in_path()<CR>')
keymap('n', '<leader>fT', ':lua telescope_live_grep_in_path("./tests")<CR>')
keymap('n', '<leader>fg', ':Telescope live_grep<CR>')
keymap('n', '<leader>fo', ':Telescope file_browser<CR>')
keymap('n', '<leader>fn', ':Telescope find_files<CR>')
keymap('n', '<leader>fgb', ':Telescope git_branches<CR>')
keymap('n', '<leader>fbf', ':Telescope buffers<CR>')
keymap('n', '<leader>fl', ':Telescope lsp_document_symbols<CR>')
keymap('n', '<leader>ff', ':Telescope live_grep<CR>')
keymap('n', '<leader>FF', ':Telescope grep_string<CR>')