require('user.settings')
require('user.keybindings')
require('user.plugins')
require('user.language-server')
require('user.snippets')

vim.cmd('source' .. vim.fn.stdpath('config') .. '/vim/neovide.vim')
