-------------
-- Options --
-------------

vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.inccommand = 'nosplit'
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
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

--------------
-- Mappings --
--------------

-- Leader

vim.g.mapleader = ' '

vim.api.nvim_set_keymap('', 'ö', '{', {noremap = true})
vim.api.nvim_set_keymap('', 'ä', '}', {noremap = true})
vim.api.nvim_set_keymap('', 'Ö', '{', {noremap = true})
vim.api.nvim_set_keymap('', 'Ä', '}', {noremap = true})

vim.api.nvim_set_keymap('', 'D', 'dd', {noremap = true})
vim.api.nvim_set_keymap('', 'Y', 'yy', {noremap = true})

vim.api.nvim_set_keymap('', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('', '<C-l>', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-l>', '<C-w>l', {noremap = true})

vim.api.nvim_set_keymap('', '<LEADER>w', ':w<CR>',  {noremap = true})
vim.api.nvim_set_keymap('', '<LEADER>q', ':q<CR>',  {noremap = true})

-------------
-- Plugins --
-------------

-- Auto install plugin manager

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
  })
end
-- Plugins configurations

return require'packer'.startup {
  config = {
    auto_reload_compiled = false
  },
  function(use)
    -- Let packer manage itself
    use {
      'wbthomason/packer.nvim',
      config = function()
        vim.cmd "autocmd BufWritePost init.lua source <afile> | PackerCompile"
      end
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
      end
    }

    use 'tpope/vim-fugitive' -- Git commands in nvim
    use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
    use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
    -- Add git related info in the signs columns and popups
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter'
    -- Additional textobjects for treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Fuzzy search
    use {
        'ibhagwan/fzf-lua',
        requires = {
            'vijaymarupudi/nvim-fzf',
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
            vim.api.nvim_set_keymap('n', '<LEADER><TAB>', "<cmd>lua require('fzf-lua').buffers()<CR>", {noremap = true})
            vim.api.nvim_set_keymap('n', '<LEADER><Space>', "<cmd>lua require('fzf-lua').files()<CR>", {noremap = true})
            vim.api.nvim_set_keymap('n', '<LEADER>r', "<cmd>lua require('fzf-lua').oldfiles()<CR>", {noremap = true})
            vim.api.nvim_set_keymap('n', '<LEADER>s', "<cmd>lua require('fzf-lua').live_grep()<CR>", {noremap = true})
        end
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
                "pylsp",
                "pyright",
                "sumneko_lua",
                "tsserver",
                "yamlls",
                "json",
                "html",
            }

            for _, server in pairs(required_servers) do
                require"nvim-lsp-installer".install(server)
            end
        end,
        config = function()
            local lsp_installer = require("nvim-lsp-installer")
            local cmp = require("cmp")

            lsp_installer.on_server_ready(function(server)
                local on_attach = function(client, bufnr)
                    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

                    --Enable completion triggered by <c-x><c-o>
                    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

                    -- Mappings.
                    local opts = { noremap=true, silent=true }

                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
                    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
                end

                server:setup({ on_attach = on_attach() })

                vim.cmd [[ do User LspAttachBuffers ]]
            end)

            cmp.setup {
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
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
                        else
                            fallback()
                        end
                    end,
                    ['<S-Tab>'] = function(fallback)
                        if vim.fn.pumvisible() == 1 then
                            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
                        else
                            fallback()
                        end
                    end,
                },
                sources = {
                    { name = 'nvim_lsp' }
                }
            }
        end
    }

    if packer_bootstrap then
      require('packer').sync()
    end

  end
}
