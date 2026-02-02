return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        dim = {
            animate = {
                enabled = false,
            },
        },
        dashboard = { enabled = true },
        indent = { enabled = true },
        lazygit = { enabled = true },
        styles = {
            zen = {
                backdrop = { transparent = false },
                width = 80,
            },
        },
    },
    keys = {
        {
            "<leader>z",
            function()
                Snacks.zen()
            end,
            desc = "Toggle Zen Mode",
        },
        {
            "<leader>db",
            function()
                Snacks.bufdelete()
            end,
            desc = "[D]elete [B]uffer",
        },
        {
            "<leader>lg",
            function()
                Snacks.lazygit()
            end,
            desc = "Lazygit",
        },
    },
}
