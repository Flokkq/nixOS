return {
    {
        "epwalsh/obsidian.nvim",
        tag = "v3.9.0",
        requires = {
            -- Required.
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("obsidian").setup({
                workspaces = {
                    {
                        name = "personal",
                        path = "~/vaults/personal",
                    },
                },
            })
        end,
    }
}
