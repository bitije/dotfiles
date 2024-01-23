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
local package_path_str = "/home/w/.cache/nvim/packer_hererocks/2.1.1702233742/share/lua/5.1/?.lua;/home/w/.cache/nvim/packer_hererocks/2.1.1702233742/share/lua/5.1/?/init.lua;/home/w/.cache/nvim/packer_hererocks/2.1.1702233742/lib/luarocks/rocks-5.1/?.lua;/home/w/.cache/nvim/packer_hererocks/2.1.1702233742/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/w/.cache/nvim/packer_hererocks/2.1.1702233742/lib/lua/5.1/?.so"
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
    path = "/home/w/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    config = { "\27LJ\2\nÇ\2\0\0\5\0\14\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0B\0\2\1K\0\1\0\21catppuccin-mocha\16colorscheme\bcmd\bvim\20color_overrides\nmocha\1\0\0\1\0\3\ncrust\f#000000\tbase\f#000000\vmantle\f#000000\17integrations\1\0\0\1\0\3\15treesitter\2\14telescope\2\bcmp\2\nsetup\15catppuccin\frequire\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["codeium.vim"] = {
    config = { "\27LJ\2\n-\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19codeium#Accept\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2\1\0D\0\2\0\29codeium#CycleCompletions\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2ˇˇD\0\2\0\29codeium#CycleCompletions\afn\bvim,\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\18codeium#Clear\afn\bvim°\2\1\0\6\0\19\0)6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0003\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0003\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0003\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0003\4\17\0005\5\18\0B\0\5\1K\0\1\0\1\0\1\texpr\2\0\n<c-x>\1\0\1\texpr\2\0\n<c-,>\1\0\1\texpr\2\0\n<c-;>\1\0\1\texpr\2\0\n<C-g>\6i\bset\vkeymap\20codeium_enabled\23codeium_no_map_tab\6g\bvim\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  ["lsp-zero.nvim"] = {
    config = { "\27LJ\2\n÷\3\0\0\17\0\20\0>6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0025\1\6\0005\2\5\0=\2\a\1=\1\4\0006\1\0\0009\1\1\0019\1\b\1)\3\0\0'\4\t\0\18\5\0\0B\1\4\0026\2\n\0\f\4\1\0X\4\1Ä4\4\0\0B\2\2\4H\5\31Ä6\a\n\0009\t\v\6\14\0\t\0X\n\1Ä4\t\0\0B\a\2\4H\n\22Ä9\f\f\v\15\0\f\0X\r\19Ä6\f\0\0009\f\1\f9\f\r\f\18\14\5\0B\f\2\2\14\0\f\0X\r\1Ä4\f\0\0009\f\14\f\14\0\f\0X\r\1Ä'\f\15\0006\r\0\0009\r\1\r9\r\2\r9\r\16\r9\15\f\v\18\16\f\0B\r\3\1F\n\3\3R\nË\127F\5\3\3R\5ﬂ\1276\2\0\0009\2\1\0029\2\17\0029\2\18\0025\4\19\0B\2\2\1K\0\1\0\1\0\1\nasync\1\vformat\bbuf\25apply_workspace_edit\vutf-16\20offset_encoding\21get_client_by_id\tedit\vresult\npairs\28textDocument/codeAction\21buf_request_sync\tonly\1\0\0\1\2\0\0\27source.organizeImports\fcontext\22make_range_params\tutil\blsp\bvim7\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\16declaration\bbuf\blsp\bvim6\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\15definition\bbuf\blsp\bvim1\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\nhover\bbuf\blsp\bvim<\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\21workspace_symbol\bbuf\blsp\bvim5\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\15open_float\15diagnostic\bvim4\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\14goto_next\15diagnostic\bvim4\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\14goto_prev\15diagnostic\bvim7\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\16code_action\bbuf\blsp\bvim6\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\15references\bbuf\blsp\bvim2\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\vrename\bbuf\blsp\bvim:\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\19signature_help\bbuf\blsp\bvimÒ\3\1\2\t\0\29\0[5\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0003\a\a\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\b\0003\a\t\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0003\a\v\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\f\0003\a\r\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\14\0003\a\15\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\16\0003\a\17\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\18\0003\a\19\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\20\0003\a\21\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\22\0003\a\23\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\24\0003\a\25\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\26\0'\6\27\0003\a\28\0\18\b\2\0B\3\5\1K\0\1\0\0\n<C-h>\6i\0\16<leader>vrn\0\16<leader>vrr\0\16<leader>vca\0\a]d\0\a[d\0\15<leader>vd\0\16<leader>vws\0\6K\0\agd\0\agD\6n\bset\vkeymap\bvim\vbuffer\1\0\1\nremap\1ç\b\1\0\n\0006\0[6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0029\1\3\0005\3\4\0B\1\2\0016\1\0\0'\3\5\0B\1\2\0029\2\6\0019\2\a\0025\4\f\0005\5\v\0005\6\t\0005\a\b\0=\a\n\6=\6\6\5=\5\r\4B\2\2\0016\2\14\0009\2\15\0029\2\16\2'\4\17\0+\5\2\0B\2\3\0013\2\18\0007\2\19\0009\2\20\0B\2\1\0016\2\0\0'\4\21\0B\2\2\0029\3\a\0025\5\22\0004\6\0\0=\6\23\5B\3\2\0015\3\26\0009\4\24\0029\4\25\4=\4\27\0039\4\28\0009\4\29\0045\6 \0009\a\30\0029\a\31\a\18\t\3\0B\a\2\2=\a!\0069\a\30\0029\a\"\a\18\t\3\0B\a\2\2=\a#\0069\a\30\0029\a$\a5\t%\0B\a\2\2=\a&\0069\a\30\0029\a'\aB\a\1\2=\a(\6B\4\2\2+\5\0\0=\5)\4+\5\0\0=\5*\0049\5+\0005\a,\0=\4\30\aB\5\2\0019\5-\0005\a.\0005\b/\0=\b0\aB\5\2\0019\0051\0003\a2\0B\5\2\0019\5\a\0B\5\1\0016\5\14\0009\0053\0059\0054\0055\a5\0B\5\2\1K\0\1\0\1\0\1\17virtual_text\2\vconfig\15diagnostic\0\14on_attach\15sign_icons\1\0\4\thint\6H\twarn\6W\tinfo\6I\nerror\6E\1\0\1\24suggest_lsp_servers\1\20set_preferences\1\0\0\19setup_nvim_cmp\f<S-Tab>\n<Tab>\14<C-Space>\rcomplete\n<C-y>\1\0\1\vselect\2\fconfirm\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\17cmp_mappings\rdefaults\rbehavior\1\0\0\vSelect\19SelectBehavior\15completion\1\0\0\bcmp\19nvim_workspace\17FormatOnSave\0Ñ\1        augroup FormatAutocmd\n        autocmd!\n        autocmd BufWritePre *.go lua FormatOnSave()\n        augroup END\n        \14nvim_exec\bapi\bvim\rsettings\1\0\0\1\0\0\ranalyses\1\0\2\fgofumpt\2\16staticcheck\2\1\0\1\17unusedparams\2\nsetup\ngopls\14lspconfig\1\4\0\0\fpyright\vlua_ls\ngopls\21ensure_installed\vpreset\rlsp-zero\frequire\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÖ\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\2\17sync_install\1\17auto_install\2\1\r\0\0\vpython\6c\blua\bvim\vvimdoc\tbash\nquery\15javascript\thtml\bcss\tyaml\bsql\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["obsidian.nvim"] = {
    config = { "\27LJ\2\nÜ\1\0\1\r\0\6\0\24'\1\0\0\n\0\0\0X\2\5Ä\18\4\0\0009\2\1\0B\2\2\2\18\1\2\0X\2\15Ä)\2\1\0)\3\4\0)\4\1\0M\2\vÄ\18\6\1\0006\a\2\0009\a\3\a6\t\4\0009\t\5\t)\vA\0)\fZ\0B\t\3\0A\a\0\2&\1\a\6O\2ı\127L\1\2\0\vrandom\tmath\tchar\vstring\nlower\5@\0\1\4\0\4\0\a6\1\0\0009\1\1\0019\1\2\0015\3\3\0>\0\2\3B\1\2\1K\0\1\0\1\2\0\0\rxdg-open\rjobstart\afn\bvimD\0\0\3\0\4\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0D\0\1\0\19gf_passthrough\tutil\robsidian\frequireE\0\0\3\0\4\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0D\0\1\0\20toggle_checkbox\tutil\robsidian\frequire»\b\1\0\6\0:\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0023\3\6\0=\3\a\0025\3\r\0005\4\t\0003\5\b\0=\5\n\0045\5\v\0=\5\f\4=\4\14\0035\4\16\0003\5\15\0=\5\n\0045\5\17\0=\5\f\4=\4\18\3=\3\19\0025\3\20\0005\4\22\0005\5\21\0=\5\23\0045\5\24\0=\5\25\4=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0035\4\31\0=\4 \0035\4!\0=\4\"\0035\4#\0=\4$\0035\4&\0005\5%\0=\5'\0045\5(\0=\5)\0045\5*\0=\5+\0045\5,\0=\5-\0045\5.\0=\5/\0045\0050\0=\0051\0045\0052\0=\0053\0045\0054\0=\0055\0045\0056\0=\0057\4=\0048\3=\0039\2B\0\2\1K\0\1\0\aui\14hl_groups\26ObsidianHighlightText\1\0\1\abg\f#75662e\16ObsidianTag\1\0\2\afg\f#89ddff\vitalic\2\24ObsidianExtLinkIcon\1\0\1\afg\f#c792ea\20ObsidianRefText\1\0\2\afg\f#c792ea\14underline\2\19ObsidianBullet\1\0\2\afg\f#89ddff\tbold\2\18ObsidianTilde\1\0\2\afg\f#ff5370\tbold\2\23ObsidianRightArrow\1\0\2\afg\f#f78c6c\tbold\2\17ObsidianDone\1\0\2\afg\f#89ddff\tbold\2\17ObsidianTodo\1\0\0\1\0\2\afg\f#f78c6c\tbold\2\ttags\1\0\1\rhl_group\16ObsidianTag\19highlight_text\1\0\1\rhl_group\26ObsidianHighlightText\19reference_text\1\0\1\rhl_group\20ObsidianRefText\23external_link_icon\1\0\2\tchar\bÔÇé\rhl_group\24ObsidianExtLinkIcon\fbullets\1\0\2\tchar\b‚Ä¢\rhl_group\19ObsidianBullet\15checkboxes\6x\1\0\2\tchar\b‚úî\rhl_group\17ObsidianDone\6 \1\0\0\1\0\2\tchar\b‚òê\rhl_group\17ObsidianTodo\1\0\2\20update_debounce\3»\1\venable\2\rmappings\15<leader>ch\1\0\1\vbuffer\2\1\0\0\0\agd\1\0\0\topts\1\0\3\fnoremap\1\vbuffer\2\texpr\2\vaction\1\0\0\0\20follow_url_func\0\17note_id_func\1\0\1\bdir\21~/obsidian-vault\0\nsetup\robsidian\frequire\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/obsidian.nvim",
    url = "https://github.com/epwalsh/obsidian.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nh\0\0\6\1\a\0\v-\0\0\0009\0\0\0005\2\5\0006\3\1\0009\3\2\0039\3\3\3'\5\4\0B\3\2\2=\3\6\2B\0\2\1K\0\1\0\0¿\vsearch\1\0\0\20Grep in files> \ninput\afn\bvim\16grep_stringÒ\2\1\0\a\0\18\00046\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\b\0009\5\t\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\n\0009\5\v\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0009\5\r\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\14\0009\5\15\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\16\0003\5\17\0B\1\4\0012\0\0ÄK\0\1\0\0\15<leader>ps\14git_files\n<C-p>\14help_tags\15<leader>fh\fbuffers\15<leader>fb\14live_grep\15<leader>fg\15find_files\15<leader>ff\6n\bset\vkeymap\bvim\22telescope.builtin\frequire\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\0\2\0D\0\1\0\nsetup\ttmux\frequire\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "https://github.com/aserowy/tmux.nvim"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    config = { "\27LJ\2\nî\2\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\1K\0\1\0‚\1            augroup MyAutoCmdGroup\n            autocmd!\n            autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })\n            augroup END\n            \14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion",
    url = "https://github.com/kristijanhusak/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÖ\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\2\17sync_install\1\17auto_install\2\1\r\0\0\vpython\6c\blua\bvim\vvimdoc\tbash\nquery\15javascript\thtml\bcss\tyaml\bsql\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\0\2\0D\0\1\0\nsetup\ttmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\nÇ\2\0\0\5\0\14\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0B\0\2\1K\0\1\0\21catppuccin-mocha\16colorscheme\bcmd\bvim\20color_overrides\nmocha\1\0\0\1\0\3\ncrust\f#000000\tbase\f#000000\vmantle\f#000000\17integrations\1\0\0\1\0\3\15treesitter\2\14telescope\2\bcmp\2\nsetup\15catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: lsp-zero.nvim
time([[Config for lsp-zero.nvim]], true)
try_loadstring("\27LJ\2\n÷\3\0\0\17\0\20\0>6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0025\1\6\0005\2\5\0=\2\a\1=\1\4\0006\1\0\0009\1\1\0019\1\b\1)\3\0\0'\4\t\0\18\5\0\0B\1\4\0026\2\n\0\f\4\1\0X\4\1Ä4\4\0\0B\2\2\4H\5\31Ä6\a\n\0009\t\v\6\14\0\t\0X\n\1Ä4\t\0\0B\a\2\4H\n\22Ä9\f\f\v\15\0\f\0X\r\19Ä6\f\0\0009\f\1\f9\f\r\f\18\14\5\0B\f\2\2\14\0\f\0X\r\1Ä4\f\0\0009\f\14\f\14\0\f\0X\r\1Ä'\f\15\0006\r\0\0009\r\1\r9\r\2\r9\r\16\r9\15\f\v\18\16\f\0B\r\3\1F\n\3\3R\nË\127F\5\3\3R\5ﬂ\1276\2\0\0009\2\1\0029\2\17\0029\2\18\0025\4\19\0B\2\2\1K\0\1\0\1\0\1\nasync\1\vformat\bbuf\25apply_workspace_edit\vutf-16\20offset_encoding\21get_client_by_id\tedit\vresult\npairs\28textDocument/codeAction\21buf_request_sync\tonly\1\0\0\1\2\0\0\27source.organizeImports\fcontext\22make_range_params\tutil\blsp\bvim7\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\16declaration\bbuf\blsp\bvim6\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\15definition\bbuf\blsp\bvim1\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\nhover\bbuf\blsp\bvim<\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\21workspace_symbol\bbuf\blsp\bvim5\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\15open_float\15diagnostic\bvim4\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\14goto_next\15diagnostic\bvim4\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\14goto_prev\15diagnostic\bvim7\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\16code_action\bbuf\blsp\bvim6\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\15references\bbuf\blsp\bvim2\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\vrename\bbuf\blsp\bvim:\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\19signature_help\bbuf\blsp\bvimÒ\3\1\2\t\0\29\0[5\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0003\a\a\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\b\0003\a\t\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0003\a\v\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\f\0003\a\r\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\14\0003\a\15\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\16\0003\a\17\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\18\0003\a\19\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\20\0003\a\21\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\22\0003\a\23\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\24\0003\a\25\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\26\0'\6\27\0003\a\28\0\18\b\2\0B\3\5\1K\0\1\0\0\n<C-h>\6i\0\16<leader>vrn\0\16<leader>vrr\0\16<leader>vca\0\a]d\0\a[d\0\15<leader>vd\0\16<leader>vws\0\6K\0\agd\0\agD\6n\bset\vkeymap\bvim\vbuffer\1\0\1\nremap\1ç\b\1\0\n\0006\0[6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0029\1\3\0005\3\4\0B\1\2\0016\1\0\0'\3\5\0B\1\2\0029\2\6\0019\2\a\0025\4\f\0005\5\v\0005\6\t\0005\a\b\0=\a\n\6=\6\6\5=\5\r\4B\2\2\0016\2\14\0009\2\15\0029\2\16\2'\4\17\0+\5\2\0B\2\3\0013\2\18\0007\2\19\0009\2\20\0B\2\1\0016\2\0\0'\4\21\0B\2\2\0029\3\a\0025\5\22\0004\6\0\0=\6\23\5B\3\2\0015\3\26\0009\4\24\0029\4\25\4=\4\27\0039\4\28\0009\4\29\0045\6 \0009\a\30\0029\a\31\a\18\t\3\0B\a\2\2=\a!\0069\a\30\0029\a\"\a\18\t\3\0B\a\2\2=\a#\0069\a\30\0029\a$\a5\t%\0B\a\2\2=\a&\0069\a\30\0029\a'\aB\a\1\2=\a(\6B\4\2\2+\5\0\0=\5)\4+\5\0\0=\5*\0049\5+\0005\a,\0=\4\30\aB\5\2\0019\5-\0005\a.\0005\b/\0=\b0\aB\5\2\0019\0051\0003\a2\0B\5\2\0019\5\a\0B\5\1\0016\5\14\0009\0053\0059\0054\0055\a5\0B\5\2\1K\0\1\0\1\0\1\17virtual_text\2\vconfig\15diagnostic\0\14on_attach\15sign_icons\1\0\4\thint\6H\twarn\6W\tinfo\6I\nerror\6E\1\0\1\24suggest_lsp_servers\1\20set_preferences\1\0\0\19setup_nvim_cmp\f<S-Tab>\n<Tab>\14<C-Space>\rcomplete\n<C-y>\1\0\1\vselect\2\fconfirm\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\17cmp_mappings\rdefaults\rbehavior\1\0\0\vSelect\19SelectBehavior\15completion\1\0\0\bcmp\19nvim_workspace\17FormatOnSave\0Ñ\1        augroup FormatAutocmd\n        autocmd!\n        autocmd BufWritePre *.go lua FormatOnSave()\n        augroup END\n        \14nvim_exec\bapi\bvim\rsettings\1\0\0\1\0\0\ranalyses\1\0\2\fgofumpt\2\16staticcheck\2\1\0\1\17unusedparams\2\nsetup\ngopls\14lspconfig\1\4\0\0\fpyright\vlua_ls\ngopls\21ensure_installed\vpreset\rlsp-zero\frequire\0", "config", "lsp-zero.nvim")
time([[Config for lsp-zero.nvim]], false)
-- Config for: codeium.vim
time([[Config for codeium.vim]], true)
try_loadstring("\27LJ\2\n-\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19codeium#Accept\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2\1\0D\0\2\0\29codeium#CycleCompletions\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2ˇˇD\0\2\0\29codeium#CycleCompletions\afn\bvim,\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\18codeium#Clear\afn\bvim°\2\1\0\6\0\19\0)6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0003\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0003\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0003\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0003\4\17\0005\5\18\0B\0\5\1K\0\1\0\1\0\1\texpr\2\0\n<c-x>\1\0\1\texpr\2\0\n<c-,>\1\0\1\texpr\2\0\n<c-;>\1\0\1\texpr\2\0\n<C-g>\6i\bset\vkeymap\20codeium_enabled\23codeium_no_map_tab\6g\bvim\0", "config", "codeium.vim")
time([[Config for codeium.vim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nh\0\0\6\1\a\0\v-\0\0\0009\0\0\0005\2\5\0006\3\1\0009\3\2\0039\3\3\3'\5\4\0B\3\2\2=\3\6\2B\0\2\1K\0\1\0\0¿\vsearch\1\0\0\20Grep in files> \ninput\afn\bvim\16grep_stringÒ\2\1\0\a\0\18\00046\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\b\0009\5\t\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\n\0009\5\v\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0009\5\r\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\14\0009\5\15\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\16\0003\5\17\0B\1\4\0012\0\0ÄK\0\1\0\0\15<leader>ps\14git_files\n<C-p>\14help_tags\15<leader>fh\fbuffers\15<leader>fb\14live_grep\15<leader>fg\15find_files\15<leader>ff\6n\bset\vkeymap\bvim\22telescope.builtin\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: obsidian.nvim
time([[Config for obsidian.nvim]], true)
try_loadstring("\27LJ\2\nÜ\1\0\1\r\0\6\0\24'\1\0\0\n\0\0\0X\2\5Ä\18\4\0\0009\2\1\0B\2\2\2\18\1\2\0X\2\15Ä)\2\1\0)\3\4\0)\4\1\0M\2\vÄ\18\6\1\0006\a\2\0009\a\3\a6\t\4\0009\t\5\t)\vA\0)\fZ\0B\t\3\0A\a\0\2&\1\a\6O\2ı\127L\1\2\0\vrandom\tmath\tchar\vstring\nlower\5@\0\1\4\0\4\0\a6\1\0\0009\1\1\0019\1\2\0015\3\3\0>\0\2\3B\1\2\1K\0\1\0\1\2\0\0\rxdg-open\rjobstart\afn\bvimD\0\0\3\0\4\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0D\0\1\0\19gf_passthrough\tutil\robsidian\frequireE\0\0\3\0\4\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0D\0\1\0\20toggle_checkbox\tutil\robsidian\frequire»\b\1\0\6\0:\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0023\3\6\0=\3\a\0025\3\r\0005\4\t\0003\5\b\0=\5\n\0045\5\v\0=\5\f\4=\4\14\0035\4\16\0003\5\15\0=\5\n\0045\5\17\0=\5\f\4=\4\18\3=\3\19\0025\3\20\0005\4\22\0005\5\21\0=\5\23\0045\5\24\0=\5\25\4=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0035\4\31\0=\4 \0035\4!\0=\4\"\0035\4#\0=\4$\0035\4&\0005\5%\0=\5'\0045\5(\0=\5)\0045\5*\0=\5+\0045\5,\0=\5-\0045\5.\0=\5/\0045\0050\0=\0051\0045\0052\0=\0053\0045\0054\0=\0055\0045\0056\0=\0057\4=\0048\3=\0039\2B\0\2\1K\0\1\0\aui\14hl_groups\26ObsidianHighlightText\1\0\1\abg\f#75662e\16ObsidianTag\1\0\2\afg\f#89ddff\vitalic\2\24ObsidianExtLinkIcon\1\0\1\afg\f#c792ea\20ObsidianRefText\1\0\2\afg\f#c792ea\14underline\2\19ObsidianBullet\1\0\2\afg\f#89ddff\tbold\2\18ObsidianTilde\1\0\2\afg\f#ff5370\tbold\2\23ObsidianRightArrow\1\0\2\afg\f#f78c6c\tbold\2\17ObsidianDone\1\0\2\afg\f#89ddff\tbold\2\17ObsidianTodo\1\0\0\1\0\2\afg\f#f78c6c\tbold\2\ttags\1\0\1\rhl_group\16ObsidianTag\19highlight_text\1\0\1\rhl_group\26ObsidianHighlightText\19reference_text\1\0\1\rhl_group\20ObsidianRefText\23external_link_icon\1\0\2\tchar\bÔÇé\rhl_group\24ObsidianExtLinkIcon\fbullets\1\0\2\tchar\b‚Ä¢\rhl_group\19ObsidianBullet\15checkboxes\6x\1\0\2\tchar\b‚úî\rhl_group\17ObsidianDone\6 \1\0\0\1\0\2\tchar\b‚òê\rhl_group\17ObsidianTodo\1\0\2\20update_debounce\3»\1\venable\2\rmappings\15<leader>ch\1\0\1\vbuffer\2\1\0\0\0\agd\1\0\0\topts\1\0\3\fnoremap\1\vbuffer\2\texpr\2\vaction\1\0\0\0\20follow_url_func\0\17note_id_func\1\0\1\bdir\21~/obsidian-vault\0\nsetup\robsidian\frequire\0", "config", "obsidian.nvim")
time([[Config for obsidian.nvim]], false)
-- Config for: vim-dadbod-completion
time([[Config for vim-dadbod-completion]], true)
try_loadstring("\27LJ\2\nî\2\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\1K\0\1\0‚\1            augroup MyAutoCmdGroup\n            autocmd!\n            autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })\n            augroup END\n            \14nvim_exec\bapi\bvim\0", "config", "vim-dadbod-completion")
time([[Config for vim-dadbod-completion]], false)

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
