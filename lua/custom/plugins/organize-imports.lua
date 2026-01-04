-- Auto-organize imports on save for TypeScript/JavaScript files
return {
  {
    'neovim/nvim-lspconfig',
    opts = function()
      -- Create autocommand to organize imports before save
      local organize_imports_group = vim.api.nvim_create_augroup('OrganizeImports', { clear = true })

      vim.api.nvim_create_autocmd('BufWritePre', {
        group = organize_imports_group,
        pattern = { '*.ts', '*.tsx', '*.js', '*.jsx' },
        callback = function(args)
          -- Get all clients attached to the buffer
          local clients = vim.lsp.get_clients { bufnr = args.buf }

          -- Find the TypeScript LSP client
          for _, client in ipairs(clients) do
            if client.name == 'ts_ls' or client.name == 'tsserver' then
              -- Request organize imports
              local params = {
                command = '_typescript.organizeImports',
                arguments = { vim.api.nvim_buf_get_name(args.buf) },
                title = 'Organize Imports',
              }

              -- Execute the command synchronously before save
              vim.lsp.buf.execute_command(params)

              -- Wait a bit for the command to complete
              vim.wait(100)
              break
            end
          end
        end,
      })
    end,
  },
}
