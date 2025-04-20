return {
  {
    "benfowler/telescope-luasnip.nvim",
    lazy = true,
    module = "telescope._extensions.luasnip",
    config = function()
      require('telescope').load_extension('luasnip')
    end,
  }
}
