-------------
-- Options --
-------------

vim.opt.breakindent = true
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.inccommand = 'nosplit'
vim.opt.mouse = ''
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.scrolloff = 1
vim.opt.shiftwidth = 4
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight on yank
vim.api.nvim_exec(
   'augroup YankHighlight\n'
      .. 'autocmd!\n'
      .. 'autocmd TextYankPost * silent! lua vim.highlight.on_yank {timeout = 500}\n'
      .. 'augroup end',
   false
)

--------------
-- Mappings --
--------------

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap('', 'ö', '{', { noremap = true })
vim.api.nvim_set_keymap('', 'ä', '}', { noremap = true })
vim.api.nvim_set_keymap('', 'Ö', '{', { noremap = true })
vim.api.nvim_set_keymap('', 'Ä', '}', { noremap = true })

vim.api.nvim_set_keymap('', 'D', 'dd', { noremap = true })
vim.api.nvim_set_keymap('', 'Y', 'yy', { noremap = true })

vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-j>', ':m .+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', {
   noremap = true,
})
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-k>', ':m .-2<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', {
   noremap = true,
})

vim.api.nvim_set_keymap('', '<A-l>', ':bn<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-h>', ':bh<CR>', { noremap = true })

vim.api.nvim_set_keymap('', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-l>', '<C-w>l', { noremap = true })

vim.api.nvim_set_keymap('', '<LEADER>w', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<LEADER>q', ':q<CR>', { noremap = true })

-------------
-- Plugins --
-------------

-- Auto install plugin manager

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
   packer_bootstrap = vim.fn.system {
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path,
   }
end
-- Plugins configurations

return require('packer').startup {
   config = {
      auto_reload_compiled = false,
   },
   function(use)
      -- Let packer manage itself
      use {
         'wbthomason/packer.nvim',
         config = function()
            vim.cmd 'autocmd BufWritePost init.lua source <afile> | PackerCompile'
         end,
      }
      --
      -- Theme
      use {
         'navarasu/onedark.nvim',
         as = 'theme',
         config = function()
            vim.g.onedark_transparent_background = true
            require('onedark').setup()
            vim.cmd [[colorscheme onedark]]
         end,
      }

      use {
         'tpope/vim-fugitive',
         config = function()
            vim.api.nvim_set_keymap('n', '<LEADER>gg', ':Git<SPACE>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<LEADER>gs', ':Git<CR>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<LEADER>gb', ':Git blame<CR>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<LEADER>gc', ':Git commit<CR>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<LEADER>gd', ':Gvdiffsplit<CR>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<LEADER>gl', ':Gclog<CR>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<LEADER>gp', ':Git push<CR>', { noremap = true })
         end,
      }
      use 'tpope/vim-rhubarb'
      use 'tpope/vim-commentary'
      use 'tpope/vim-surround'

      -- Add git related info in the signs columns and popups
      use {
         'lewis6991/gitsigns.nvim',
         requires = {
            'nvim-lua/plenary.nvim',
         },
         config = function()
            require('gitsigns').setup {}
         end,
      }

      -- Highlight, edit, and navigate code using a fast incremental parsing library
      -- Additional textobjects for treesitter
      use {
         'nvim-treesitter/nvim-treesitter-textobjects',
         requires = { 'nvim-treesitter/nvim-treesitter' },
         config = function()
            require('nvim-treesitter.configs').setup {
               ensure_installed = 'maintained',
               highlight = {
                  enable = true, -- false will disable the whole extension
               },
               incremental_selection = {
                  enable = true,
                  keymaps = {
                     init_selection = 'gnn',
                     node_incremental = 'grn',
                     scope_incremental = 'grc',
                     node_decremental = 'grm',
                  },
               },
               indent = {
                  enable = true,
               },
               textobjects = {
                  select = {
                     enable = true,
                     lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                     keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                     },
                  },
                  move = {
                     enable = true,
                     set_jumps = true, -- whether to set jumps in the jumplist
                     goto_next_start = {
                        [']m'] = '@function.outer',
                        [']]'] = '@class.outer',
                     },
                     goto_next_end = {
                        [']M'] = '@function.outer',
                        [']['] = '@class.outer',
                     },
                     goto_previous_start = {
                        ['[m'] = '@function.outer',
                        ['[['] = '@class.outer',
                     },
                     goto_previous_end = {
                        ['[M'] = '@function.outer',
                        ['[]'] = '@class.outer',
                     },
                  },
               },
            }
         end,
      }

      use {
         'APZelos/blamer.nvim',
         config = function()
            vim.g.blamer_delay = 500
            vim.g.blamer_show_in_insert_modes = 0
            vim.api.nvim_set_keymap('', '<LEADER>b', ':BlamerToggle<CR>', { noremap = true })
         end,
      }

      use {
         'hoob3rt/lualine.nvim',
         config = function()
            require('lualine').setup {
               options = {
                  theme = 'onedark',
               },
            }
         end,
      }

      use 'romainl/vim-cool'

      use 'jiangmiao/auto-pairs'

      -- Fuzzy search
      use {
         'ibhagwan/fzf-lua',
         requires = {
            'vijaymarupudi/nvim-fzf',
            'kyazdani42/nvim-web-devicons',
         },
         config = require('plugin-config.fzf-config').config,
      }

      use {
         'mhartington/formatter.nvim',
         run = 'npm install -g @fsouza/prettierd',
         config = require('plugin-config.formatter-config').config,
      }

      -- LSP
      use {
         'hrsh7th/nvim-cmp',
         requires = {
            'hrsh7th/cmp-nvim-lsp',
            'williamboman/nvim-lsp-installer',
            'neovim/nvim-lspconfig',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
         },
         run = require('plugin-config.lsp-config').run,
         config = require('plugin-config.lsp-config').config,
      }

      use {
         'kevinhwang91/rnvimr',
         config = function()
            vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>RnvimrToggle<CR>', { noremap = true })
         end,
      }

      if packer_bootstrap then
         require('packer').sync()
      end
   end,
}
