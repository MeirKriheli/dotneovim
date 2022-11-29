------------------------------------
-- key mapppings
------------------------------------

local map = vim.api.nvim_set_keymap -- shortcut to the map func
local opts = { noremap = true, silent = true } -- DRY for map options
local expr = { noremap = true, silent = true, expr = true } -- Opts and expr
local wk = require("which-key")

-- map the leader key to space
map('n', '<Space>', '', {})
vim.g.mapleader = ' ' -- 'vim.g' sets global variables


-- Maps for jj to act as Esc in insert and command modes
map('i', 'jj', '<ESC>', opts)
map('c', 'jj', '<ESC>', opts)

-- Smarter j/k navigation
-- Convert the j and k movement commands from strict linewise movements to
-- onscreen display line movements via the gj and gk commands. When
-- preceded with a count we want to go back to strict linewise movements.
-- will automatically save movements larger than 5 lines to the jumplist.
map('n', 'j', 'v:count ? (v:count > 5 ? "m\'" . v:count : "") . "j" : "gj"', expr)
map('n', 'k', 'v:count ? (v:count > 5 ? "m\'" . v:count : "") . "k" : "gk"', expr)

-- Center next/previous matched string
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)

-- control + vim direction key to navigate windows
map('n', '<C-J>', '<C-W>j', opts)
map('n', '<C-K>', '<C-W>k', opts)
map('n', '<C-H>', '<C-W>h', opts)
map('n', '<C-L>', '<C-W>l', opts)

-- Make these all work in insert mode
map('i', '<C-W>', '<C-O><C-W>', opts)

-- control + arrow key to resize
map('n', '<C-Down>', '<C-W>+', opts)
map('n', '<C-Up>', '<C-W>-', opts)
map('n', '<C-Left>', '<C-W><', opts)
map('n', '<C-Right>', '<C-W>>', opts)


-- Navigation from terminal
map("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

wk.register({
  ["<leader>"] = {
    S = { [[:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>]], "Remove trailing whitespace" },
    V = { ':source ~/.config/nvim/init.lua<CR>', "Reload and activate changes in init.lua" },
  }
})

wk.register({
  ["<leader>f"] = {
    name = "find",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    w = { '<cmd>Telescope grep_string<cr>', "Grep String under cursor" },
    b = { '<cmd>Telescope buffers<cr>', "Search open buffer names" },
    h = { '<cmd>Telescope help_tags<cr>', "Search in help tags" },
  }
})

wk.register({
  ["<leader>g"] = {
    name = "git",
    b = { "<cmd>Telescope git_branches<cr>", "Branches" },
    r = { "<cmd>Telescope git_bcommits<cr>", "Commits for Current Buffer" },
    s = { "<cmd>Telescope git_status<cr>", "Git status" },
    p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
    S = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
    U = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
  }
})

wk.register({
  ["<leader>t"] = {
    name = "tree",
    t = { ":NvimTreeToggle<CR>", "Toggle File Tree" },
    f = { ":NvimTreeFindFile<CR>", "Find Current File in Tree" },
  }
})

wk.register({
  ["<leader>b"] = {
    name = "BiDi",
    r = { ":set invrl<cr>", "Toggle Right-to-Left" },
    i = { ":set invrevins<cr>", "Toggle Inserting Chars Backwards" },
  }
})

wk.register({
  ["g"] = {
    ["/"] = { ":grep!<space>", "Grep" },
    ["*"] = { ":grep! -w <C-R><C-W><space>", "Grep Word Under cursor" },
    a = { ":grepadd!<space>", "Grep Add to Results" },
  }
})
