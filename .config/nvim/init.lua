-------------
-- Options --
-------------

vim.opt.breakindent = true
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.cursorline = false
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.inccommand = 'nosplit'
vim.opt.mouse = ''
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.scrolloff = 1
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.wo.fillchars = 'eob: '
vim.opt.fillchars = {
   eob = ' ',
   horiz = '━',
   horizup = '┻',
   horizdown = '┳',
   vert = '│',
   vertleft = '┫',
   vertright = '┣',
   verthoriz = '╋',
}
-- vim.g.substrata_transparent = 1
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.opt.foldlevel = 1

vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=500})
augroup END
]]

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

vim.api.nvim_set_keymap('', '€', '$', { noremap = true })

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

vim.api.nvim_set_keymap('', '<C-E>', ':e %:p:h', { noremap = true })

vim.api.nvim_set_keymap('', '<Leader>w', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>q', ':q<CR>', { noremap = true })

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

      -- Theme
      -- use {
      --    'navarasu/onedark.nvim',
      --    as = 'theme',
      --    config = function()
      --       require('onedark').setup {
      --          style = 'dark',
      --          transparent = true,
      --       }
      --       require('onedark').load()
      --    end,
      -- }
      -- Theme
      use {
         'projekt0n/github-nvim-theme',
         as = 'theme',
         config = function()
            require('github-theme').setup {
               options = {
                  styles = {
                     functions = 'italic',
                  },
                  transparent = true,
               },
               groups = {
                  all = {
                     VertSplit = { bg = 'NONE', fg = 'bg1' },
                     StatusLine = { bg = 'NONE', fg = 'bg1' },
                     StatusLineNC = { bg = 'NONE', fg = 'bg0' },
                  },
               },
               -- theme_style = 'dark',
               -- overrides = function(c)
               --    return {
               --    }
               -- end,
            }
            vim.cmd 'colorscheme github_dark'
         end,
      }

      use {
         'tpope/vim-fugitive',
         config = function()
            vim.api.nvim_set_keymap('n', '<Leader>gg', ':Git<SPACE>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<Leader>gs', ':Git<CR>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<Leader>gb', ':Git blame<CR>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<Leader>gc', ':Git commit<CR>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<Leader>gd', ':Gvdiffsplit<CR>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<Leader>gl', ':Gclog<CR>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<Leader>gp', ':Git push<CR>', { noremap = true })
         end,
      }
      use 'tpope/vim-rhubarb'
      use 'tpope/vim-commentary'
      use 'tpope/vim-surround'
      use 'tpope/vim-repeat'

      use 'tommcdo/vim-exchange'

      use 'ggandor/lightspeed.nvim'

      use {
         'DanilaMihailov/beacon.nvim',
         config = function()
            -- vim.g.beacon_fade = 0
            vim.g.beacon_shrink = 1
         end,
      }

      use 'vim-test/vim-test'

      use {
         'aserowy/tmux.nvim',
         config = function()
            require('tmux').setup {
               -- overwrite default configuration
               -- here, e.g. to enable default bindings
               copy_sync = {
                  -- enables copy sync and overwrites all register actions to
                  -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
                  enable = false,
               },
               navigation = {
                  -- enables default keybindings (C-hjkl) for normal mode
                  enable_default_keybindings = true,
               },
               resize = {
                  -- enables default keybindings (A-hjkl) for normal mode
                  enable_default_keybindings = true,
               },
            }
         end,
      }

      use {
         'folke/which-key.nvim',
         config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require('which-key').setup {
               -- your configuration comes here
               -- or leave it empty to use the default settings
               -- refer to the configuration section below
            }
         end,
      }

      use {
         'kdheepak/lazygit.nvim',
         -- optional for floating window border decoration
         requires = {
            'nvim-lua/plenary.nvim',
         },
         config = function()
            vim.api.nvim_set_keymap('', '<Leader>G', '<Cmd>LazyGit<CR>', { noremap = true })
         end,
      }

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
               -- ensure_installed = 'maintained',
               ensure_installed = { 'typescript', 'graphql', 'tsx', 'javascript' },
               highlight = {
                  enable = true, -- false will disable the whole extension
               },
               additional_vim_regex_highlighting = false,
               auto_install = true,
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
                        ['Ä'] = '@function.outer',
                     },
                     goto_previous_start = {
                        ['Ö'] = '@function.outer',
                     },
                  },
               },
            }
         end,
      }

      -- use {
      --    'machakann/vim-highlightedyank',
      --    config = function()
      --       -- built in yank highlight crashes when deleting more than 430 lines when LSP is enabled?????
      --       vim.g.highlightedyank_highlight_duration = 500
      --    end,
      -- }

      use {
         'APZelos/blamer.nvim',
         config = function()
            vim.g.blamer_delay = 500
            vim.g.blamer_show_in_insert_modes = 0
            vim.api.nvim_set_keymap('', '<Leader>b', ':BlamerToggle<CR>', { noremap = true })
         end,
      }

      use {
         'nvim-lualine/lualine.nvim',
         config = function()
            local colors = {
               vertsplit = 'none',
               special_grey = '#3B4048',
               menu_grey = '#3E4452',
               cursor_grey = '#2C323C',
               gutter_fg_grey = '#4B5263',
               blue = '#82b1ff',
               dark_red = '#BE5046',
               white = '#bfc7d5',
               green = '#C3E88D',
               purple = '#c792ea',
               yellow = '#ffcb6b',
               light_red = '#ff869a',
               red = '#ff5370',
               dark_yellow = '#F78C6C',
               cyan = '#89DDFF',
               comment_grey = '#697098',
               black = '#24292e',
            }

            local theme = {
               normal = {
                  a = { fg = colors.green, bg = 'none', gui = 'bold' },
                  b = { bg = 'none' },
                  c = { bg = 'none' },
               },
               insert = { a = { fg = colors.blue } },
               visual = { a = { fg = colors.purple } },
               replace = { a = { fg = colors.cyan } },
               inactive = { a = { fg = colors.menu_grey } },
            }

            require('lualine').setup {
               options = {
                  theme = theme,
                  section_separators = { '' },
                  component_separators = { '' },
                  ignore_focus = {},
                  -- globalstatus = true,
               },
               sections = {
                  lualine_a = {
                     {
                        'mode',
                        fmt = function(str)
                           return (
                              ({
                                 ['V-BLOCK'] = 'B',
                                 ['V-LINE'] = 'L',
                              })[str] or str:sub(0, 1)
                           )
                        end,
                     },
                  },
                  lualine_b = { 'diff' },
                  lualine_c = { 'filename' },
                  lualine_x = { 'filetype' },
                  lualine_y = { 'location' },
               },
               inactive_sections = {
                  lualine_c = { 'filename' },
                  lualine_x = { 'filetype' },
               },
               winbar = {},
               inactive_winbar = {},
               tabline = {},
            }
         end,
      }

      use 'romainl/vim-cool'

      use 'jiangmiao/auto-pairs'

      use { 'junegunn/fzf', run = './install --bin' }

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
                  preview = {
                     default = 'bat',
                  },
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
               '<Leader><TAB>',
               "<cmd>lua require('fzf-lua').buffers()<CR>",
               { noremap = true }
            )
            vim.api.nvim_set_keymap(
               'n',
               '<Leader><Space>',
               "<cmd>lua require('fzf-lua').files()<CR>",
               { noremap = true }
            )
            vim.api.nvim_set_keymap(
               'n',
               '<Leader>r',
               "<cmd>lua require('fzf-lua').oldfiles()<CR>",
               { noremap = true }
            )
            vim.api.nvim_set_keymap(
               'n',
               '<Leader>sa',
               [[<cmd>lua require('fzf-lua').all_lines()<CR>]],
               { noremap = true }
            )
            vim.api.nvim_set_keymap(
               'n',
               '<Leader>sg',
               [[<cmd>lua require('fzf-lua').grep()<CR>]],
               { noremap = true }
            )
         end,
      }

      use {
         'Wansmer/treesj',
         requires = { 'nvim-treesitter' },
         config = function()
            require('treesj').setup {
               use_default_keymaps = false,
            }

            vim.keymap.set('n', '-', require('treesj').toggle)
         end,
      }

      use {
         'neovim/nvim-lspconfig',
         requires = {
            'dmmulroy/ts-error-translator.nvim',
            'pmizio/typescript-tools.nvim',
            'williamboman/mason-lspconfig.nvim',
            'williamboman/mason.nvim',
            'hrsh7th/nvim-cmp',
            'github/copilot.vim',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
         },
         config = function()
            vim.g.copilot_no_tab_map = true
            vim.keymap.set(
               'i',
               '<Plug>(vimrc:copilot-dummy-map)',
               "copilot#Accept('')",
               { expr = true, silent = true }
            )

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            require('mason').setup()
            local mason_lspconfig = require 'mason-lspconfig'

            mason_lspconfig.setup {
               ensure_installed = {
                  'tsserver',
                  'tailwindcss',
               },
            }

            local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
            local lsp_format_on_save = function(bufnr)
               vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
               vim.api.nvim_create_autocmd('BufWritePost', {
                  group = augroup,
                  buffer = bufnr,
                  callback = function()
                     -- vim.cmd 'FormatWrite'
                     vim.lsp.buf.format()
                  end,
               })
            end

            local on_attach = function(_, bufnr)
               lsp_format_on_save(bufnr)

               local nmap = function(keys, func, desc)
                  if desc then
                     desc = 'LSP: ' .. desc
                  end

                  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
               end

               -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
               -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

               nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
               -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
               nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
               nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
               nmap(
                  '<leader>ds',
                  require('telescope.builtin').lsp_document_symbols,
                  '[D]ocument [S]ymbols'
               )
               nmap(
                  '<leader>Ws',
                  require('telescope.builtin').lsp_dynamic_workspace_symbols,
                  '[W]orkspace [S]ymbols'
               )

               -- -- See `:help K` for why this keymap
               nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
               nmap('<C-p>', vim.diagnostic.goto_prev, 'Previous Diagnostic')
               nmap('<C-n>', vim.diagnostic.goto_next, 'Next Diagnostic')
               -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

               -- -- Lesser used LSP functionality
               -- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
               -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
               -- nmap(
               --    '<leader>wr',
               --    vim.lsp.buf.remove_workspace_folder,
               --    '[W]orkspace [R]emove Folder'
               -- )
               -- nmap('<leader>wl', function()
               --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
               -- end, '[W]orkspace [L]ist Folders')

               -- Create a command `:Format` local to the LSP buffer
               -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
               --    vim.lsp.buf.format()
               -- end, { desc = 'Format current buffer with LSP' })
            end

            local overrides = {
               lua_ls = {
                  function()
                     require('lspconfig').lua_ls.setup {
                        on_attach = on_attach,
                        capabilities = capabilities,
                        settings = {
                           Lua = {
                              diagnostics = {
                                 globals = { 'vim' },
                              },
                           },
                        },
                     }
                  end,
               },
            }

            mason_lspconfig.setup_handlers {
               function(server_name)
                  if overrides[server_name] then
                     overrides[server_name][1]()
                  else
                     require('lspconfig')[server_name].setup {
                        on_attach = on_attach,
                        capabilities = capabilities,
                     }
                  end
               end,
            }

            local cmp = require 'cmp'
            local luasnip = require 'luasnip'

            luasnip.config.setup {}

            cmp.setup {
               snippet = {
                  expand = function(args)
                     luasnip.lsp_expand(args.body)
                  end,
               },
               mapping = cmp.mapping.preset.insert {
                  ['<C-a>'] = cmp.mapping(function(_)
                     vim.api.nvim_feedkeys(
                        vim.fn['copilot#Accept'](
                           vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
                        ),
                        'n',
                        true
                     )
                  end),
                  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-f>'] = cmp.mapping.scroll_docs(4),
                  ['<C-Space>'] = cmp.mapping.complete {},
                  ['<CR>'] = cmp.mapping.confirm {
                     behavior = cmp.ConfirmBehavior.Replace,
                     select = true,
                  },
                  ['<Tab>'] = cmp.mapping(function(fallback)
                     if cmp.visible() then
                        cmp.select_next_item()
                     elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                     else
                        fallback()
                     end
                  end, { 'i', 's' }),
                  ['<S-Tab>'] = cmp.mapping(function(fallback)
                     if cmp.visible() then
                        cmp.select_prev_item()
                     elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                     else
                        fallback()
                     end
                  end, { 'i', 's' }),
               },
               sources = {
                  { name = 'nvim_lsp' },
                  { name = 'luasnip' },
               },
            }
         end,
      }

      use {
         'mhartington/formatter.nvim',
         config = function()
            local util = require 'formatter.util'

            require('formatter').setup {
               filetype = {
                  javascript = {
                     require('formatter.filetypes.typescript').prettierd,
                     require('formatter.filetypes.typescript').eslint_d,
                  },
                  json = {
                     require('formatter.filetypes.typescript').prettierd,
                  },
                  typescript = {
                     require('formatter.filetypes.typescript').prettierd,
                     require('formatter.filetypes.typescript').eslint_d,
                  },
                  typescriptreact = {
                     require('formatter.filetypes.typescript').prettierd,
                     require('formatter.filetypes.typescript').eslint_d,
                  },
                  lua = { require('formatter.filetypes.lua').stylua },
               },
            }
         end,
      }

      use {
         'dnlhc/glance.nvim',
         config = function()
            vim.keymap.set('n', 'gD', '<CMD>Glance definitions<CR>')
            vim.keymap.set('n', 'gR', '<CMD>Glance references<CR>')
            vim.keymap.set('n', 'gY', '<CMD>Glance type_definitions<CR>')
            vim.keymap.set('n', 'gM', '<CMD>Glance implementations<CR>')

            require('glance').setup {
               border = { enable = true },
               -- your configuration
            }
         end,
      }

      use {
         'jessekelighine/vindent.vim',
         config = function()
            vim.g.vindent_motion_OO_prev = 'ª' -- jump to prev block of same indent.
            vim.g.vindent_motion_OO_next = '√' -- jump to next block of same indent.
            vim.g.vindent_motion_more_next = 'ﬁ' -- jump to next line with more indent.
            vim.g.vindent_motion_less_prev = '˛' -- jump to prev line with less indent.
         end,
      }

      use {
         'mfussenegger/nvim-dap',
         config = function()
            vim.keymap.set('n', '<leader>B', "<cmd>lua require'dap'.toggle_breakpoint()")
            vim.keymap.set('n', '<leader>C', "<cmd>lua require'dap'.continue()")
            vim.keymap.set('n', '<leader>D', "<cmd>lua require'dap'.repl.open()")
         end,
      }

      use {
         'folke/trouble.nvim',
         requires = 'kyazdani42/nvim-web-devicons',
         config = function()
            require('trouble').setup {
               -- your configuration comes here
               -- or leave it empty to use the default settings
               -- refer to the configuration section below
            }

            vim.keymap.set('n', '<leader>xx', function()
               require('trouble').open()
            end)
            vim.keymap.set('n', '<leader>xw', function()
               require('trouble').open 'workspace_diagnostics'
            end)
            vim.keymap.set('n', '<leader>xd', function()
               require('trouble').open 'document_diagnostics'
            end)
            vim.keymap.set('n', '<leader>xq', function()
               require('trouble').open 'quickfix'
            end)
            vim.keymap.set('n', '<leader>xl', function()
               require('trouble').open 'loclist'
            end)
            vim.keymap.set('n', 'gR', function()
               require('trouble').open 'lsp_references'
            end)
         end,
      }

      use {
         'kevinhwang91/rnvimr',
         config = function()
            vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>RnvimrToggle<CR>', { noremap = true })
            vim.g.rnvimr_edit_cmd = 'drop'
            vim.g.rnvimr_shadow_winblend = 80
         end,
      }

      if packer_bootstrap then
         require('packer').sync()
      end
   end,
}
