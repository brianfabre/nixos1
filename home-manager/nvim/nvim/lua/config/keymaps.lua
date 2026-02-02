local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    -- vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    vim.keymap.set(mode, lhs, rhs, options)
end

-- move between panes to left/bottom/top/right
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- jk for wrapped words
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- horizontal movement
map("n", "<S-left>", "^")
map("n", "<S-right>", "$")

-- cursor remains in position after yank
map("v", "y", "ygv<esc>")

-- move between buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- move line/down
map("n", "<S-Up>", ":m-2<CR>")
map("n", "<S-Down>", ":m+<CR>")
map("v", "<S-Up>", ":m '<-2<CR>gv=gv")
map("v", "<S-Down>", ":m '>+1<CR>gv=gv")

-- copy to clipboard
-- map("v", "<Leader>y", '"*y')
map("v", "<Leader>y", '"+y')

-- no register for x
map("n", "x", '"_x')

-- leave insert mode
map("i", "jk", "<esc>")

-- save
map("n", "<leader>k", ":update<CR>", { desc = "save" })

-- file path
map("n", "<leader>cw", ":lua print(vim.fn.getcwd())<CR>", { desc = "echo CWD" })
map("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", { desc = "set as working dir" })
map("n", "<leader>cp", ':let @+=expand("%:p")<CR>', { desc = "path to clipboard" })

-- always centers after c-d/c-u
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- faster in/outdenting
map("i", "<<", "<c-d>")
map("i", ">>", "<c-t>")

-- allow the . to execute once for each line of a visual selection
map("v", ".", ":normal .<CR>")

-- ui stuff
map("n", "<leader>s", ":set invspell<CR>", { desc = "toggle spelling" })
