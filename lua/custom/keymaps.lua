vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>')
vim.keymap.set('n', '<leader>x', ':.lua<CR>')
vim.keymap.set('v', '<leader>x', ':lua<CR>')

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down half screen' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up half screen' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set({ 'n', 'x' }, '<Space>', ':', { desc = 'Enter command mode' })
vim.keymap.set({ 'n', 'x' }, '<M-s>', ':w<CR>', { desc = 'save file' })

vim.keymap.set('n', 'Q', '@q', { desc = 'Replay macro q' })
vim.keymap.set('v', 'Q', ':norm @q<cr>', { desc = 'Replay macro q' })

vim.keymap.set('n', '}', ':<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>', { desc = 'Move to next paragraph', silent = true })
vim.keymap.set('n', '{', ':<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>', { desc = 'Move to previous paragraph', silent = true })

vim.keymap.set('n', '∆', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', 'Ż', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '∆', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'Ż', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

vim.keymap.set('v', '<', '<gv', { desc = 'Indent selection left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent selection right' })

vim.keymap.set('n', '<C-w>"', ':wincmd v<CR>', { desc = 'Split window vertically' })
vim.keymap.set('n', '<C-w>%', ':wincmd s<CR>', { desc = 'Split window horizontally' })

vim.keymap.set('v', '.', ':norm.<CR>', { desc = 'Repeat last command for every selected line' })

--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
