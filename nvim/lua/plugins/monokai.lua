return {
    {
        'tanvirtin/monokai.nvim',
        config = function()
            local palette = require("monokai").classic
            require('monokai').setup {
                palette = {
                    base2 = "#1B1D1E",
                    white = "#F0F0E8",
                    brown = "#8F908A",
                }
            }
        end
    }
}