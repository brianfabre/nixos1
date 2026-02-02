return {
    "ibhagwan/fzf-lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("fzf-lua").setup({
            grep = {
                cmd = "rg --color=always --smart-case --no-heading --column --line-number --glob '!repos/*' --glob '!Library/*'",
            },
	    files = {
    		cmd = "fd --type f --hidden --follow --exclude .git --exclude .local --exclude repos",
  	    },
        })
        vim.keymap.set(
            "n",
            "<leader>ff",
            "<cmd>lua require('fzf-lua').files()<CR>",
            { silent = true, desc = "search files" }
        )
        vim.keymap.set(
            "n",
            "<leader>ss",
            "<cmd>lua require('fzf-lua').buffers()<CR>",
            { silent = true, desc = "search open buffer" }
        )
        vim.keymap.set(
            "n",
            "<leader>sb",
            "<cmd>lua require('fzf-lua').blines()<CR>",
            { silent = true, desc = "search buffer lines" }
        )
        vim.keymap.set(
            "n",
            "<leader>sr",
            "<cmd>lua require('fzf-lua').oldfiles()<CR>",
            { silent = true, desc = "search recent files" }
        )
        vim.keymap.set(
            "n",
            "<leader>sg",
            "<cmd>lua require('fzf-lua').live_grep()<CR>",
            { silent = true, desc = "live grep" }
        )
        vim.keymap.set(
            "n",
            "<leader>sc",
            "<cmd>lua require('fzf-lua').command_history()<CR>",
            { silent = true, desc = "search command history" }
        )
        vim.keymap.set(
            "n",
            "<leader>sh",
            "<cmd>lua require('fzf-lua').highlights()<CR>",
            { silent = true, desc = "search highlights" }
        )
    end,
}
