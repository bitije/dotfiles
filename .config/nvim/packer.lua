return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use({'aserowy/tmux.nvim', config = function() require("tmux").setup() end })
    use({'szw/vim-maximizer', config = function() vim.api.nvim_set_keymap('n', '<leader>z', ':MaximizerToggle<CR>', { noremap = true, silent = true }) end })

    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'kristijanhusak/vim-dadbod-completion'

    use 'nvim-neotest/nvim-nio'
    use 'theHamsta/nvim-dap-virtual-text'
    use {'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')
            -- Define the Delve adapter
            dap.adapters.go = function(callback, config)
                local handle
                local pid_or_err
                local port = 38697
                handle, pid_or_err = vim.loop.spawn("dlv", { args = { "dap", "-l", "127.0.0.1:" .. port },
                }, function(code) handle:close() print("Delve exited with exit code: " .. code) end)
                vim.defer_fn(function() callback({ type = "server", host = "127.0.0.1", port = port }) end, 1000) end
            vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
            local opts = { noremap = true, silent = true }
            dap.configurations.go = {
                {
                    type = "go", name = "Debug with Interactive Package", request = "launch",
                    program = function() return vim.fn.input('Path to package: ', vim.fn.getcwd() .. '/cmd/', 'file') end,
                },}
            vim.api.nvim_set_keymap('n', '<F5>', '<Cmd>lua require("dap").continue()<CR>', opts)
            vim.api.nvim_set_keymap('n', '<F10>', '<Cmd>lua require("dap").step_over()<CR>', opts)
            vim.api.nvim_set_keymap('n', '<F11>', '<Cmd>lua require("dap").step_into()<CR>', opts)
            vim.api.nvim_set_keymap('n', '<F12>', '<Cmd>lua require("dap").step_out()<CR>', opts)
            vim.api.nvim_set_keymap('n', '<leader>b', '<Cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
            dap.set_log_level('TRACE') end
    }
    use { 'leoluz/nvim-dap-go', requires = 'mfussenegger/nvim-dap', config = function() require('dap-go').setup() end }
    use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap','leoluz/nvim-dap-go'}, config = function()
            local dap = require('dap')
            local dapui = require('dapui')
            dapui.setup()
            dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
            dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
            dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
            vim.api.nvim_set_keymap('n', '<leader>ui', '<Cmd>lua require("dapui").toggle()<CR>', { noremap = true, silent = true })
        end
    }

    use {
        'Exafunction/codeium.vim',
        config = function()
            vim.g.codeium_no_map_tab = 1
            vim.g.codeium_enabled = true
            vim.g.codeium_disable_bindings = 1

            local function set_keymap_codeium_opts(desc, opts)
                opts = opts or {}
                local codeium_default_options = { silent = true, expr = true, desc = desc }
                return vim.tbl_extend("force", codeium_default_options, opts)
            end

            local function codeium_keymap_set(mode, keys, codeium_function, desc, opts, arg)
                opts = set_keymap_codeium_opts(desc, opts)
                vim.keymap.set(mode, keys, function()
                    local status, completion_text = pcall(function()
                        return vim.api.nvim_eval(
                        "b:_codeium_completions.items[b:_codeium_completions.index].completionParts[0].text"
                        )
                    end)
                    if not (status and completion_text and completion_text ~= "") then
                        return vim.api.nvim_replace_termcodes(keys, true, true, true)
                    end
                    if arg ~= nil then
                        return vim.fn[codeium_function](arg)
                    end
                    return vim.fn[codeium_function]()
                end, opts)
            end

            codeium_keymap_set("i", "<C-g>", "codeium#Accept", "Codeium Accept suggestion")
            codeium_keymap_set("i", "<C-r>", "codeium#Complete", "Codeium Trigger suggestion")
            codeium_keymap_set("i", "<A-j>", "codeium#CycleCompletions", "Codeium Cycle completions forwards", {}, 1)
            codeium_keymap_set("i", "<A-k>", "codeium#CycleCompletions", "Codeium Cycle completions backwards", {}, -1)
        end
    }


    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "python", "c", "lua", "bash", "query", "javascript", "html", "css", "yaml", "sql", "proto" },
                sync_install = false, auto_install = true, highlight = { enable = true, additional_vim_regex_highlighting = false, }, } end })

    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>fd', function() builtin.find_files({ cwd = require("telescope.utils").buffer_dir() }) end)
            vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' } }) end)
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        end
    }

    -- Colorschemes
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup({
                integrations = { cmp = true, treesitter = true, telescope = true },
                color_overrides = { mocha = { base = "#000000", mantle = "#000000", crust = "#000000", },
                },
            })
            --vim.cmd.colorscheme "catppuccin-latte"
            vim.cmd.colorscheme "catppuccin-mocha"
        end
    })

    use ({ 'xiyaowong/transparent.nvim', config = function() require("transparent").setup() end })

    -- LSP
    use { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x', requires = {
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            { 'jose-elias-alvarez/null-ls.nvim' },
            { 'MunifTanjim/prettier.nvim' }
        },
        config = function()
            local lsp = require('lsp-zero')
            require('mason').setup({})
            local mason_lspconfig = require('mason-lspconfig')
            mason_lspconfig.setup({ ensure_installed = { 'pyright', 'lua_ls', 'gopls', 'eslint', 'bufls', }, })
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier.with({
                        filetypes = {
                            "css",
                            "javascript",
                            "javascriptreact",
                            "json",
                            "markdown",
                            "scss",
                            "typescript",
                            "typescriptreact",
                            "yaml",
                            "proto", }, }), }, })
            require('prettier').setup({
                bin = 'prettierd',
                filetypes = {
                    "css",
                    "javascript",
                    "javascriptreact",
                    "json",
                    "markdown",
                    "scss",
                    "typescript",
                    "typescriptreact",
                    "yaml",
                    "proto", }, })
            local lspconfig = require("lspconfig")
            lspconfig.gopls.setup({ settings = { gopls = {analyses = { unusedparams = true, }, staticcheck = true, gofumpt = true,}, }, })
            lspconfig.pyright.setup({})
            vim.api.nvim_exec([[ augroup FormatAutocmd autocmd! autocmd BufWritePre *.go lua FormatOnSave() augroup END ]], true)
            function FormatOnSave()
                local params = vim.lsp.util.make_range_params()
                params.context = { only = { "source.organizeImports" } }
                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
                for cid, res in pairs(result or {}) do
                    for _, r in pairs(res.result or {}) do
                        if r.edit then
                            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                            vim.lsp.util.apply_workspace_edit(r.edit, enc)
                        end
                    end
                end
                vim.lsp.buf.format({ async = false })
            end
            -- ==END GOPLS CONFIG== --
            local cmp = require('cmp')
            cmp.setup {
                sources = {
                    { name = 'nvim_lsp' },
                },
                mapping = cmp.mapping.preset.insert({}),
                completion = {
                    --autocomplete = false,
                },
            }
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            lsp.on_attach(function(_, bufnr)
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-f>", function() vim.lsp.buf.signature_help() end, opts)
                vim.keymap.set("n", "<leader>q", function() vim.diagnostic.setloclist() end, opts)
                vim.keymap.set("n", "<leader>i", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            end)
            lsp.setup()
            vim.diagnostic.config({
                virtual_text = true,
            })
        end
    }
end)
