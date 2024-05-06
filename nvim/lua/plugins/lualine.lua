return {
    {
        'nvim-lualine/lualine.nvim',
        enabled = false,
        version = "*",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require('lualine').setup {
                options = {
                    theme = "molokai",
                }
            }
        end
    }
}
