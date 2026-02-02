return {
    {
        "echasnovski/mini.files",
        version = false,
        keys = {
            {
                "-",
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
                end,
                desc = "open mini files",
            },
        },
        opts = {
            mappings = {
                go_in_plus = "<CR>",
            },
        },
    },
    { "echasnovski/mini.ai", version = false, opts = {} },
    { "echasnovski/mini.cursorword", version = false, opts = {} },
    { "echasnovski/mini.tabline", version = false, opts = {} },
    {
        "echasnovski/mini.comment",
        version = false,
        opts = {
            mappings = {
                comment_line = "<leader>/",
                comment_visual = "<leader>/",
            },
        },
    },
}
