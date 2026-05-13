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

local function set_bg(group, bg)
    local hl = get_hl(group)

    hl.link = nil
    hl.bg = bg

    vim.api.nvim_set_hl(0, group, hl)
end

local function apply_float_theme()
    local normal = get_hl("Normal")
    local telescope_border = get_hl("TelescopeBorder")
    local diagnostic_warn = get_hl("DiagnosticWarn")
    local constant = get_hl("Constant")

    local bg = normal.bg
    local fg = normal.fg

    local border_fg =
        telescope_border.fg
        or diagnostic_warn.fg
        or constant.fg
        or fg

    -- Generic floats
    vim.api.nvim_set_hl(0, "NormalFloat", {
        fg = fg,
        bg = bg,
    })

    vim.api.nvim_set_hl(0, "FloatBorder", {
        fg = border_fg,
        bg = bg,
    })

    vim.api.nvim_set_hl(0, "FloatTitle", {
        fg = border_fg,
        bg = bg,
        bold = true,
    })

    -- Diagnostic floats
    vim.api.nvim_set_hl(0, "DiagnosticFloatingError", {
        fg = get_hl("DiagnosticError").fg or fg,
        bg = bg,
    })

    vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", {
        fg = get_hl("DiagnosticWarn").fg or fg,
        bg = bg,
    })

    vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", {
        fg = get_hl("DiagnosticInfo").fg or fg,
        bg = bg,
    })

    vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", {
        fg = get_hl("DiagnosticHint").fg or fg,
        bg = bg,
    })

    vim.api.nvim_set_hl(0, "DiagnosticFloatingOk", {
        fg = get_hl("DiagnosticOk").fg or fg,
        bg = bg,
    })

    -- LSP hover / markdown code block backgrounds
    for _, group in ipairs({
        "markdownCode",
        "markdownCodeBlock",
        "markdownCodeDelimiter",

        "@text.literal.markdown",
        "@text.literal.block.markdown",
        "@markup.raw.markdown",
        "@markup.raw.block.markdown",
        "@markup.raw.markdown_inline",

        -- render-markdown.nvim, if you use it
        "RenderMarkdownCode",
        "RenderMarkdownCodeInline",
        "RenderMarkdownCodeBorder",
        "RenderMarkdownCodeFallback",
    }) do
        set_bg(group, bg)
    end

    -- Number/sign/fold columns
    for _, group in ipairs({
        "LineNr",
        "LineNrAbove",
        "LineNrBelow",
        "CursorLineNr",
        "SignColumn",
        "FoldColumn",
        "CursorLineSign",
        "CursorLineFold",
    }) do
        set_bg(group, bg)
    end
end

apply_float_theme()

vim.api.nvim_create_autocmd({
    "ColorScheme",
    "VimEnter",
    "UIEnter",
}, {
    group = vim.api.nvim_create_augroup("FlatThemeBackgrounds", {
        clear = true,
    }),
    callback = function()
        vim.schedule(apply_float_theme)
    end,
})

vim.api.nvim_create_autocmd("User", {
    pattern = {
        "VeryLazy",
        "LazyDone",
    },
    callback = function()
        vim.schedule(apply_float_theme)
    end,
})
