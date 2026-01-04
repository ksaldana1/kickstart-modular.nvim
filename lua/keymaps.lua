-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Generic movement helpers
vim.keymap.set({ 'n', 'v' }, '<S-j>', '5j', { desc = 'Move 5 lines down shortcut' })
vim.keymap.set({ 'n', 'v' }, '<S-k>', '5k', { desc = 'Move 5 lines up shortcut' })

vim.keymap.set('i', '<C-f>', '<right>', { desc = 'Move cursor forward in insert' })
vim.keymap.set('i', '<C-b>', '<left>', { desc = 'Move cursor forward in insert' })

-- vim: ts=2 sts=2 sw=2 et
--
-- Go-to preview
vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})

-- Clipboard operations (system clipboard)
vim.keymap.set('v', '<Leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('v', '<Leader>d', '"+d', { desc = 'Delete to system clipboard' })
vim.keymap.set('n', '<Leader>p', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set('n', '<Leader>P', '"+P', { desc = 'Paste before from system clipboard' })
vim.keymap.set('v', '<Leader>p', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set('v', '<Leader>P', '"+P', { desc = 'Paste before from system clipboard' })

-- Window navigation prefix
vim.keymap.set('n', '<leader>w', '<C-w>', { desc = 'Window commands' })

-- Diagnostic navigation
vim.keymap.set('n', '[c', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']c', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })

-- Additional Telescope shortcuts for FZF muscle memory
local telescope_available, builtin = pcall(require, 'telescope.builtin')
if telescope_available then
  vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Find files' })
  vim.keymap.set('n', '<leader>;', builtin.find_files, { desc = 'Find files' })
  vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Find buffers' })
  vim.keymap.set('n', '<leader>l', builtin.current_buffer_fuzzy_find, { desc = 'Find in current buffer' })
  vim.keymap.set('n', '<leader>L', builtin.live_grep, { desc = 'Live grep all files' })
  vim.keymap.set('n', 'rg', builtin.grep_string, { desc = 'Search word under cursor' })
end

-- Format with gf
vim.keymap.set('n', 'gf', function()
  vim.lsp.buf.format({ async = true })
end, { desc = 'Format buffer' })
