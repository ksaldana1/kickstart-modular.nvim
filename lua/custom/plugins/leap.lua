return {
  'ggandor/leap.nvim',
  lazy = false,
  config = function()
    -- Sneak-style mappings (replaces deprecated create_default_mappings)
    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')
  end,
  opts = {},
}
