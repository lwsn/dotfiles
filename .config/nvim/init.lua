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
local packer_bootstrap

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
         'machakann/vim-highlightedyank',
         config = function()
            -- built in yank highlight crashes when deleting more than 430 lines when LSP is enabled?????
            vim.g.highlightedyank_highlight_duration = 500
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
                  section_separators = { '', '' },
                  component_separators = { '', '' },
               },
               sections = {
                  lualine_a = {
                     {
                        'mode',
                        format = function(str)
                           return (
                                 ({
                                    ['V-BLOCK'] = 'B',
                                    ['V-LINE'] = 'L',
                                 })[str] or str:sub(0, 1)
                              )
                        end,
                     },
                  },
                  lualine_c = {
                     {
                        'filename',
                        path = 1,
                        format = function(str)
                           return str:gsub('/./', '/')
                        end,
                     },
                  },
               },
               inactive_sections = {
                  lualine_c = {
                     {
                        'filename',
                        path = 1,
                        format = function(str)
                           return str:gsub('/./', '/')
                        end,
                     },
                  },
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

      use {
         'mhartington/formatter.nvim',
         run = 'npm install -g @fsouza/prettierd',
         config = function()
            local prettierd = function()
               return {
                  exe = 'prettierd',
                  args = { vim.api.nvim_buf_get_name(0) },
                  stdin = true,
               }
            end

            require('formatter').setup {
               logging = true,
               filetype = {
                  javascript = { prettierd },
                  typescript = { prettierd },
                  typescriptreact = { prettierd },
                  json = { prettierd },
                  lua = {
                     function()
                        return {
                           exe = 'stylua',
                           args = {
                              '--config-path '
                                 .. os.getenv 'XDG_CONFIG_HOME'
                                 .. '/stylua/stylua.toml',
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
         run = function()
            local required_servers = {
               'pylsp',
               'pyright',
               'sumneko_lua',
               'tsserver',
               'yamlls',
               'html',
            }

            for _, server in pairs(required_servers) do
               require('nvim-lsp-installer').install(server)
            end
         end,
         config = function()
            local lsp_installer = require 'nvim-lsp-installer'
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'

            local has_words_before = function()
               local line, col = unpack(vim.api.nvim_win_get_cursor(0))
               return col ~= 0
                  and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
                        :sub(col, col)
                        :match '%s'
                     == nil
            end

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
                  ['<Tab>'] = cmp.mapping(function(fallback)
                     if cmp.visible() then
                        cmp.select_next_item()
                     elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                     elseif has_words_before() then
                        cmp.complete()
                     else
                        fallback()
                     end
                  end, {
                     'i',
                     's',
                  }),

                  ['<S-Tab>'] = cmp.mapping(function(fallback)
                     if cmp.visible() then
                        cmp.select_prev_item()
                     elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                     else
                        fallback()
                     end
                  end, {
                     'i',
                     's',
                  }),
               },
               sources = {
                  { name = 'nvim_lsp' },
                  { name = 'luasnip' },
               },
            }

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

            lsp_installer.on_server_ready(function(server)
               local on_attach = function(_, bufnr)
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
                  buf_set_keymap(
                     'n',
                     '<leader>D',
                     '<cmd>lua vim.lsp.buf.type_definition()<CR>',
                     opts
                  )
                  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                  buf_set_keymap('n', '<C-p>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
                  buf_set_keymap('n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
                  buf_set_keymap(
                     'n',
                     '<space>Wa',
                     '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
                     opts
                  )
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

               local opts = {
                  on_attach = on_attach,
                  capabilities = capabilities,
               }

               if server == 'eslint' then
                  opts.on_attach = function(client, bufnr)
                     -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
                     -- the resolved capabilities of the eslint server ourselves!
                     client.resolved_capabilities.document_formatting = true
                     on_attach(client, bufnr)
                  end
                  opts.settings = {
                     format = { enable = true }, -- this will enable formatting
                  }
               end

               server:setup(opts)

               vim.cmd [[ do User LspAttachBuffers ]]
            end)
         end,
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
