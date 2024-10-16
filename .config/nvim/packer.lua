return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Tmux
    use({
        'aserowy/tmux.nvim',
        config = function()
            require("tmux").setup()
        end
    })
    use({
        'szw/vim-maximizer',
        config = function()
            vim.api.nvim_set_keymap('n', '<leader>z', ':MaximizerToggle<CR>', { noremap = true, silent = true })
        end
    })

    -- DADBOD
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'kristijanhusak/vim-dadbod-completion'

    -- Debug
    use { "nvim-neotest/nvim-nio" }
    use {'theHamsta/nvim-dap-virtual-text'}
    use {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')
            -- Define the Delve adapter
            dap.adapters.go = function(callback, config)
                local handle
                local pid_or_err
                local port = 38697  -- You can change this port if needed
                handle, pid_or_err = vim.loop.spawn("dlv", {
                    args = { "dap", "-l", "127.0.0.1:" .. port },
                }, function(code)
                    handle:close()
                    print("Delve exited with exit code: " .. code)
                end)
                -- Wait for Delve to start
                vim.defer_fn(function()
                    callback({ type = "server", host = "127.0.0.1", port = port })
                end, 1000)
            end

            vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
            local opts = { noremap = true, silent = true }
            dap.configurations.go = {
                {
                    type = "go",
                    name = "Debug with Interactive Package",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to package: ', vim.fn.getcwd() .. '/cmd/', 'file')
                    end,
                },
            }
            vim.api.nvim_set_keymap('n', '<F5>', '<Cmd>lua require("dap").continue()<CR>', opts)
            vim.api.nvim_set_keymap('n', '<F10>', '<Cmd>lua require("dap").step_over()<CR>', opts)
            vim.api.nvim_set_keymap('n', '<F11>', '<Cmd>lua require("dap").step_into()<CR>', opts)
            vim.api.nvim_set_keymap('n', '<F12>', '<Cmd>lua require("dap").step_out()<CR>', opts)
            vim.api.nvim_set_keymap('n', '<leader>b', '<Cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
            vim.api.nvim_set_keymap('n', '<leader>B', '<Cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
            --vim.api.nvim_set_keymap('n', '<leader>br', '<Cmd>lua require("dap").repl.open()<CR>', opts)
            --vim.api.nvim_set_keymap('n', '<leader>bl', '<Cmd>lua require("dap").run_last()<CR>', opts)
            dap.set_log_level('TRACE')
        end
    }
    use {
        'leoluz/nvim-dap-go',
        requires = 'mfussenegger/nvim-dap',
        config = function()
            require('dap-go').setup()
        end
    }
    use {
        'rcarriga/nvim-dap-ui',
        requires = {'mfussenegger/nvim-dap','leoluz/nvim-dap-go'},
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')
            dapui.setup()
            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close()
            end
            vim.api.nvim_set_keymap('n', '<leader>ui', '<Cmd>lua require("dapui").toggle()<CR>', { noremap = true, silent = true })
        end
    }

    -- Codeium
    use {
        'Exafunction/codeium.vim',
        config = function()
            vim.g.codeium_no_map_tab = 1
            vim.g.codeium_enabled = true
            vim.g.codeium_disable_bindings = 1

            local function set_keymap_codeium_opts(desc, opts)
                opts = opts or {}
                local codeium_default_options = {
                    silent = true,
                    expr = true,
                    desc = desc,
                }
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
            codeium_keymap_set("i", "<C-c>", "codeium#Clear", "Codeium Clear completions")
            codeium_keymap_set("i", "<C-Right>", "codeium#AcceptNextWord", "Codeium Accept next word",
                { noremap = true, replace_keycodes = false })
        end
    }

    -- Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "python", "c", "lua", "vim", "vimdoc", "bash",
                    "query", "javascript", "html", "css", "yaml", "sql", "proto" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    })

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            local builtin = require('telescope.builtin')
            local utils = require("telescope.utils")
            vim.keymap.set('n', '<leader>fd', function() builtin.find_files({ cwd = utils.buffer_dir() }) end)
            vim.keymap.set('n', '<leader>ff',
                function() builtin.find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' } }) end)
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            --vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps',
                function() builtin.grep_string({ search = vim.fn.input("Grep in files> ") }) end)
        end
    }

    -- Colorschemes
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup({
                integrations = {
                    cmp = true,
                    treesitter = true,
                    telescope = true
                },
                color_overrides = {
                    mocha = {
                        base = "#000000",
                        mantle = "#000000",
                        crust = "#000000",
                    },
                },
            })
            --vim.cmd.colorscheme "catppuccin-latte"
            vim.cmd.colorscheme "catppuccin-mocha"
        end
    })

    -- Obsidian
    use({
        "epwalsh/obsidian.nvim",
        tag = "*", -- recommended, use latest release instead of latest commit
        requires = { "nvim-lua/plenary.nvim", },
        config = function()
            require("obsidian").setup({
                note_id_func = function(title)
                    local suffix = ""
                    if title ~= nil then
                        suffix = title:lower()
                    else
                        for _ = 1, 4 do
                            suffix = suffix .. string.char(math.random(65, 90))
                        end
                    end
                    return suffix
                end,
                dir = "~/obsidian-vault",
                follow_url_func = function(url)
                    vim.fn.jobstart({ "xdg-open", url }) -- linux
                end,
                mappings = {
                    ["gd"] = {
                        action = function()
                            return require("obsidian").util.gf_passthrough()
                        end,
                        opts = { noremap = false, expr = true, buffer = true },
                    },
                    -- Toggle check-boxes.
                    ["<leader>ch"] = {
                        action = function()
                            return require("obsidian").util.toggle_checkbox()
                        end,
                        opts = { buffer = true },
                    },
                },

                -- Optional, configure additional syntax highlighting / extmarks.
                -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
                ui = {
                    enable = true,         -- set to false to disable all additional syntax features
                    update_debounce = 200, -- update delay after a text change (in milliseconds)
                    -- Define how various check-boxes are displayed
                    checkboxes = {
                        [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                        ["x"] = { char = "✔", hl_group = "ObsidianDone" },
                    },
                    -- Use bullet marks for non-checkbox lists.
                    bullets = { char = "•", hl_group = "ObsidianBullet" },
                    external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                    -- Replace the above with this if you don't have a patched font:
                    -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                    reference_text = { hl_group = "ObsidianRefText" },
                    highlight_text = { hl_group = "ObsidianHighlightText" },
                    tags = { hl_group = "ObsidianTag" },
                    hl_groups = {
                        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                        ObsidianTodo = { bold = true, fg = "#f78c6c" },
                        ObsidianDone = { bold = true, fg = "#89ddff" },
                        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                        ObsidianTilde = { bold = true, fg = "#ff5370" },
                        ObsidianBullet = { bold = true, fg = "#89ddff" },
                        ObsidianRefText = { underline = true, fg = "#c792ea" },
                        ObsidianExtLinkIcon = { fg = "#c792ea" },
                        ObsidianTag = { italic = true, fg = "#89ddff" },
                        ObsidianHighlightText = { bg = "#75662e" },
                    },
                },
            })
        end
    })

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required

            -- Prettier and null-ls
            { 'jose-elias-alvarez/null-ls.nvim' },
            { 'MunifTanjim/prettier.nvim' }
        },
        config = function()
            local lsp = require('lsp-zero').preset({})
            lsp.ensure_installed({
                'pyright',
                'lua_ls',
                'gopls',
                'eslint',
                'bufls',
            })

            -- Null-ls setup
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
                            "proto",
                        },
                    }),
                },
            })

            -- Prettier setup
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
                    "proto",
                },
            })

            -- Prettier command
            vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })

            -- == GOPLS CONFIG == --
            local lspconfig = require("lspconfig")
            lspconfig.gopls.setup({
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                    },
                },
            })
            vim.api.nvim_exec([[
            augroup FormatAutocmd
            autocmd!
            autocmd BufWritePre *.go lua FormatOnSave()
            augroup END
            ]], true)

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

            -- Fix Undefined global 'vim'
            lsp.nvim_workspace()
            local cmp = require('cmp')
            cmp.setup {
                completion = {
                    ---autocomplete = false,
                },
            }
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local cmp_mappings = lsp.defaults.cmp_mappings({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            })
            cmp_mappings['<Tab>'] = nil
            cmp_mappings['<S-Tab>'] = nil
            lsp.setup_nvim_cmp({
                mapping = cmp_mappings
            })
            lsp.set_preferences({
                suggest_lsp_servers = false,
                sign_icons = {
                    error = 'E',
                    warn = 'W',
                    hint = 'H',
                    info = 'I'
                }
            })
            lsp.on_attach(function(_, bufnr)
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-f>", function() vim.lsp.buf.signature_help() end, opts)
            end)
            lsp.setup()
            vim.diagnostic.config({
                virtual_text = true
            })
        end
    }
end)
