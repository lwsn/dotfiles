return {
   config = function()
      require('fzf-lua').setup {
         winopts = {
            win_height = 0.7,
            win_width = 0.8,
            win_border = true,
         },
         fzf_opts = {
            ['--layout'] = false,
         },
         files = {
            cmd = "rg --files --hidden -g '!{.git,node_modules}/*'",
         },
      }

      require('fzf-lua').all_lines = function()
         require('fzf-lua').files {
            cmd = 'rg --hidden --line-number '
               .. '--no-heading --vimgrep '
               .. '--smart-case --trim '
               .. "-g '!{.git,node_modules}/*' '^.*[A-z]+.*'",
         }
      end

      vim.api.nvim_set_keymap(
         'n',
         '<LEADER><TAB>',
         "<cmd>lua require('fzf-lua').buffers()<CR>",
         { noremap = true }
      )
      vim.api.nvim_set_keymap(
         'n',
         '<LEADER><Space>',
         "<cmd>lua require('fzf-lua').files()<CR>",
         { noremap = true }
      )
      vim.api.nvim_set_keymap(
         'n',
         '<LEADER>r',
         "<cmd>lua require('fzf-lua').oldfiles()<CR>",
         { noremap = true }
      )
      vim.api.nvim_set_keymap(
         'n',
         '<LEADER>s',
         [[<cmd>lua require('fzf-lua').all_lines()<CR>]],
         { noremap = true }
      )
   end,
}
