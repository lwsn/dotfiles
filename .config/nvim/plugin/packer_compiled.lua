-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/lowestalnacke/.cache/nvim/packer_hererocks/2.1.1696795921/share/lua/5.1/?.lua;/Users/lowestalnacke/.cache/nvim/packer_hererocks/2.1.1696795921/share/lua/5.1/?/init.lua;/Users/lowestalnacke/.cache/nvim/packer_hererocks/2.1.1696795921/lib/luarocks/rocks-5.1/?.lua;/Users/lowestalnacke/.cache/nvim/packer_hererocks/2.1.1696795921/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/lowestalnacke/.cache/nvim/packer_hererocks/2.1.1696795921/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["beacon.nvim"] = {
    config = { "\27LJ\2\n/\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\18beacon_shrink\6g\bvim\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/beacon.nvim",
    url = "https://github.com/DanilaMihailov/beacon.nvim"
  },
  ["blamer.nvim"] = {
    config = { "\27LJ\2\n∑\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0)\1Ù\1=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\22:BlamerToggle<CR>\14<Leader>b\5\20nvim_set_keymap\bapi blamer_show_in_insert_modes\17blamer_delay\6g\bvim\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/blamer.nvim",
    url = "https://github.com/APZelos/blamer.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\nµ\3\0\0\t\0\17\0>6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\15\0005\4\a\0004\5\3\0006\6\0\0'\b\4\0B\6\2\0029\6\5\6>\6\1\0056\6\0\0'\b\4\0B\6\2\0029\6\6\6>\6\2\5=\5\b\0044\5\3\0006\6\0\0'\b\4\0B\6\2\0029\6\5\6>\6\1\5=\5\t\0044\5\3\0006\6\0\0'\b\4\0B\6\2\0029\6\5\6>\6\1\0056\6\0\0'\b\4\0B\6\2\0029\6\6\6>\6\2\5=\5\n\0044\5\3\0006\6\0\0'\b\4\0B\6\2\0029\6\5\6>\6\1\0056\6\0\0'\b\4\0B\6\2\0029\6\6\6>\6\2\5=\5\v\0044\5\3\0006\6\0\0'\b\f\0B\6\2\0029\6\r\6>\6\1\5=\5\14\4=\4\16\3B\1\2\1K\0\1\0\rfiletype\1\0\0\blua\vstylua\28formatter.filetypes.lua\20typescriptreact\15typescript\tjson\15javascript\1\0\0\reslint_d\14prettierd#formatter.filetypes.typescript\nsetup\14formatter\19formatter.util\frequire\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf-lua"] = {
    config = { "\27LJ\2\n \1\0\0\a\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0'\3\3\0'\4\4\0'\5\5\0'\6\6\0&\3\6\3=\3\b\2B\0\2\1K\0\1\0\bcmd\1\0\0.-g '!{.git,node_modules}/*' '^.*[A-z]+.*'\25--smart-case --trim \28--no-heading --vimgrep \31rg --hidden --line-number \nfiles\ffzf-lua\frequire´\6\1\0\6\0!\0<6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0023\1\r\0=\1\f\0006\0\14\0009\0\15\0009\0\16\0'\2\17\0'\3\18\0'\4\19\0005\5\20\0B\0\5\0016\0\14\0009\0\15\0009\0\16\0'\2\17\0'\3\21\0'\4\22\0005\5\23\0B\0\5\0016\0\14\0009\0\15\0009\0\16\0'\2\17\0'\3\24\0'\4\25\0005\5\26\0B\0\5\0016\0\14\0009\0\15\0009\0\16\0'\2\17\0'\3\27\0'\4\28\0005\5\29\0B\0\5\0016\0\14\0009\0\15\0009\0\16\0'\2\17\0'\3\30\0'\4\31\0005\5 \0B\0\5\1K\0\1\0\1\0\1\fnoremap\2+<cmd>lua require('fzf-lua').grep()<CR>\15<Leader>sg\1\0\1\fnoremap\0020<cmd>lua require('fzf-lua').all_lines()<CR>\15<Leader>sa\1\0\1\fnoremap\2/<cmd>lua require('fzf-lua').oldfiles()<CR>\14<Leader>r\1\0\1\fnoremap\2,<cmd>lua require('fzf-lua').files()<CR>\20<Leader><Space>\1\0\1\fnoremap\2.<cmd>lua require('fzf-lua').buffers()<CR>\18<Leader><TAB>\6n\20nvim_set_keymap\bapi\bvim\0\14all_lines\nfiles\1\0\1\bcmd4rg --files --hidden -g '!{.git,node_modules}/*'\rfzf_opts\1\0\1\r--layout\1\fwinopts\1\0\0\fpreview\1\0\1\fdefault\bbat\1\0\3\14win_width\4ö≥ÊÃ\tô≥¶ˇ\3\15win_height\4ÊÃô≥\6ÊÃôˇ\3\15win_border\2\nsetup\ffzf-lua\frequire\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glance.nvim"] = {
    config = { "\27LJ\2\n⁄\2\0\0\5\0\18\0%6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0'\4\t\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0B\0\4\0016\0\f\0'\2\r\0B\0\2\0029\0\14\0005\2\16\0005\3\15\0=\3\17\2B\0\2\1K\0\1\0\vborder\1\0\0\1\0\1\venable\2\nsetup\vglance\frequire$<CMD>Glance implementations<CR>\agM%<CMD>Glance type_definitions<CR>\agY\31<CMD>Glance references<CR>\agR <CMD>Glance definitions<CR>\agD\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/glance.nvim",
    url = "https://github.com/dnlhc/glance.nvim"
  },
  ["lazygit.nvim"] = {
    config = { "\27LJ\2\nk\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\21<Cmd>LazyGit<CR>\14<Leader>G\5\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nI\0\1\6\0\2\0\n5\1\0\0008\1\0\1\14\0\1\0X\2\5Ä\18\3\0\0009\1\1\0)\4\0\0)\5\1\0B\1\4\2L\1\2\0\bsub\1\0\2\fV-BLOCK\6B\vV-LINE\6L∞\b\1\0\t\0=\0P5\0\0\0005\1\n\0005\2\4\0005\3\2\0009\4\1\0=\4\3\3=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2=\2\v\0015\2\14\0005\3\r\0009\4\f\0=\4\3\3=\3\5\2=\2\15\0015\2\18\0005\3\17\0009\4\16\0=\4\3\3=\3\5\2=\2\19\0015\2\22\0005\3\21\0009\4\20\0=\4\3\3=\3\5\2=\2\23\0015\2\26\0005\3\25\0009\4\24\0=\4\3\3=\3\5\2=\2\27\0016\2\28\0'\4\29\0B\2\2\0029\2\30\0025\4&\0005\5\31\0=\1 \0055\6!\0=\6\"\0055\6#\0=\6$\0054\6\0\0=\6%\5=\5'\0045\5+\0004\6\3\0005\a(\0003\b)\0=\b*\a>\a\1\6=\6,\0055\6-\0=\6.\0055\6/\0=\0060\0055\0061\0=\0062\0055\0063\0=\0064\5=\0055\0045\0057\0005\0066\0=\0060\0055\0068\0=\0062\5=\0059\0044\5\0\0=\5:\0044\5\0\0=\5;\0044\5\0\0=\5<\4B\2\2\1K\0\1\0\ftabline\20inactive_winbar\vwinbar\22inactive_sections\1\2\0\0\rfiletype\1\0\0\1\2\0\0\rfilename\rsections\14lualine_y\1\2\0\0\rlocation\14lualine_x\1\2\0\0\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\tdiff\14lualine_a\1\0\0\bfmt\0\1\2\0\0\tmode\foptions\1\0\0\17ignore_focus\25component_separators\1\2\0\0\5\23section_separators\1\2\0\0\5\ntheme\1\0\0\nsetup\flualine\frequire\rinactive\1\0\0\1\0\0\14menu_grey\freplace\1\0\0\1\0\0\tcyan\vvisual\1\0\0\1\0\0\vpurple\vinsert\1\0\0\1\0\0\tblue\vnormal\1\0\0\6c\1\0\1\abg\tnone\6b\1\0\1\abg\tnone\6a\1\0\0\afg\1\0\2\bgui\tbold\abg\tnone\ngreen\1\0\17\nblack\f#24292e\vpurple\f#c792ea\ngreen\f#C3E88D\nwhite\f#bfc7d5\rdark_red\f#BE5046\tblue\f#82b1ff\19gutter_fg_grey\f#4B5263\16cursor_grey\f#2C323C\14menu_grey\f#3E4452\17special_grey\f#3B4048\14vertsplit\tnone\17comment_grey\f#697098\tcyan\f#89DDFF\16dark_yellow\f#F78C6C\bred\f#ff5370\14light_red\f#ff869a\vyellow\f#ffcb6b\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n˚\1\0\0\5\0\n\0\0226\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0&<cmd>lua require'dap'.repl.open()\14<leader>D%<cmd>lua require'dap'.continue()\14<leader>C.<cmd>lua require'dap'.toggle_breakpoint()\14<leader>B\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-fzf"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/nvim-fzf",
    url = "https://github.com/vijaymarupudi/nvim-fzf"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n2\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\vformat\bbuf\blsp\bvim≥\1\1\1\6\1\v\0\0206\1\0\0009\1\1\0019\1\2\0015\3\3\0-\4\0\0=\4\4\3=\0\5\3B\1\2\0016\1\0\0009\1\1\0019\1\6\1'\3\a\0005\4\b\0-\5\0\0=\5\4\4=\0\5\0043\5\t\0=\5\n\4B\1\3\1K\0\1\0\2¿\rcallback\0\1\0\0\17BufWritePost\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvims\0\3\n\1\b\0\17\15\0\2\0X\3\3Ä'\3\0\0\18\4\2\0&\2\4\0036\3\1\0009\3\2\0039\3\3\3'\5\4\0\18\6\0\0\18\a\1\0005\b\5\0-\t\0\0=\t\6\b=\2\a\bB\3\5\1K\0\1\0\1¿\tdesc\vbuffer\1\0\0\6n\bset\vkeymap\bvim\nLSP: ó\5\1\2\t\1\31\0D-\2\0\0\18\4\1\0B\2\2\0013\2\0\0\18\3\2\0'\5\1\0006\6\2\0009\6\3\0069\6\4\0069\6\5\6'\a\6\0B\3\4\1\18\3\2\0'\5\a\0006\6\2\0009\6\3\0069\6\4\0069\6\b\6'\a\t\0B\3\4\1\18\3\2\0'\5\n\0006\6\2\0009\6\3\0069\6\4\0069\6\v\6'\a\f\0B\3\4\1\18\3\2\0'\5\r\0006\6\14\0'\b\15\0B\6\2\0029\6\16\6'\a\17\0B\3\4\1\18\3\2\0'\5\18\0006\6\14\0'\b\15\0B\6\2\0029\6\19\6'\a\20\0B\3\4\1\18\3\2\0'\5\21\0006\6\2\0009\6\3\0069\6\4\0069\6\22\6'\a\23\0B\3\4\1\18\3\2\0'\5\24\0006\6\2\0009\6\25\0069\6\26\6'\a\27\0B\3\4\1\18\3\2\0'\5\28\0006\6\2\0009\6\25\0069\6\29\6'\a\30\0B\3\4\0012\0\0ÄK\0\1\0\3¿\20Next Diagnostic\14goto_next\n<C-n>\24Previous Diagnostic\14goto_prev\15diagnostic\n<C-p>\24Hover Documentation\nhover\6K\26[W]orkspace [S]ymbols\"lsp_dynamic_workspace_symbols\15<leader>Ws\25[D]ocument [S]ymbols\25lsp_document_symbols\22telescope.builtin\frequire\15<leader>ds\22Type [D]efinition\20type_definition\14<leader>D\28[G]oto [I]mplementation\19implementation\agI\24[G]oto [D]efinition\15definition\bbuf\blsp\bvim\agd\0∆\1\0\0\a\2\15\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2-\3\1\0=\3\6\0025\3\f\0005\4\n\0005\5\b\0005\6\a\0=\6\t\5=\5\v\4=\4\r\3=\3\14\2B\0\2\1K\0\1\0\4¿\0Ä\rsettings\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\17capabilities\14on_attach\1\0\0\nsetup\vlua_ls\14lspconfig\frequireì\1\0\1\5\3\6\0\21-\1\0\0008\1\0\1\15\0\1\0X\2\5Ä-\1\0\0008\1\0\1:\1\1\1B\1\1\1X\1\vÄ6\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\3\0-\4\1\0=\4\4\3-\4\2\0=\4\5\3B\1\2\1K\0\1\0\5¿\4¿\0Ä\17capabilities\14on_attach\1\0\0\nsetup\14lspconfig\frequire-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\a¿\tbody\15lsp_expandö\1\0\1\v\0\b\0\0196\1\0\0009\1\1\0019\1\2\0016\3\0\0009\3\3\0039\3\4\0036\5\0\0009\5\1\0059\5\5\5'\a\6\0+\b\2\0+\t\2\0+\n\2\0B\5\5\0A\3\0\2'\4\a\0+\5\2\0B\1\4\1K\0\1\0\6n\n<Tab>\27nvim_replace_termcodes\19copilot#Accept\afn\18nvim_feedkeys\bapi\bvimö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\6¿\a¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\6¿\a¿\tjump\rjumpable\21select_prev_item\fvisibleØ\b\1\0\18\0A\0{6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0009\0\v\0B\0\1\0026\1\f\0'\3\r\0B\1\2\0029\1\14\1\18\3\0\0B\1\2\2\18\0\1\0006\1\f\0'\3\15\0B\1\2\0029\1\16\1B\1\1\0016\1\f\0'\3\17\0B\1\2\0029\2\16\0015\4\19\0005\5\18\0=\5\20\4B\2\2\0016\2\0\0009\2\21\0029\2\22\2'\4\23\0004\5\0\0B\2\3\0023\3\24\0003\4\25\0005\5\27\0004\6\3\0003\a\26\0>\a\1\6=\6\28\0059\6\29\0014\b\3\0003\t\30\0>\t\1\bB\6\2\0016\6\f\0'\b\31\0B\6\2\0026\a\f\0'\t \0B\a\2\0029\b!\a9\b\16\b4\n\0\0B\b\2\0019\b\16\0065\n%\0005\v#\0003\f\"\0=\f$\v=\v&\n9\v'\0069\v(\v9\v)\v5\r+\0009\14'\0063\16*\0B\14\2\2=\14,\r9\14'\0069\14-\14)\16¸ˇB\14\2\2=\14.\r9\14'\0069\14-\14)\16\4\0B\14\2\2=\14/\r9\14'\0069\0140\0144\16\0\0B\14\2\2=\0141\r9\14'\0069\0142\0145\0165\0009\0173\0069\0174\17=\0176\16B\14\2\2=\0147\r9\14'\0063\0168\0005\0179\0B\14\3\2=\14:\r9\14'\0063\16;\0005\17<\0B\14\3\2=\14=\rB\v\2\2=\v'\n4\v\3\0005\f>\0>\f\1\v5\f?\0>\f\2\v=\v@\nB\b\2\0012\0\0ÄK\0\1\0\fsources\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-a>\1\0\0\0\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\vconfig\fluasnip\bcmp\0\19setup_handlers\vlua_ls\1\0\0\0\0\0\18LspFormatting\24nvim_create_augroup\bapi\21ensure_installed\1\0\0\1\3\0\0\rtsserver\16tailwindcss\20mason-lspconfig\nsetup\nmason\25default_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\1\0\2\vsilent\2\texpr\2\23copilot#Accept('')$<Plug>(vimrc:copilot-dummy-map)\6i\bset\vkeymap\23copilot_no_tab_map\6g\bvim\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\2\ní\5\0\0\6\0\25\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\0025\3\16\0005\4\14\0005\5\15\0=\5\n\4=\4\17\0035\4\18\0005\5\19\0=\5\20\0045\5\21\0=\5\22\4=\4\23\3=\3\24\2B\0\2\1K\0\1\0\16textobjects\tmove\24goto_previous_start\1\0\1\a√ñ\20@function.outer\20goto_next_start\1\0\1\a√Ñ\20@function.outer\1\0\2\venable\2\14set_jumps\2\vselect\1\0\0\1\0\4\aaf\20@function.outer\aif\20@function.inner\aac\17@class.outer\aic\17@class.inner\1\0\2\venable\2\14lookahead\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\bgrn\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\2\17auto_install\2&additional_vim_regex_highlighting\1\1\5\0\0\15typescript\fgraphql\btsx\15javascript\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    config = { "\27LJ\2\n`\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Aautocmd BufWritePost init.lua source <afile> | PackerCompile\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  rnvimr = {
    config = { "\27LJ\2\nø\1\0\0\6\0\v\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\a\0'\1\t\0=\1\b\0006\0\0\0009\0\a\0)\1P\0=\1\n\0K\0\1\0\27rnvimr_shadow_winblend\tdrop\20rnvimr_edit_cmd\6g\1\0\1\fnoremap\2\26<cmd>RnvimrToggle<CR>\14<leader>f\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/rnvimr",
    url = "https://github.com/kevinhwang91/rnvimr"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  theme = {
    config = { "\27LJ\2\n≈\2\0\0\6\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\15\0005\4\t\0005\5\b\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\4=\4\16\3=\3\17\2B\0\2\0016\0\18\0009\0\19\0'\2\20\0B\0\2\1K\0\1\0\28colorscheme github_dark\bcmd\bvim\vgroups\ball\1\0\0\17StatusLineNC\1\0\2\afg\bbg0\abg\tNONE\15StatusLine\1\0\2\afg\bbg1\abg\tNONE\14VertSplit\1\0\0\1\0\2\afg\bbg1\abg\tNONE\foptions\1\0\0\vstyles\1\0\1\16transparent\2\1\0\1\14functions\vitalic\nsetup\17github-theme\frequire\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\2\n∂\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\2\15navigation\1\0\1\31enable_default_keybindings\2\14copy_sync\1\0\0\1\0\1\venable\1\nsetup\ttmux\frequire\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "https://github.com/aserowy/tmux.nvim"
  },
  treesj = {
    config = { "\27LJ\2\ní\1\0\0\a\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0006\4\0\0'\6\1\0B\4\2\0029\4\t\4B\0\4\1K\0\1\0\vtoggle\6-\6n\bset\vkeymap\bvim\1\0\1\24use_default_keymaps\1\nsetup\vtreesj\frequire\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/treesj",
    url = "https://github.com/Wansmer/treesj"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\topen\ftrouble\frequireN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\26workspace_diagnostics\topen\ftrouble\frequireM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\25document_diagnostics\topen\ftrouble\frequireA\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rquickfix\topen\ftrouble\frequire@\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\floclist\topen\ftrouble\frequireG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\19lsp_references\topen\ftrouble\frequire≤\2\1\0\5\0\19\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0003\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0003\4\n\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\v\0003\4\f\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0003\4\14\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\15\0003\4\16\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\17\0003\4\18\0B\0\4\1K\0\1\0\0\agR\0\15<leader>xl\0\15<leader>xq\0\15<leader>xd\0\15<leader>xw\0\15<leader>xx\6n\bset\vkeymap\bvim\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["ts-error-translator.nvim"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/ts-error-translator.nvim",
    url = "https://github.com/dmmulroy/ts-error-translator.nvim"
  },
  ["typescript-tools.nvim"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/typescript-tools.nvim",
    url = "https://github.com/pmizio/typescript-tools.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/vim-cool",
    url = "https://github.com/romainl/vim-cool"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/vim-exchange",
    url = "https://github.com/tommcdo/vim-exchange"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\nÑ\4\0\0\6\0\25\00096\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\22\0'\4\23\0005\5\24\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\18:Git push<CR>\15<Leader>gp\1\0\1\fnoremap\2\15:Gclog<CR>\15<Leader>gl\1\0\1\fnoremap\2\21:Gvdiffsplit<CR>\15<Leader>gd\1\0\1\fnoremap\2\20:Git commit<CR>\15<Leader>gc\1\0\1\fnoremap\2\19:Git blame<CR>\15<Leader>gb\1\0\1\fnoremap\2\r:Git<CR>\15<Leader>gs\1\0\1\fnoremap\2\16:Git<SPACE>\15<Leader>gg\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vindent.vim"] = {
    config = { "\27LJ\2\nø\1\0\0\2\0\n\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0K\0\1\0\aÀõ\29vindent_motion_less_prev\bÔ¨Å\29vindent_motion_more_next\b‚àö\27vindent_motion_OO_next\a¬™\27vindent_motion_OO_prev\6g\bvim\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/vindent.vim",
    url = "https://github.com/jessekelighine/vindent.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nt\0\0\3\0\a\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0" },
    loaded = true,
    path = "/Users/lowestalnacke/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lazygit.nvim
time([[Config for lazygit.nvim]], true)
try_loadstring("\27LJ\2\nk\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\21<Cmd>LazyGit<CR>\14<Leader>G\5\20nvim_set_keymap\bapi\bvim\0", "config", "lazygit.nvim")
time([[Config for lazygit.nvim]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
try_loadstring("\27LJ\2\ní\5\0\0\6\0\25\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\0025\3\16\0005\4\14\0005\5\15\0=\5\n\4=\4\17\0035\4\18\0005\5\19\0=\5\20\0045\5\21\0=\5\22\4=\4\23\3=\3\24\2B\0\2\1K\0\1\0\16textobjects\tmove\24goto_previous_start\1\0\1\a√ñ\20@function.outer\20goto_next_start\1\0\1\a√Ñ\20@function.outer\1\0\2\venable\2\14set_jumps\2\vselect\1\0\0\1\0\4\aaf\20@function.outer\aif\20@function.inner\aac\17@class.outer\aic\17@class.inner\1\0\2\venable\2\14lookahead\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\bgrn\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\2\17auto_install\2&additional_vim_regex_highlighting\1\1\5\0\0\15typescript\fgraphql\btsx\15javascript\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\nÑ\4\0\0\6\0\25\00096\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\22\0'\4\23\0005\5\24\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\18:Git push<CR>\15<Leader>gp\1\0\1\fnoremap\2\15:Gclog<CR>\15<Leader>gl\1\0\1\fnoremap\2\21:Gvdiffsplit<CR>\15<Leader>gd\1\0\1\fnoremap\2\20:Git commit<CR>\15<Leader>gc\1\0\1\fnoremap\2\19:Git blame<CR>\15<Leader>gb\1\0\1\fnoremap\2\r:Git<CR>\15<Leader>gs\1\0\1\fnoremap\2\16:Git<SPACE>\15<Leader>gg\6n\20nvim_set_keymap\bapi\bvim\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nI\0\1\6\0\2\0\n5\1\0\0008\1\0\1\14\0\1\0X\2\5Ä\18\3\0\0009\1\1\0)\4\0\0)\5\1\0B\1\4\2L\1\2\0\bsub\1\0\2\fV-BLOCK\6B\vV-LINE\6L∞\b\1\0\t\0=\0P5\0\0\0005\1\n\0005\2\4\0005\3\2\0009\4\1\0=\4\3\3=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2=\2\v\0015\2\14\0005\3\r\0009\4\f\0=\4\3\3=\3\5\2=\2\15\0015\2\18\0005\3\17\0009\4\16\0=\4\3\3=\3\5\2=\2\19\0015\2\22\0005\3\21\0009\4\20\0=\4\3\3=\3\5\2=\2\23\0015\2\26\0005\3\25\0009\4\24\0=\4\3\3=\3\5\2=\2\27\0016\2\28\0'\4\29\0B\2\2\0029\2\30\0025\4&\0005\5\31\0=\1 \0055\6!\0=\6\"\0055\6#\0=\6$\0054\6\0\0=\6%\5=\5'\0045\5+\0004\6\3\0005\a(\0003\b)\0=\b*\a>\a\1\6=\6,\0055\6-\0=\6.\0055\6/\0=\0060\0055\0061\0=\0062\0055\0063\0=\0064\5=\0055\0045\0057\0005\0066\0=\0060\0055\0068\0=\0062\5=\0059\0044\5\0\0=\5:\0044\5\0\0=\5;\0044\5\0\0=\5<\4B\2\2\1K\0\1\0\ftabline\20inactive_winbar\vwinbar\22inactive_sections\1\2\0\0\rfiletype\1\0\0\1\2\0\0\rfilename\rsections\14lualine_y\1\2\0\0\rlocation\14lualine_x\1\2\0\0\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\tdiff\14lualine_a\1\0\0\bfmt\0\1\2\0\0\tmode\foptions\1\0\0\17ignore_focus\25component_separators\1\2\0\0\5\23section_separators\1\2\0\0\5\ntheme\1\0\0\nsetup\flualine\frequire\rinactive\1\0\0\1\0\0\14menu_grey\freplace\1\0\0\1\0\0\tcyan\vvisual\1\0\0\1\0\0\vpurple\vinsert\1\0\0\1\0\0\tblue\vnormal\1\0\0\6c\1\0\1\abg\tnone\6b\1\0\1\abg\tnone\6a\1\0\0\afg\1\0\2\bgui\tbold\abg\tnone\ngreen\1\0\17\nblack\f#24292e\vpurple\f#c792ea\ngreen\f#C3E88D\nwhite\f#bfc7d5\rdark_red\f#BE5046\tblue\f#82b1ff\19gutter_fg_grey\f#4B5263\16cursor_grey\f#2C323C\14menu_grey\f#3E4452\17special_grey\f#3B4048\14vertsplit\tnone\17comment_grey\f#697098\tcyan\f#89DDFF\16dark_yellow\f#F78C6C\bred\f#ff5370\14light_red\f#ff869a\vyellow\f#ffcb6b\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\2\n∂\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\2\15navigation\1\0\1\31enable_default_keybindings\2\14copy_sync\1\0\0\1\0\1\venable\1\nsetup\ttmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\nµ\3\0\0\t\0\17\0>6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\15\0005\4\a\0004\5\3\0006\6\0\0'\b\4\0B\6\2\0029\6\5\6>\6\1\0056\6\0\0'\b\4\0B\6\2\0029\6\6\6>\6\2\5=\5\b\0044\5\3\0006\6\0\0'\b\4\0B\6\2\0029\6\5\6>\6\1\5=\5\t\0044\5\3\0006\6\0\0'\b\4\0B\6\2\0029\6\5\6>\6\1\0056\6\0\0'\b\4\0B\6\2\0029\6\6\6>\6\2\5=\5\n\0044\5\3\0006\6\0\0'\b\4\0B\6\2\0029\6\5\6>\6\1\0056\6\0\0'\b\4\0B\6\2\0029\6\6\6>\6\2\5=\5\v\0044\5\3\0006\6\0\0'\b\f\0B\6\2\0029\6\r\6>\6\1\5=\5\14\4=\4\16\3B\1\2\1K\0\1\0\rfiletype\1\0\0\blua\vstylua\28formatter.filetypes.lua\20typescriptreact\15typescript\tjson\15javascript\1\0\0\reslint_d\14prettierd#formatter.filetypes.typescript\nsetup\14formatter\19formatter.util\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\topen\ftrouble\frequireN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\26workspace_diagnostics\topen\ftrouble\frequireM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\25document_diagnostics\topen\ftrouble\frequireA\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rquickfix\topen\ftrouble\frequire@\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\floclist\topen\ftrouble\frequireG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\19lsp_references\topen\ftrouble\frequire≤\2\1\0\5\0\19\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0003\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0003\4\n\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\v\0003\4\f\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0003\4\14\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\15\0003\4\16\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\17\0003\4\18\0B\0\4\1K\0\1\0\0\agR\0\15<leader>xl\0\15<leader>xq\0\15<leader>xd\0\15<leader>xw\0\15<leader>xx\6n\bset\vkeymap\bvim\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: fzf-lua
time([[Config for fzf-lua]], true)
try_loadstring("\27LJ\2\n \1\0\0\a\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0'\3\3\0'\4\4\0'\5\5\0'\6\6\0&\3\6\3=\3\b\2B\0\2\1K\0\1\0\bcmd\1\0\0.-g '!{.git,node_modules}/*' '^.*[A-z]+.*'\25--smart-case --trim \28--no-heading --vimgrep \31rg --hidden --line-number \nfiles\ffzf-lua\frequire´\6\1\0\6\0!\0<6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0023\1\r\0=\1\f\0006\0\14\0009\0\15\0009\0\16\0'\2\17\0'\3\18\0'\4\19\0005\5\20\0B\0\5\0016\0\14\0009\0\15\0009\0\16\0'\2\17\0'\3\21\0'\4\22\0005\5\23\0B\0\5\0016\0\14\0009\0\15\0009\0\16\0'\2\17\0'\3\24\0'\4\25\0005\5\26\0B\0\5\0016\0\14\0009\0\15\0009\0\16\0'\2\17\0'\3\27\0'\4\28\0005\5\29\0B\0\5\0016\0\14\0009\0\15\0009\0\16\0'\2\17\0'\3\30\0'\4\31\0005\5 \0B\0\5\1K\0\1\0\1\0\1\fnoremap\2+<cmd>lua require('fzf-lua').grep()<CR>\15<Leader>sg\1\0\1\fnoremap\0020<cmd>lua require('fzf-lua').all_lines()<CR>\15<Leader>sa\1\0\1\fnoremap\2/<cmd>lua require('fzf-lua').oldfiles()<CR>\14<Leader>r\1\0\1\fnoremap\2,<cmd>lua require('fzf-lua').files()<CR>\20<Leader><Space>\1\0\1\fnoremap\2.<cmd>lua require('fzf-lua').buffers()<CR>\18<Leader><TAB>\6n\20nvim_set_keymap\bapi\bvim\0\14all_lines\nfiles\1\0\1\bcmd4rg --files --hidden -g '!{.git,node_modules}/*'\rfzf_opts\1\0\1\r--layout\1\fwinopts\1\0\0\fpreview\1\0\1\fdefault\bbat\1\0\3\14win_width\4ö≥ÊÃ\tô≥¶ˇ\3\15win_height\4ÊÃô≥\6ÊÃôˇ\3\15win_border\2\nsetup\ffzf-lua\frequire\0", "config", "fzf-lua")
time([[Config for fzf-lua]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n˚\1\0\0\5\0\n\0\0226\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0&<cmd>lua require'dap'.repl.open()\14<leader>D%<cmd>lua require'dap'.continue()\14<leader>C.<cmd>lua require'dap'.toggle_breakpoint()\14<leader>B\6n\bset\vkeymap\bvim\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: rnvimr
time([[Config for rnvimr]], true)
try_loadstring("\27LJ\2\nø\1\0\0\6\0\v\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\a\0'\1\t\0=\1\b\0006\0\0\0009\0\a\0)\1P\0=\1\n\0K\0\1\0\27rnvimr_shadow_winblend\tdrop\20rnvimr_edit_cmd\6g\1\0\1\fnoremap\2\26<cmd>RnvimrToggle<CR>\14<leader>f\6n\20nvim_set_keymap\bapi\bvim\0", "config", "rnvimr")
time([[Config for rnvimr]], false)
-- Config for: vindent.vim
time([[Config for vindent.vim]], true)
try_loadstring("\27LJ\2\nø\1\0\0\2\0\n\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0K\0\1\0\aÀõ\29vindent_motion_less_prev\bÔ¨Å\29vindent_motion_more_next\b‚àö\27vindent_motion_OO_next\a¬™\27vindent_motion_OO_prev\6g\bvim\0", "config", "vindent.vim")
time([[Config for vindent.vim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nt\0\0\3\0\a\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: treesj
time([[Config for treesj]], true)
try_loadstring("\27LJ\2\ní\1\0\0\a\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0006\4\0\0'\6\1\0B\4\2\0029\4\t\4B\0\4\1K\0\1\0\vtoggle\6-\6n\bset\vkeymap\bvim\1\0\1\24use_default_keymaps\1\nsetup\vtreesj\frequire\0", "config", "treesj")
time([[Config for treesj]], false)
-- Config for: blamer.nvim
time([[Config for blamer.nvim]], true)
try_loadstring("\27LJ\2\n∑\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0)\1Ù\1=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\22:BlamerToggle<CR>\14<Leader>b\5\20nvim_set_keymap\bapi blamer_show_in_insert_modes\17blamer_delay\6g\bvim\0", "config", "blamer.nvim")
time([[Config for blamer.nvim]], false)
-- Config for: packer.nvim
time([[Config for packer.nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Aautocmd BufWritePost init.lua source <afile> | PackerCompile\bcmd\bvim\0", "config", "packer.nvim")
time([[Config for packer.nvim]], false)
-- Config for: glance.nvim
time([[Config for glance.nvim]], true)
try_loadstring("\27LJ\2\n⁄\2\0\0\5\0\18\0%6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0'\4\t\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0B\0\4\0016\0\f\0'\2\r\0B\0\2\0029\0\14\0005\2\16\0005\3\15\0=\3\17\2B\0\2\1K\0\1\0\vborder\1\0\0\1\0\1\venable\2\nsetup\vglance\frequire$<CMD>Glance implementations<CR>\agM%<CMD>Glance type_definitions<CR>\agY\31<CMD>Glance references<CR>\agR <CMD>Glance definitions<CR>\agD\6n\bset\vkeymap\bvim\0", "config", "glance.nvim")
time([[Config for glance.nvim]], false)
-- Config for: theme
time([[Config for theme]], true)
try_loadstring("\27LJ\2\n≈\2\0\0\6\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\15\0005\4\t\0005\5\b\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\4=\4\16\3=\3\17\2B\0\2\0016\0\18\0009\0\19\0'\2\20\0B\0\2\1K\0\1\0\28colorscheme github_dark\bcmd\bvim\vgroups\ball\1\0\0\17StatusLineNC\1\0\2\afg\bbg0\abg\tNONE\15StatusLine\1\0\2\afg\bbg1\abg\tNONE\14VertSplit\1\0\0\1\0\2\afg\bbg1\abg\tNONE\foptions\1\0\0\vstyles\1\0\1\16transparent\2\1\0\1\14functions\vitalic\nsetup\17github-theme\frequire\0", "config", "theme")
time([[Config for theme]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\vformat\bbuf\blsp\bvim≥\1\1\1\6\1\v\0\0206\1\0\0009\1\1\0019\1\2\0015\3\3\0-\4\0\0=\4\4\3=\0\5\3B\1\2\0016\1\0\0009\1\1\0019\1\6\1'\3\a\0005\4\b\0-\5\0\0=\5\4\4=\0\5\0043\5\t\0=\5\n\4B\1\3\1K\0\1\0\2¿\rcallback\0\1\0\0\17BufWritePost\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvims\0\3\n\1\b\0\17\15\0\2\0X\3\3Ä'\3\0\0\18\4\2\0&\2\4\0036\3\1\0009\3\2\0039\3\3\3'\5\4\0\18\6\0\0\18\a\1\0005\b\5\0-\t\0\0=\t\6\b=\2\a\bB\3\5\1K\0\1\0\1¿\tdesc\vbuffer\1\0\0\6n\bset\vkeymap\bvim\nLSP: ó\5\1\2\t\1\31\0D-\2\0\0\18\4\1\0B\2\2\0013\2\0\0\18\3\2\0'\5\1\0006\6\2\0009\6\3\0069\6\4\0069\6\5\6'\a\6\0B\3\4\1\18\3\2\0'\5\a\0006\6\2\0009\6\3\0069\6\4\0069\6\b\6'\a\t\0B\3\4\1\18\3\2\0'\5\n\0006\6\2\0009\6\3\0069\6\4\0069\6\v\6'\a\f\0B\3\4\1\18\3\2\0'\5\r\0006\6\14\0'\b\15\0B\6\2\0029\6\16\6'\a\17\0B\3\4\1\18\3\2\0'\5\18\0006\6\14\0'\b\15\0B\6\2\0029\6\19\6'\a\20\0B\3\4\1\18\3\2\0'\5\21\0006\6\2\0009\6\3\0069\6\4\0069\6\22\6'\a\23\0B\3\4\1\18\3\2\0'\5\24\0006\6\2\0009\6\25\0069\6\26\6'\a\27\0B\3\4\1\18\3\2\0'\5\28\0006\6\2\0009\6\25\0069\6\29\6'\a\30\0B\3\4\0012\0\0ÄK\0\1\0\3¿\20Next Diagnostic\14goto_next\n<C-n>\24Previous Diagnostic\14goto_prev\15diagnostic\n<C-p>\24Hover Documentation\nhover\6K\26[W]orkspace [S]ymbols\"lsp_dynamic_workspace_symbols\15<leader>Ws\25[D]ocument [S]ymbols\25lsp_document_symbols\22telescope.builtin\frequire\15<leader>ds\22Type [D]efinition\20type_definition\14<leader>D\28[G]oto [I]mplementation\19implementation\agI\24[G]oto [D]efinition\15definition\bbuf\blsp\bvim\agd\0∆\1\0\0\a\2\15\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2-\3\1\0=\3\6\0025\3\f\0005\4\n\0005\5\b\0005\6\a\0=\6\t\5=\5\v\4=\4\r\3=\3\14\2B\0\2\1K\0\1\0\4¿\0Ä\rsettings\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\17capabilities\14on_attach\1\0\0\nsetup\vlua_ls\14lspconfig\frequireì\1\0\1\5\3\6\0\21-\1\0\0008\1\0\1\15\0\1\0X\2\5Ä-\1\0\0008\1\0\1:\1\1\1B\1\1\1X\1\vÄ6\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\3\0-\4\1\0=\4\4\3-\4\2\0=\4\5\3B\1\2\1K\0\1\0\5¿\4¿\0Ä\17capabilities\14on_attach\1\0\0\nsetup\14lspconfig\frequire-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\a¿\tbody\15lsp_expandö\1\0\1\v\0\b\0\0196\1\0\0009\1\1\0019\1\2\0016\3\0\0009\3\3\0039\3\4\0036\5\0\0009\5\1\0059\5\5\5'\a\6\0+\b\2\0+\t\2\0+\n\2\0B\5\5\0A\3\0\2'\4\a\0+\5\2\0B\1\4\1K\0\1\0\6n\n<Tab>\27nvim_replace_termcodes\19copilot#Accept\afn\18nvim_feedkeys\bapi\bvimö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\6¿\a¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\6¿\a¿\tjump\rjumpable\21select_prev_item\fvisibleØ\b\1\0\18\0A\0{6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0009\0\v\0B\0\1\0026\1\f\0'\3\r\0B\1\2\0029\1\14\1\18\3\0\0B\1\2\2\18\0\1\0006\1\f\0'\3\15\0B\1\2\0029\1\16\1B\1\1\0016\1\f\0'\3\17\0B\1\2\0029\2\16\0015\4\19\0005\5\18\0=\5\20\4B\2\2\0016\2\0\0009\2\21\0029\2\22\2'\4\23\0004\5\0\0B\2\3\0023\3\24\0003\4\25\0005\5\27\0004\6\3\0003\a\26\0>\a\1\6=\6\28\0059\6\29\0014\b\3\0003\t\30\0>\t\1\bB\6\2\0016\6\f\0'\b\31\0B\6\2\0026\a\f\0'\t \0B\a\2\0029\b!\a9\b\16\b4\n\0\0B\b\2\0019\b\16\0065\n%\0005\v#\0003\f\"\0=\f$\v=\v&\n9\v'\0069\v(\v9\v)\v5\r+\0009\14'\0063\16*\0B\14\2\2=\14,\r9\14'\0069\14-\14)\16¸ˇB\14\2\2=\14.\r9\14'\0069\14-\14)\16\4\0B\14\2\2=\14/\r9\14'\0069\0140\0144\16\0\0B\14\2\2=\0141\r9\14'\0069\0142\0145\0165\0009\0173\0069\0174\17=\0176\16B\14\2\2=\0147\r9\14'\0063\0168\0005\0179\0B\14\3\2=\14:\r9\14'\0063\16;\0005\17<\0B\14\3\2=\14=\rB\v\2\2=\v'\n4\v\3\0005\f>\0>\f\1\v5\f?\0>\f\2\v=\v@\nB\b\2\0012\0\0ÄK\0\1\0\fsources\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-a>\1\0\0\0\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\vconfig\fluasnip\bcmp\0\19setup_handlers\vlua_ls\1\0\0\0\0\0\18LspFormatting\24nvim_create_augroup\bapi\21ensure_installed\1\0\0\1\3\0\0\rtsserver\16tailwindcss\20mason-lspconfig\nsetup\nmason\25default_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\1\0\2\vsilent\2\texpr\2\23copilot#Accept('')$<Plug>(vimrc:copilot-dummy-map)\6i\bset\vkeymap\23copilot_no_tab_map\6g\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: beacon.nvim
time([[Config for beacon.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\18beacon_shrink\6g\bvim\0", "config", "beacon.nvim")
time([[Config for beacon.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
