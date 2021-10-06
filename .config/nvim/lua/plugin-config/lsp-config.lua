local config = function()
   local lsp_installer = require 'nvim-lsp-installer'
   local cmp = require 'cmp'
   local luasnip = require 'luasnip'

   cmp.setup {
      snippet = {
         expand = function(args)
            luasnip.lsp_expand(args.body)
         end,
      },
      mapping = {
         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
         ['<C-f>'] = cmp.mapping.scroll_docs(4),
         ['<C-e>'] = cmp.mapping.close(),
         ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
         },
         ['<Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
               vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
            elseif luasnip.expand_or_jumpable() then
               vim.fn.feedkeys(
                  vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true),
                  ''
               )
            else
               fallback()
            end
         end,
         ['<S-Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
               vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
            elseif luasnip.jumpable(-1) then
               vim.fn.feedkeys(
                  vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true),
                  ''
               )
            else
               fallback()
            end
         end,
      },
      sources = {
         { name = 'nvim_lsp' },
         { name = 'luasnip' },
      },
   }

   local capabilities = vim.lsp.protocol.make_client_capabilities()
   capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

   lsp_installer.on_server_ready(function(server)
      local on_attach = function(client, bufnr)
         local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
         end
         local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
         end

         --Enable completion triggered by <c-x><c-o>
         buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

         -- Mappings.
         local opts = { noremap = true, silent = true }

         -- See `:help vim.lsp.*` for documentation on any of the below functions
         buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
         buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
         buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
         buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
         buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
         buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
         buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
         buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
         buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
         buf_set_keymap('n', '<C-p>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
         buf_set_keymap('n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
         buf_set_keymap('n', '<space>Wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
         buf_set_keymap(
            'n',
            '<space>Wr',
            '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
            opts
         )
         buf_set_keymap(
            'n',
            '<space>Wl',
            '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
            opts
         )
      end

      server:setup {
         on_attach = on_attach,
         capabilities = capabilities,
      }

      vim.cmd [[ do User LspAttachBuffers ]]
   end)
end

local run = function()
   local required_servers = {
      'pylsp',
      'pyright',
      'sumneko_lua',
      'tsserver',
      'yamlls',
      'json',
      'html',
      'efm',
   }

   for _, server in pairs(required_servers) do
      require('nvim-lsp-installer').install(server)
   end
end

return {
   config = config,
   run = run,
}
