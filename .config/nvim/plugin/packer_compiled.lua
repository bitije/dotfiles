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
local package_path_str = "/home/w/.cache/nvim/packer_hererocks/2.1.1727870382/share/lua/5.1/?.lua;/home/w/.cache/nvim/packer_hererocks/2.1.1727870382/share/lua/5.1/?/init.lua;/home/w/.cache/nvim/packer_hererocks/2.1.1727870382/lib/luarocks/rocks-5.1/?.lua;/home/w/.cache/nvim/packer_hererocks/2.1.1727870382/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/w/.cache/nvim/packer_hererocks/2.1.1727870382/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\n®\2\0\0\5\0\14\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0B\0\2\1K\0\1\0\21catppuccin-mocha\16colorscheme\bcmd\bvim\20color_overrides\nmocha\1\0\1\nmocha\0\1\0\3\ncrust\f#000000\vmantle\f#000000\tbase\f#000000\17integrations\1\0\2\17integrations\0\20color_overrides\0\1\0\3\bcmp\2\15treesitter\2\14telescope\2\nsetup\15catppuccin\frequire\0" },
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
    config = { "\27LJ\2\nd\0\2\b\0\5\0\v\14\0\1\0X\2\1Ä4\1\0\0005\2\0\0=\0\1\0026\3\2\0009\3\3\3'\5\4\0\18\6\2\0\18\a\1\0D\3\4\0\nforce\15tbl_extend\bvim\tdesc\1\0\3\tdesc\0\texpr\2\vsilent\2Ä\1\0\0\3\0\4\0\0056\0\0\0009\0\1\0009\0\2\0'\2\3\0D\0\2\0Wb:_codeium_completions.items[b:_codeium_completions.index].completionParts[0].text\14nvim_eval\bapi\bvimø\1\1\0\b\3\a\0\"6\0\0\0003\2\1\0B\0\2\3\15\0\0\0X\2\4Ä\15\0\1\0X\2\2Ä\a\1\2\0X\2\tÄ6\2\3\0009\2\4\0029\2\5\2-\4\0\0+\5\2\0+\6\2\0+\a\2\0002\0\0ÄD\2\5\0-\2\1\0\n\2\0\0X\2\aÄ6\2\3\0009\2\6\2-\3\2\0008\2\3\2-\4\1\0002\0\0ÄD\2\2\0006\2\3\0009\2\6\2-\3\2\0008\2\3\0022\0\0ÄD\2\1\0\1¿\5¿\2¿\afn\27nvim_replace_termcodes\bapi\bvim\5\0\npcallU\1\6\f\1\4\0\15-\6\0\0\18\b\3\0\18\t\4\0B\6\3\2\18\4\6\0006\6\0\0009\6\1\0069\6\2\6\18\b\0\0\18\t\1\0003\n\3\0\18\v\4\0B\6\5\0012\0\0ÄK\0\1\0\0¿\0\bset\vkeymap\bvim \3\1\0\n\0\19\0,6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0003\0\5\0003\1\6\0\18\2\1\0'\4\a\0'\5\b\0'\6\t\0'\a\n\0B\2\5\1\18\2\1\0'\4\a\0'\5\v\0'\6\f\0'\a\r\0B\2\5\1\18\2\1\0'\4\a\0'\5\14\0'\6\15\0'\a\16\0004\b\0\0)\t\1\0B\2\a\1\18\2\1\0'\4\a\0'\5\17\0'\6\15\0'\a\18\0004\b\0\0)\tˇˇB\2\a\0012\0\0ÄK\0\1\0(Codeium Cycle completions backwards\n<A-k>'Codeium Cycle completions forwards\29codeium#CycleCompletions\n<A-j>\31Codeium Trigger suggestion\21codeium#Complete\n<C-r>\30Codeium Accept suggestion\19codeium#Accept\n<C-g>\6i\0\0\29codeium_disable_bindings\20codeium_enabled\23codeium_no_map_tab\6g\bvim\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  ["lsp-zero.nvim"] = {
    config = { "\27LJ\2\n‹\3\0\0\17\0\20\0>6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0025\1\6\0005\2\5\0=\2\a\1=\1\4\0006\1\0\0009\1\1\0019\1\b\1)\3\0\0'\4\t\0\18\5\0\0B\1\4\0026\2\n\0\f\4\1\0X\4\1Ä4\4\0\0B\2\2\4H\5\31Ä6\a\n\0009\t\v\6\14\0\t\0X\n\1Ä4\t\0\0B\a\2\4H\n\22Ä9\f\f\v\15\0\f\0X\r\19Ä6\f\0\0009\f\1\f9\f\r\f\18\14\5\0B\f\2\2\14\0\f\0X\r\1Ä4\f\0\0009\f\14\f\14\0\f\0X\r\1Ä'\f\15\0006\r\0\0009\r\1\r9\r\2\r9\r\16\r9\15\f\v\18\16\f\0B\r\3\1F\n\3\3R\nË\127F\5\3\3R\5ﬂ\1276\2\0\0009\2\1\0029\2\17\0029\2\18\0025\4\19\0B\2\2\1K\0\1\0\1\0\1\nasync\1\vformat\bbuf\25apply_workspace_edit\vutf-16\20offset_encoding\21get_client_by_id\tedit\vresult\npairs\28textDocument/codeAction\21buf_request_sync\tonly\1\0\1\tonly\0\1\2\0\0\27source.organizeImports\fcontext\22make_range_params\tutil\blsp\bvim7\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\16declaration\bbuf\blsp\bvim6\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\15definition\bbuf\blsp\bvim1\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\nhover\bbuf\blsp\bvim<\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\21workspace_symbol\bbuf\blsp\bvim5\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\15open_float\15diagnostic\bvim7\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\16code_action\bbuf\blsp\bvim6\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\15references\bbuf\blsp\bvim2\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\vrename\bbuf\blsp\bvim:\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\19signature_help\bbuf\blsp\bvim5\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\15setloclist\15diagnostic\bvim5\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\15open_float\15diagnostic\bvim4\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\14goto_next\15diagnostic\bvim4\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\14goto_prev\15diagnostic\bvimœ\4\1\2\t\0!\0k5\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0003\a\a\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\b\0003\a\t\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0003\a\v\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\f\0003\a\r\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\14\0003\a\15\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\16\0003\a\17\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\18\0003\a\19\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\20\0003\a\21\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\22\0'\6\23\0003\a\24\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\25\0003\a\26\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\27\0003\a\28\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\29\0003\a\30\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\31\0003\a \0\18\b\2\0B\3\5\1K\0\1\0\0\a]d\0\a[d\0\14<leader>i\0\14<leader>q\0\n<C-f>\6i\0\16<leader>vrn\0\16<leader>vrr\0\16<leader>vca\0\15<leader>vd\0\16<leader>vws\0\6K\0\agd\0\agD\6n\bset\vkeymap\bvim\vbuffer\1\0\2\vbuffer\0\nremap\1Ì\t\1\0\v\0003\1d6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0014\3\0\0B\1\2\0016\1\0\0'\3\4\0B\1\2\0029\2\3\0015\4\6\0005\5\5\0=\5\a\4B\2\2\0016\2\0\0'\4\b\0B\2\2\0029\3\3\0025\5\16\0004\6\3\0009\a\t\0029\a\n\a9\a\v\a9\a\f\a5\t\14\0005\n\r\0=\n\15\tB\a\2\0?\a\0\0=\6\17\5B\3\2\0016\3\0\0'\5\v\0B\3\2\0029\3\3\0035\5\18\0005\6\19\0=\6\15\5B\3\2\0016\3\0\0'\5\20\0B\3\2\0029\4\21\0039\4\3\0045\6\26\0005\a\25\0005\b\23\0005\t\22\0=\t\24\b=\b\21\a=\a\27\6B\4\2\0019\4\28\0039\4\3\0044\6\0\0B\4\2\0016\4\29\0009\4\30\0049\4\31\4'\6 \0+\a\2\0B\4\3\0013\4!\0007\4\"\0006\4\0\0'\6#\0B\4\2\0029\5\3\0045\a%\0004\b\3\0005\t$\0>\t\1\b=\b\17\a9\b&\0049\b'\b9\b(\b4\n\0\0B\b\2\2=\b&\a4\b\0\0=\b)\aB\5\2\0015\5,\0009\6*\0049\6+\6=\6-\0059\6.\0003\b/\0B\6\2\0019\6\3\0B\6\1\0016\6\29\0009\0060\0069\0061\0065\b2\0B\6\2\1K\0\1\0\1\0\1\17virtual_text\2\vconfig\15diagnostic\0\14on_attach\rbehavior\1\0\1\rbehavior\0\vSelect\19SelectBehavior\15completion\vinsert\vpreset\fmapping\1\0\3\15completion\0\fsources\0\fmapping\0\1\0\1\tname\rnvim_lsp\bcmp\17FormatOnSave\0] augroup FormatAutocmd autocmd! autocmd BufWritePre *.go lua FormatOnSave() augroup END \14nvim_exec\bapi\bvim\fpyright\rsettings\1\0\1\rsettings\0\1\0\1\ngopls\0\ranalyses\1\0\3\fgofumpt\2\16staticcheck\2\ranalyses\0\1\0\1\17unusedparams\2\ngopls\14lspconfig\1\v\0\0\bcss\15javascript\20javascriptreact\tjson\rmarkdown\tscss\15typescript\20typescriptreact\tyaml\nproto\1\0\2\14filetypes\0\bbin\14prettierd\fsources\1\0\1\fsources\0\14filetypes\1\0\1\14filetypes\0\1\v\0\0\bcss\15javascript\20javascriptreact\tjson\rmarkdown\tscss\15typescript\20typescriptreact\tyaml\nproto\twith\rprettier\15formatting\rbuiltins\fnull-ls\21ensure_installed\1\0\1\21ensure_installed\0\1\b\0\0\fpyright\rruff_lsp\truff\vlua_ls\ngopls\veslint\nbufls\20mason-lspconfig\nsetup\nmason\rlsp-zero\frequire\3ÄÄ¿ô\4\0" },
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
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n[\0\1\5\1\3\0\n-\1\0\0\18\3\1\0009\1\0\1B\1\2\0016\1\1\0'\3\2\0\18\4\0\0&\3\4\3B\1\2\1K\0\1\0\2Ä\"Delve exited with exit code: \nprint\ncloseL\0\0\4\2\2\0\6-\0\0\0005\2\0\0-\3\1\0=\3\1\2B\0\2\1K\0\1\0\0¿\4¿\tport\1\0\3\tport\0\thost\014127.0.0.1\ttype\vserver¨\1\1\2\f\0\v\1\24,\2\3\0*\4\0\0006\5\0\0009\5\1\0059\5\2\5'\a\3\0005\b\6\0005\t\4\0'\n\5\0\18\v\4\0&\n\v\n>\n\3\t=\t\a\b3\t\b\0B\5\4\3\18\3\6\0\18\2\5\0006\5\0\0009\5\t\0053\a\n\0)\bË\3B\5\3\0012\0\0ÄK\0\1\0\0\rdefer_fn\0\targs\1\0\1\targs\0\015127.0.0.1:\1\3\0\0\bdap\a-l\bdlv\nspawn\tloop\bvim“‹\4h\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\n/cmd/\vgetcwd\22Path to package: \ninput\afn\bvimÒ\5\1\0\b\0\30\0@6\0\0\0'\2\1\0B\0\2\0029\1\2\0003\2\4\0=\2\3\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0005\4\t\0B\1\3\0015\1\n\0009\2\v\0004\3\3\0005\4\f\0003\5\r\0=\5\14\4>\4\1\3=\3\3\0026\2\5\0009\2\15\0029\2\16\2'\4\17\0'\5\18\0'\6\19\0\18\a\1\0B\2\5\0016\2\5\0009\2\15\0029\2\16\2'\4\17\0'\5\20\0'\6\21\0\18\a\1\0B\2\5\0016\2\5\0009\2\15\0029\2\16\2'\4\17\0'\5\22\0'\6\23\0\18\a\1\0B\2\5\0016\2\5\0009\2\15\0029\2\16\2'\4\17\0'\5\24\0'\6\25\0\18\a\1\0B\2\5\0016\2\5\0009\2\15\0029\2\16\2'\4\17\0'\5\26\0'\6\27\0\18\a\1\0B\2\5\0019\2\28\0'\4\29\0B\2\2\1K\0\1\0\nTRACE\18set_log_level4<Cmd>lua require(\"dap\").toggle_breakpoint()<CR>\14<leader>b+<Cmd>lua require(\"dap\").step_out()<CR>\n<F12>,<Cmd>lua require(\"dap\").step_into()<CR>\n<F11>,<Cmd>lua require(\"dap\").step_over()<CR>\n<F10>+<Cmd>lua require(\"dap\").continue()<CR>\t<F5>\6n\20nvim_set_keymap\bapi\fprogram\0\1\0\4\tname#Debug with Interactive Package\frequest\vlaunch\fprogram\0\ttype\ago\19configurations\1\0\2\vsilent\2\fnoremap\2\1\0\4\vlinehl\5\ttext\tüõë\nnumhl\5\vtexthl\5\18DapBreakpoint\16sign_define\afn\bvim\0\ago\radapters\bdap\frequire\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-go"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vdap-go\frequire\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/nvim-dap-go",
    url = "https://github.com/leoluz/nvim-dap-go"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n\30\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\topen\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclose⁄\2\1\0\b\0\21\0!6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\1B\2\1\0019\2\4\0009\2\5\0029\2\6\0023\3\b\0=\3\a\0029\2\4\0009\2\t\0029\2\n\0023\3\v\0=\3\a\0029\2\4\0009\2\t\0029\2\f\0023\3\r\0=\3\a\0026\2\14\0009\2\15\0029\2\16\2'\4\17\0'\5\18\0'\6\19\0005\a\20\0B\2\5\0012\0\0ÄK\0\1\0\1\0\2\vsilent\2\fnoremap\2+<Cmd>lua require(\"dapui\").toggle()<CR>\15<leader>ui\6n\20nvim_set_keymap\bapi\bvim\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\nsetup\ndapui\bdap\frequire\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nù\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\4\17sync_install\1\21ensure_installed\0\17auto_install\2\14highlight\0\1\f\0\0\vpython\6c\blua\tbash\nquery\15javascript\thtml\bcss\tyaml\bsql\nproto\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
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
  ["prettier.nvim"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\no\0\0\6\1\6\0\v-\0\0\0009\0\0\0005\2\4\0006\3\1\0'\5\2\0B\3\2\0029\3\3\3B\3\1\2=\3\5\2B\0\2\1K\0\1\0\0¿\bcwd\1\0\1\bcwd\0\15buffer_dir\20telescope.utils\frequire\15find_fileso\0\0\4\1\4\0\a-\0\0\0009\0\0\0005\2\2\0005\3\1\0=\3\3\2B\0\2\1K\0\1\0\0¿\17find_command\1\0\1\17find_command\0\1\6\0\0\arg\f--files\r--hidden\a-g\n!.git\15find_files˛\1\1\0\a\0\14\0#6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0003\5\a\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\b\0003\5\t\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\n\0009\5\v\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0009\5\r\0004\6\0\0B\1\5\0012\0\0ÄK\0\1\0\fbuffers\15<leader>fb\14live_grep\15<leader>fg\0\15<leader>ff\0\15<leader>fd\6n\bset\vkeymap\bvim\22telescope.builtin\frequire\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ttmux\frequire\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "https://github.com/aserowy/tmux.nvim"
  },
  ["transparent.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16transparent\frequire\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/transparent.nvim",
    url = "https://github.com/xiyaowong/transparent.nvim"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion",
    url = "https://github.com/kristijanhusak/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-maximizer"] = {
    config = { "\27LJ\2\nx\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\25:MaximizerToggle<CR>\14<leader>z\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/w/.local/share/nvim/site/pack/packer/start/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: codeium.vim
time([[Config for codeium.vim]], true)
try_loadstring("\27LJ\2\nd\0\2\b\0\5\0\v\14\0\1\0X\2\1Ä4\1\0\0005\2\0\0=\0\1\0026\3\2\0009\3\3\3'\5\4\0\18\6\2\0\18\a\1\0D\3\4\0\nforce\15tbl_extend\bvim\tdesc\1\0\3\tdesc\0\texpr\2\vsilent\2Ä\1\0\0\3\0\4\0\0056\0\0\0009\0\1\0009\0\2\0'\2\3\0D\0\2\0Wb:_codeium_completions.items[b:_codeium_completions.index].completionParts[0].text\14nvim_eval\bapi\bvimø\1\1\0\b\3\a\0\"6\0\0\0003\2\1\0B\0\2\3\15\0\0\0X\2\4Ä\15\0\1\0X\2\2Ä\a\1\2\0X\2\tÄ6\2\3\0009\2\4\0029\2\5\2-\4\0\0+\5\2\0+\6\2\0+\a\2\0002\0\0ÄD\2\5\0-\2\1\0\n\2\0\0X\2\aÄ6\2\3\0009\2\6\2-\3\2\0008\2\3\2-\4\1\0002\0\0ÄD\2\2\0006\2\3\0009\2\6\2-\3\2\0008\2\3\0022\0\0ÄD\2\1\0\1¿\5¿\2¿\afn\27nvim_replace_termcodes\bapi\bvim\5\0\npcallU\1\6\f\1\4\0\15-\6\0\0\18\b\3\0\18\t\4\0B\6\3\2\18\4\6\0006\6\0\0009\6\1\0069\6\2\6\18\b\0\0\18\t\1\0003\n\3\0\18\v\4\0B\6\5\0012\0\0ÄK\0\1\0\0¿\0\bset\vkeymap\bvim \3\1\0\n\0\19\0,6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0003\0\5\0003\1\6\0\18\2\1\0'\4\a\0'\5\b\0'\6\t\0'\a\n\0B\2\5\1\18\2\1\0'\4\a\0'\5\v\0'\6\f\0'\a\r\0B\2\5\1\18\2\1\0'\4\a\0'\5\14\0'\6\15\0'\a\16\0004\b\0\0)\t\1\0B\2\a\1\18\2\1\0'\4\a\0'\5\17\0'\6\15\0'\a\18\0004\b\0\0)\tˇˇB\2\a\0012\0\0ÄK\0\1\0(Codeium Cycle completions backwards\n<A-k>'Codeium Cycle completions forwards\29codeium#CycleCompletions\n<A-j>\31Codeium Trigger suggestion\21codeium#Complete\n<C-r>\30Codeium Accept suggestion\19codeium#Accept\n<C-g>\6i\0\0\29codeium_disable_bindings\20codeium_enabled\23codeium_no_map_tab\6g\bvim\0", "config", "codeium.vim")
time([[Config for codeium.vim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n[\0\1\5\1\3\0\n-\1\0\0\18\3\1\0009\1\0\1B\1\2\0016\1\1\0'\3\2\0\18\4\0\0&\3\4\3B\1\2\1K\0\1\0\2Ä\"Delve exited with exit code: \nprint\ncloseL\0\0\4\2\2\0\6-\0\0\0005\2\0\0-\3\1\0=\3\1\2B\0\2\1K\0\1\0\0¿\4¿\tport\1\0\3\tport\0\thost\014127.0.0.1\ttype\vserver¨\1\1\2\f\0\v\1\24,\2\3\0*\4\0\0006\5\0\0009\5\1\0059\5\2\5'\a\3\0005\b\6\0005\t\4\0'\n\5\0\18\v\4\0&\n\v\n>\n\3\t=\t\a\b3\t\b\0B\5\4\3\18\3\6\0\18\2\5\0006\5\0\0009\5\t\0053\a\n\0)\bË\3B\5\3\0012\0\0ÄK\0\1\0\0\rdefer_fn\0\targs\1\0\1\targs\0\015127.0.0.1:\1\3\0\0\bdap\a-l\bdlv\nspawn\tloop\bvim“‹\4h\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\n/cmd/\vgetcwd\22Path to package: \ninput\afn\bvimÒ\5\1\0\b\0\30\0@6\0\0\0'\2\1\0B\0\2\0029\1\2\0003\2\4\0=\2\3\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0005\4\t\0B\1\3\0015\1\n\0009\2\v\0004\3\3\0005\4\f\0003\5\r\0=\5\14\4>\4\1\3=\3\3\0026\2\5\0009\2\15\0029\2\16\2'\4\17\0'\5\18\0'\6\19\0\18\a\1\0B\2\5\0016\2\5\0009\2\15\0029\2\16\2'\4\17\0'\5\20\0'\6\21\0\18\a\1\0B\2\5\0016\2\5\0009\2\15\0029\2\16\2'\4\17\0'\5\22\0'\6\23\0\18\a\1\0B\2\5\0016\2\5\0009\2\15\0029\2\16\2'\4\17\0'\5\24\0'\6\25\0\18\a\1\0B\2\5\0016\2\5\0009\2\15\0029\2\16\2'\4\17\0'\5\26\0'\6\27\0\18\a\1\0B\2\5\0019\2\28\0'\4\29\0B\2\2\1K\0\1\0\nTRACE\18set_log_level4<Cmd>lua require(\"dap\").toggle_breakpoint()<CR>\14<leader>b+<Cmd>lua require(\"dap\").step_out()<CR>\n<F12>,<Cmd>lua require(\"dap\").step_into()<CR>\n<F11>,<Cmd>lua require(\"dap\").step_over()<CR>\n<F10>+<Cmd>lua require(\"dap\").continue()<CR>\t<F5>\6n\20nvim_set_keymap\bapi\fprogram\0\1\0\4\tname#Debug with Interactive Package\frequest\vlaunch\fprogram\0\ttype\ago\19configurations\1\0\2\vsilent\2\fnoremap\2\1\0\4\vlinehl\5\ttext\tüõë\nnumhl\5\vtexthl\5\18DapBreakpoint\16sign_define\afn\bvim\0\ago\radapters\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n®\2\0\0\5\0\14\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0B\0\2\1K\0\1\0\21catppuccin-mocha\16colorscheme\bcmd\bvim\20color_overrides\nmocha\1\0\1\nmocha\0\1\0\3\ncrust\f#000000\vmantle\f#000000\tbase\f#000000\17integrations\1\0\2\17integrations\0\20color_overrides\0\1\0\3\bcmp\2\15treesitter\2\14telescope\2\nsetup\15catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: nvim-dap-go
time([[Config for nvim-dap-go]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vdap-go\frequire\0", "config", "nvim-dap-go")
time([[Config for nvim-dap-go]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nù\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\4\17sync_install\1\21ensure_installed\0\17auto_install\2\14highlight\0\1\f\0\0\vpython\6c\blua\tbash\nquery\15javascript\thtml\bcss\tyaml\bsql\nproto\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vim-maximizer
time([[Config for vim-maximizer]], true)
try_loadstring("\27LJ\2\nx\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\25:MaximizerToggle<CR>\14<leader>z\6n\20nvim_set_keymap\bapi\bvim\0", "config", "vim-maximizer")
time([[Config for vim-maximizer]], false)
-- Config for: lsp-zero.nvim
time([[Config for lsp-zero.nvim]], true)
try_loadstring("\27LJ\2\n‹\3\0\0\17\0\20\0>6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0025\1\6\0005\2\5\0=\2\a\1=\1\4\0006\1\0\0009\1\1\0019\1\b\1)\3\0\0'\4\t\0\18\5\0\0B\1\4\0026\2\n\0\f\4\1\0X\4\1Ä4\4\0\0B\2\2\4H\5\31Ä6\a\n\0009\t\v\6\14\0\t\0X\n\1Ä4\t\0\0B\a\2\4H\n\22Ä9\f\f\v\15\0\f\0X\r\19Ä6\f\0\0009\f\1\f9\f\r\f\18\14\5\0B\f\2\2\14\0\f\0X\r\1Ä4\f\0\0009\f\14\f\14\0\f\0X\r\1Ä'\f\15\0006\r\0\0009\r\1\r9\r\2\r9\r\16\r9\15\f\v\18\16\f\0B\r\3\1F\n\3\3R\nË\127F\5\3\3R\5ﬂ\1276\2\0\0009\2\1\0029\2\17\0029\2\18\0025\4\19\0B\2\2\1K\0\1\0\1\0\1\nasync\1\vformat\bbuf\25apply_workspace_edit\vutf-16\20offset_encoding\21get_client_by_id\tedit\vresult\npairs\28textDocument/codeAction\21buf_request_sync\tonly\1\0\1\tonly\0\1\2\0\0\27source.organizeImports\fcontext\22make_range_params\tutil\blsp\bvim7\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\16declaration\bbuf\blsp\bvim6\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\15definition\bbuf\blsp\bvim1\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\nhover\bbuf\blsp\bvim<\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\21workspace_symbol\bbuf\blsp\bvim5\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\15open_float\15diagnostic\bvim7\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\16code_action\bbuf\blsp\bvim6\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\15references\bbuf\blsp\bvim2\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\vrename\bbuf\blsp\bvim:\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\19signature_help\bbuf\blsp\bvim5\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\15setloclist\15diagnostic\bvim5\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\15open_float\15diagnostic\bvim4\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\14goto_next\15diagnostic\bvim4\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\14goto_prev\15diagnostic\bvimœ\4\1\2\t\0!\0k5\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0003\a\a\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\b\0003\a\t\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0003\a\v\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\f\0003\a\r\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\14\0003\a\15\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\16\0003\a\17\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\18\0003\a\19\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\20\0003\a\21\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\22\0'\6\23\0003\a\24\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\25\0003\a\26\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\27\0003\a\28\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\29\0003\a\30\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\31\0003\a \0\18\b\2\0B\3\5\1K\0\1\0\0\a]d\0\a[d\0\14<leader>i\0\14<leader>q\0\n<C-f>\6i\0\16<leader>vrn\0\16<leader>vrr\0\16<leader>vca\0\15<leader>vd\0\16<leader>vws\0\6K\0\agd\0\agD\6n\bset\vkeymap\bvim\vbuffer\1\0\2\vbuffer\0\nremap\1Ì\t\1\0\v\0003\1d6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0014\3\0\0B\1\2\0016\1\0\0'\3\4\0B\1\2\0029\2\3\0015\4\6\0005\5\5\0=\5\a\4B\2\2\0016\2\0\0'\4\b\0B\2\2\0029\3\3\0025\5\16\0004\6\3\0009\a\t\0029\a\n\a9\a\v\a9\a\f\a5\t\14\0005\n\r\0=\n\15\tB\a\2\0?\a\0\0=\6\17\5B\3\2\0016\3\0\0'\5\v\0B\3\2\0029\3\3\0035\5\18\0005\6\19\0=\6\15\5B\3\2\0016\3\0\0'\5\20\0B\3\2\0029\4\21\0039\4\3\0045\6\26\0005\a\25\0005\b\23\0005\t\22\0=\t\24\b=\b\21\a=\a\27\6B\4\2\0019\4\28\0039\4\3\0044\6\0\0B\4\2\0016\4\29\0009\4\30\0049\4\31\4'\6 \0+\a\2\0B\4\3\0013\4!\0007\4\"\0006\4\0\0'\6#\0B\4\2\0029\5\3\0045\a%\0004\b\3\0005\t$\0>\t\1\b=\b\17\a9\b&\0049\b'\b9\b(\b4\n\0\0B\b\2\2=\b&\a4\b\0\0=\b)\aB\5\2\0015\5,\0009\6*\0049\6+\6=\6-\0059\6.\0003\b/\0B\6\2\0019\6\3\0B\6\1\0016\6\29\0009\0060\0069\0061\0065\b2\0B\6\2\1K\0\1\0\1\0\1\17virtual_text\2\vconfig\15diagnostic\0\14on_attach\rbehavior\1\0\1\rbehavior\0\vSelect\19SelectBehavior\15completion\vinsert\vpreset\fmapping\1\0\3\15completion\0\fsources\0\fmapping\0\1\0\1\tname\rnvim_lsp\bcmp\17FormatOnSave\0] augroup FormatAutocmd autocmd! autocmd BufWritePre *.go lua FormatOnSave() augroup END \14nvim_exec\bapi\bvim\fpyright\rsettings\1\0\1\rsettings\0\1\0\1\ngopls\0\ranalyses\1\0\3\fgofumpt\2\16staticcheck\2\ranalyses\0\1\0\1\17unusedparams\2\ngopls\14lspconfig\1\v\0\0\bcss\15javascript\20javascriptreact\tjson\rmarkdown\tscss\15typescript\20typescriptreact\tyaml\nproto\1\0\2\14filetypes\0\bbin\14prettierd\fsources\1\0\1\fsources\0\14filetypes\1\0\1\14filetypes\0\1\v\0\0\bcss\15javascript\20javascriptreact\tjson\rmarkdown\tscss\15typescript\20typescriptreact\tyaml\nproto\twith\rprettier\15formatting\rbuiltins\fnull-ls\21ensure_installed\1\0\1\21ensure_installed\0\1\b\0\0\fpyright\rruff_lsp\truff\vlua_ls\ngopls\veslint\nbufls\20mason-lspconfig\nsetup\nmason\rlsp-zero\frequire\3ÄÄ¿ô\4\0", "config", "lsp-zero.nvim")
time([[Config for lsp-zero.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n\30\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\topen\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclose⁄\2\1\0\b\0\21\0!6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\1B\2\1\0019\2\4\0009\2\5\0029\2\6\0023\3\b\0=\3\a\0029\2\4\0009\2\t\0029\2\n\0023\3\v\0=\3\a\0029\2\4\0009\2\t\0029\2\f\0023\3\r\0=\3\a\0026\2\14\0009\2\15\0029\2\16\2'\4\17\0'\5\18\0'\6\19\0005\a\20\0B\2\5\0012\0\0ÄK\0\1\0\1\0\2\vsilent\2\fnoremap\2+<Cmd>lua require(\"dapui\").toggle()<CR>\15<leader>ui\6n\20nvim_set_keymap\bapi\bvim\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\nsetup\ndapui\bdap\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: transparent.nvim
time([[Config for transparent.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16transparent\frequire\0", "config", "transparent.nvim")
time([[Config for transparent.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\no\0\0\6\1\6\0\v-\0\0\0009\0\0\0005\2\4\0006\3\1\0'\5\2\0B\3\2\0029\3\3\3B\3\1\2=\3\5\2B\0\2\1K\0\1\0\0¿\bcwd\1\0\1\bcwd\0\15buffer_dir\20telescope.utils\frequire\15find_fileso\0\0\4\1\4\0\a-\0\0\0009\0\0\0005\2\2\0005\3\1\0=\3\3\2B\0\2\1K\0\1\0\0¿\17find_command\1\0\1\17find_command\0\1\6\0\0\arg\f--files\r--hidden\a-g\n!.git\15find_files˛\1\1\0\a\0\14\0#6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0003\5\a\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\b\0003\5\t\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\n\0009\5\v\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0009\5\r\0004\6\0\0B\1\5\0012\0\0ÄK\0\1\0\fbuffers\15<leader>fb\14live_grep\15<leader>fg\0\15<leader>ff\0\15<leader>fd\6n\bset\vkeymap\bvim\22telescope.builtin\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ttmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)

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
