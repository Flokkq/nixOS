return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
        dependencies = {
            -- Install lsp autocompletions
            "hrsh7th/cmp-nvim-lsp",

            -- Progress/Status update for LSP
            { "j-hui/fidget.nvim", opts = {} },
        },
        config = function()
            local map_lsp_keybinds = require("user.keymaps").map_lsp_keybinds -- Has to load keymaps before pluginslsp

            -- Default handlers for LSP
            local default_handlers = {
                ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
                ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
            }

            -- Function to run when neovim connects to a Lsp client
            ---@diagnostic disable-next-line: unused-local
            local on_attach = function(_client, buffer_number)
                -- Pass the current buffer to map lsp keybinds
                map_lsp_keybinds(buffer_number)
            end

            -- LSP servers and clients are able to communicate to each other what features they support.
            --  By default, Neovim doesn't support everything that is in the LSP Specification.
            --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
            --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            -- LSP servers to install (see list here: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers )
            --  Add any additional override configuration in the following tables. Available keys are:
            --  - cmd (table): Override the default command used to start the server
            --  - filetypes (table): Override the default list of associated filetypes for the server
            --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
            --  - settings (table): Override the default settings passed when initializing the server.
            --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
            local servers = {
                -- LSP Servers
                rust_analyzer = {},
                zls = {
                    on_attach = on_attach,
                    cmd = { "zls" },
                    filetypes = { "zig", "zir" },
                    root_dir = require("lspconfig.util").root_pattern("zls.json", "build.zig", ".git"),
                    single_file_support = true,
                },
                roslyn = {},
                tinymist = {},
                clangd = {},
                gopls = {},
                nixd = {
                    settings = {
                        nixd = {
                            formatting = {
                                command = { "alejandra" },
                            },
                        },
                    },

                },
                bashls = {},
                cssls = {},
                typescript_language_server = {},
                eslint = {
                    cmd = { "vscode-eslint-language-server", "--stdio" },
                    settings = {
                        format = true,                            -- Ensure ESLint can handle formatting
                        workingDirectory = { mode = "location" }, -- Use the working directory where `eslint.config.js` resides
                    },
                    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
                    root_dir = function(fname)
                        return require("lspconfig.util").root_pattern(
                            ".eslintrc",
                            ".eslintrc.js",
                            ".eslintrc.cjs",
                            ".eslintrc.json",
                            ".eslintrc.yaml",
                            ".eslintrc.yml",
                            "eslint.config.js",
                            "eslint.config.mjs",
                            "eslint.config.cjs"
                        )(fname) or require("lspconfig.util").find_git_ancestor(fname)
                    end,
                },
                html = {},
                jsonls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            workspace = {
                                checkThirdParty = false,
                                -- Tells lua_ls where to find all the Lua files that you have loaded
                                -- for your neovim configuration.
                                library = {
                                    "${3rd}/luv/library",
                                    unpack(vim.api.nvim_get_runtime_file("", true)),
                                },
                            },
                            telemetry = { enabled = false },
                        },
                    },
                },
                marksman = {},
                pyright = {},
                sqls = {
                    filetypes = { "sql", "rust" },
                    on_attach = function(client, bufnr)
                        require("sqls").on_attach(client, bufnr)
                    end,
                },
                yamlls = {},
            }

            -- Iterate over our servers and set them up
            for name, config in pairs(servers) do
                require("lspconfig")[name].setup({
                    cmd = config.cmd,
                    capabilities = capabilities,
                    filetypes = config.filetypes,
                    handlers = vim.tbl_deep_extend("force", {}, default_handlers, config.handlers or {}),
                    on_attach = on_attach,
                    settings = config.settings,
                })
            end

            -- Configure borderd for LspInfo ui
            require("lspconfig.ui.windows").default_options.border = "rounded"

            -- Configure diagnostics border
            vim.diagnostic.config({
                float = {
                    border = "rounded",
                },
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            notify_on_error = false,
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
                stop_after_first = true,
            },
            formatters_by_ft = {
                javascript = { "prettierd", "prettier" },
                typescript = { "prettierd", "prettier" },
                typescriptreact = { "prettierd", "prettier" },
                lua = { "stylua" },
            },
        },
    },
}
