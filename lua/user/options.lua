---------------------------------------------
-- Settings  (:h options)
---------------------------------------------

vim.opt.scrolloff = 3               -- Keep 3 lines when scrolling
vim.opt.cmdheight = 2               -- Make command line two lines high
vim.opt.autoindent = true           -- Always set autoindenting on
vim.opt.visualbell = true           -- Use visual bell instead of beeping
vim.opt.backup = false              -- Do not keep a backup filset noswapfile
vim.opt.swapfile = false            -- Do not create a swap file
vim.opt.hidden = true               -- Enable hiding the buffer without saving
vim.opt.number = true               -- Show line numbers
vim.opt.relativenumber = true       -- Show the line number relative to current line
vim.opt.signcolumn = "yes"          -- Draw the sign column
vim.opt.colorcolumn = "80"
vim.opt.wrap = false                -- Do not wrap long lines
vim.opt.completeopt = { "menu", "noinsert", "noselect" }
vim.opt.updatetime = 100            -- Smaller updatetime for CursorHold & CursorHoldI
vim.opt.showmode = false            -- Hide the default mode text
vim.opt.shortmess:append("c")       -- Abbreviate messages
vim.opt.matchpairs:append("<:>")    -- Show matching <> (html mainly) as well
vim.opt.showmatch = true            -- Show matching braces, somewhat annoying...
vim.opt.matchtime = 3               -- Tenths of a second to show the matching paren
vim.opt.modelines = 0               -- No modlines for security
vim.opt.splitright = true           -- Open vertical split to the right
vim.opt.splitbelow = true           -- Open horizontal split below

-- Tab to spaces settings
vim.opt.tabstop = 4                 -- Number of spaces of tab character
vim.opt.shiftwidth = 4              -- Number of spaces to (auto)indent
vim.opt.expandtab = true            -- Tab to spaces by default
vim.opt.softtabstop = 4

-- Search settings
vim.opt.hlsearch = true             -- Highlight searches
vim.opt.incsearch = true            -- Do incremental searching
vim.opt.ignorecase = true           -- Ignore case when searching
vim.opt.infercase = true            -- Smarter completions that will be case aware when ignorecase is on
vim.opt.smartcase = true            -- If contains upper case, make case sensitive search
vim.opt.iskeyword:append("-")       -- Add - to what vim considers a keyword for movement, e.g: e

-- Highlight end of line whitespace.
vim.api.nvim_set_hl(0, "WhitespaceEOL", { reverse = true })
vim.fn.matchadd("WhitespaceEOL", "\\s\\+$")