return {
  's1n7ax/nvim-window-picker',
  name = 'window-picker',
  event = 'VeryLazy',
  version = '2.*',
  config = function()
    require('window-picker').setup()

    vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = '[W]indow focus left' })
    vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = '[W]indow focus down' })
    vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = '[W]indow focus up' })
    vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = '[W]indow focus right' })
    vim.keymap.set('n', '<leader>wp', function()
      local win = require('window-picker').pick_window()
      if win then
        vim.api.nvim_set_current_win(win)
      end
    end, { desc = '[W]indow [P]ick' })
  end,
}
