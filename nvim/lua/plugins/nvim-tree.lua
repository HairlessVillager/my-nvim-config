local function open_nvim_tree()
    -- open the tree
    require("nvim-tree.api").tree.open()
end

return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            -- disable netrw at the very start of your init.lua
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- set termguicolors to enable highlight groups
            vim.opt.termguicolors = true

            -- open NvimTree when VimEnter
            vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

            -- empty setup using defaults
            --require("nvim-tree").setup()

            -- OR setup with some options
            require("nvim-tree").setup({
                --on_attach = on_attach,
                sort = {
                    sorter = "case_sensitive",
                },
                git = {
                    enable = true,
                },
                view = {
                    -- 文件浏览器展示位置，左侧：left, 右侧：right
                    side = "left",
                    -- 行号是否显示
                    number = false,
                    relativenumber = false,
                    -- 显示图标
                    signcolumn = "yes",
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            })
        end
    }
}
