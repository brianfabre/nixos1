return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
    config = function()
        local Rule = require("nvim-autopairs.rule")
        local npairs = require("nvim-autopairs")

        require("nvim-autopairs").setup({
            ignored_next_char = "", -- autopair even before char
            fast_wrap = {
                map = "<C-e>",
                end_key = "'",
                manual_position = false,
            },
        })
    end,
}
