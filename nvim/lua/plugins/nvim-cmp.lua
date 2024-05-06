return {
    {
        "hrsh7th/nvim-cmp",
        enabled = false,
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind-nvim",
        },
        config = function()
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end
              
            local snippy = require("LuaSnip")
              
            local cmp = require("cmp")
              
            cmp.setup({
                mapping = {
                    ["<Tab>"] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif snippy.can_expand_or_advance() then
                                snippy.expand_or_advance()
                            elseif has_words_before() then
                                cmp.complete()
                            else
                                fallback()
                            end
                        end,
                        { "i", "s" }
                    ),
                
                    ["<S-Tab>"] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif snippy.can_jump(-1) then
                                snippy.previous()
                            else
                                fallback()
                            end
                        end,
                        { "i", "s" }
                    ),
                },
            })           
        end
    }
}
