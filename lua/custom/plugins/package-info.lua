return {
  'vuki656/package-info.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  ft = 'json', -- Only load for JSON files
  config = function()
    require('package-info').setup {
      colors = {
        up_to_date = '#3C4048', -- Text color for up to date dependency virtual text
        outdated = '#d19a66', -- Text color for outdated dependency virtual text
      },
      icons = {
        enable = true, -- Whether to display icons
        style = {
          up_to_date = '  ', -- Icon for up to date dependencies
          outdated = '  ', -- Icon for outdated dependencies
        },
      },
      autostart = true, -- Whether to autostart when package.json is opened
      hide_up_to_date = false, -- Hide up to date versions
      hide_unstable_versions = false, -- Hide unstable versions from version list
    }

    -- Keymaps for package.json files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'json',
      callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        if bufname:match 'package%.json$' then
          vim.keymap.set('n', '<leader>ns', require('package-info').show, { desc = '[N]pm [S]how dependency versions', buffer = true })
          vim.keymap.set('n', '<leader>nc', require('package-info').hide, { desc = '[N]pm [C]lear/hide dependency versions', buffer = true })
          vim.keymap.set('n', '<leader>nt', require('package-info').toggle, { desc = '[N]pm [T]oggle dependency versions', buffer = true })
          vim.keymap.set('n', '<leader>nu', require('package-info').update, { desc = '[N]pm [U]pdate dependency', buffer = true })
          vim.keymap.set('n', '<leader>nd', require('package-info').delete, { desc = '[N]pm [D]elete dependency', buffer = true })
          vim.keymap.set('n', '<leader>ni', require('package-info').install, { desc = '[N]pm [I]nstall new dependency', buffer = true })
          vim.keymap.set('n', '<leader>np', require('package-info').change_version, { desc = '[N]pm Change/[P]in version', buffer = true })
        end
      end,
    })
  end,
}
