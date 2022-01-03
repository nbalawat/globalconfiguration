local nmap = U.keymap.nmap
local imap = U.keymap.imap
local vmap = U.keymap.vmap
local xmap = U.keymap.xmap
local omap = U.keymap.omap
local tmap = U.keymap.tmap

local keymap = vim.api.nvim_set_keymap
-- Remap space as leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true} )

vim.g.mapleader = ' ' 
print ("leader mapping is done")
vim.g.maplocalleader = ' ' 

-- Go to global mark J
nmap('<leader>k', '`J')

-- Close and update buffer
nmap('<leader>q', 'ZZ<C-w><C-p>')

-- Toggle QuickFixList

-- Write buffer and close window
nmap('<leader>w', ':update<CR>')

-- Refresh buffer
nmap('<leader>er', ':e<CR>')

-- Execute current file in bash
nmap('<leader>ee', ':Exec<CR>')

-- Close all other wndows
nmap('<leader>co', ':only<CR>')

-- New tab
nmap('<leader>tn', ':tabnew<CR>')

-- Previous tab (override unimpaired jump to next tag)
nmap('[t', ':tabp<CR>')

-- Next tab (override unimpaired jump to previous tag)
nmap(']t', ':tabn<CR>')

nmap( "<C-h>", "<C-w>h")
nmap( "<C-j>", "<C-w>j")
nmap( "<C-k>", "<C-w>k")
nmap( "<C-l>", "<C-w>l")


-- Resize with arrows
nmap( "<C-Up>", ":resize -2<CR>")
nmap( "<C-Down>", ":resize +2<CR>")
nmap( "<C-Left>", ":vertical resize -2<CR>")
nmap( "<C-Right>", ":vertical resize +2<CR>")

-- Better navigation and cut and paste functionality
nmap( "<leader><CR>", ":edit ~/.config/nvim/init.init<CR>")
nmap( "<leader>y", '"+y')
nmap( "<leader>Y", 'gg"+yG')
nmap( "Y", "yg$")
nmap( "n", "nzz")
nmap( "N", "Nzz")
nmap( "J", "mzJ`z")
nmap( "<leader>e", ":Explore 15<CR>")

-- Navigate buffers
nmap( "<leader><S-l>", ":bnext<CR>")
nmap( "<leader><S-h>", ":bprevious<CR>")

-- Move text up and down
nmap( "<A-j>", "<Esc>:m .+1<CR>==gi")
nmap( "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Visual --
-- Stay in indent mode
vmap( "<", "<gv")
vmap( ">", ">gv")

-- Move text up and down
vmap("<A-j>", ":m .+1<CR>==")
vmap("<A-k>", ":m .-2<CR>==")
vmap("p", '"_dP')
vmap("<leader>y", '"+y')

-- Visual Block --
-- Move text up and down
xmap( "J", ":move '>+1<CR>gv-gv")
xmap( "K", ":move '<-2<CR>gv-gv")
xmap( "<A-j>", ":move '>+1<CR>gv-gv")
xmap( "<A-k>", ":move '<-2<CR>gv-gv")

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
print ("telescope functions is done")

nmap( '<leader>saf',  ':lua telescope_files_or_git_files()<CR>' )
-- open files
nmap( '<leader>sof', ':Telescope buffers<CR>')
-- search for all the commits
nmap( '<leader>scf', ':Telescope git_commits<CR>')
-- grep string in all files
nmap( '<leader>swf', ':Telescope live_grep<CR>')
-- grep under the cursor in all files
nmap( '<leader>sw', ':Telescope grep_string<CR>')

-- quick fix lists
nmap( '<leader>sq', ':Telescope quickfix<CR>')
-- location lists 
nmap( '<leader>sl', ':Telescope loclist<CR>')