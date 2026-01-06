return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        -- ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        event = {
            -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
            -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
            -- refer to `:h file-pattern` for more examples
            "BufReadPre " .. vim.fn.expand "~" .. "/vault/personal/*.md",
            "BufNewFile " .. vim.fn.expand "~" .. "/vault/personal/*.md",
        },
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "~/vaults/personal",
                },
            },
            templates = {
                folder = "~/vaults/personal/templates",
            }
        },
    }
}
