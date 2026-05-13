return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                branch = "main",
            },
        },
        config = function()
            local parsers = {
                "c",
                "cpp",
                "rust",
                "zig",
                "go",
                "bash",
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "nix",
                "vim",
                "vimdoc",
            }

            require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            require("nvim-treesitter").install(parsers)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "c",
                    "cpp",
                    "rust",
                    "zig",
                    "go",
                    "sh",
                    "bash",
                    "html",
                    "css",
                    "javascript",
                    "typescript",
                    "typescriptreact",
                    "json",
                    "lua",
                    "markdown",
                    "nix",
                    "vim",
                },
                callback = function(args)
                    pcall(vim.treesitter.start)
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })

            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                    keymaps = {
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
                move = {
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
            })
        end,
    },
}
