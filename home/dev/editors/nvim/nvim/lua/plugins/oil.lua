return {
    {
        "stevearc/oil.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("oil").setup({
                use_default_keymaps = false,

                keymaps = {
                    ["g?"] = "actions.show_help",
                    ["<CR>"] = "actions.select",
                    ["<C-\\>"] = "actions.select_split",
                    ["<C-enter>"] = "actions.select_vsplit",
                    ["<C-t>"] = "actions.select_tab",
                    ["<C-p>"] = "actions.preview",
                    ["<C-c>"] = "actions.close",
                    ["<C-r>"] = "actions.refresh",
                    ["-"] = "actions.parent",
                    ["_"] = "actions.open_cwd",
                    ["`"] = "actions.cd",
                    ["~"] = "actions.tcd",
                    ["gs"] = "actions.change_sort",
                    ["gx"] = "actions.open_external",
                    ["g."] = "actions.toggle_hidden",
                },

                view_options = {
                    show_hidden = true,
                },

                float = {
                    border = "rounded",
                    win_options = {
                        winblend = 0,
                        winhighlight = table.concat({
                            "Normal:Normal",
                            "NormalFloat:NormalFloat",
                            "FloatBorder:FloatBorder",
                            "FloatTitle:FloatTitle",
                            "SignColumn:SignColumn",
                        }, ","),
                    },
                },

                confirmation = {
                    border = "rounded",
                    win_options = {
                        winblend = 0,
                        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
                    },
                },

                progress = {
                    border = "rounded",
                    minimized_border = "rounded",
                    win_options = {
                        winblend = 0,
                        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
                    },
                },

                keymaps_help = {
                    border = "rounded",
                },
            })
        end,
    },
}
