-- Common NeoVim settings
--

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set fileformat=unix")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.background = "light"
vim.g.have_nerd_font = true
vim.g.loaded_perl_provider = false
vim g.loaded_ruby_provider = false

vim.opt.swapfile = false

vim.opt.number = true


-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

