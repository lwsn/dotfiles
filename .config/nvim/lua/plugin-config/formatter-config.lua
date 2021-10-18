return {
   config = function()
      local prettierd = function()
         return {
            exe = 'prettierd',
            args = { vim.api.nvim_buf_get_name(0) },
            stdin = true,
         }
      end

      local eslintd = function()
         return {
            exe = 'eslint_d',
            args = {
               '--fix-to-stdout',
               '--stdin',
               '--stdin-filename=' .. vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            },
            stdin = true,
         }
      end

      require('formatter').setup {
         logging = true,
         filetype = {
            javascript = { eslintd, prettierd },
            typescript = { eslintd, prettierd },
            typescriptreact = { eslintd, prettierd },
            json = { prettierd },
            lua = {
               function()
                  return {
                     exe = 'stylua',
                     args = {
                        '--config-path ' .. os.getenv 'XDG_CONFIG_HOME' .. '/stylua/stylua.toml',
                        '-',
                     },
                     stdin = true,
                  }
               end,
            },
         },
      }

      vim.api.nvim_exec(
         [[
            augroup FormatAutogroup
            autocmd!
            autocmd BufWritePost *.tsx,*.ts,*.js,*.jsx,*.json,*.lua FormatWrite
            augroup END
            ]],
         true
      )
   end,
}
