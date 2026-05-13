return {
    {
        "gelguy/wilder.nvim",
        event = "CmdlineEnter",

        config = function()
            local wilder = require("wilder")

            local function get_hl(name)
                local ok, hl = pcall(vim.api.nvim_get_hl, 0, {
                    name = name,
                    link = false,
                })

                if ok then
                    return hl
                end

                return {}
            end

            local function setup_wilder_highlights()
                local normal = get_hl("Normal")
                local cursorline = get_hl("CursorLine")
                local identifier = get_hl("Identifier")
                local telescope_border = get_hl("TelescopeBorder")
                local diagnostic_warn = get_hl("DiagnosticWarn")
                local constant = get_hl("Constant")

                local normal_fg = normal.fg
                local normal_bg = normal.bg

                local border_fg =
                    telescope_border.fg
                    or diagnostic_warn.fg
                    or constant.fg
                    or normal_fg

                vim.api.nvim_set_hl(0, "WilderNormal", {
                    fg = normal_fg,
                    bg = normal_bg,
                })

                vim.api.nvim_set_hl(0, "WilderBorder", {
                    fg = border_fg,
                    bg = normal_bg,
                })

                vim.api.nvim_set_hl(0, "WilderAccent", {
                    fg = identifier.fg or border_fg or normal_fg,
                    bg = normal_bg,
                    bold = true,
                })

                vim.api.nvim_set_hl(0, "WilderSelected", {
                    fg = normal_fg,
                    bg = cursorline.bg or normal_bg,
                })
            end

            setup_wilder_highlights()

            vim.api.nvim_create_autocmd({
                "ColorScheme",
                "VimEnter",
            }, {
                group = vim.api.nvim_create_augroup("WilderThemeSync", {
                    clear = true,
                }),
                callback = function()
                    vim.schedule(setup_wilder_highlights)
                end,
            })

            wilder.setup({
                modes = {
                    ":",
                    "/",
                    "?",
                },
            })

            wilder.set_option("pipeline", {
                wilder.branch(
                    wilder.cmdline_pipeline({
                        fuzzy = 1,
                    }),
                    wilder.vim_search_pipeline({
                        fuzzy = 1,
                    })
                ),
            })

            local popup_renderer = wilder.popupmenu_renderer(
                wilder.popupmenu_border_theme({
                    highlighter = wilder.basic_highlighter(),

                    highlights = {
                        default = "WilderNormal",
                        border = "WilderBorder",
                        accent = "WilderAccent",
                        selected = "WilderSelected",
                    },

                    pumblend = 0,

                    min_width = "100%",
                    min_height = "25%",
                    max_height = "25%",

                    border = "rounded",

                    -- Keep this simple.
                    -- popupmenu_devicons() and popupmenu_scrollbar()
                    -- can break on custom command completions like :TSInstall x.
                    left = {
                        " ",
                    },

                    right = {
                        " ",
                    },
                })
            )

            wilder.set_option("renderer", popup_renderer)
        end,
    },
}
