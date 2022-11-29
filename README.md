My Neovim setup
===============

My Neovim IDE setup.

![NeoVIM screenshot](https://i.imgur.com/Hjthsde.png)


Note: For the old COC related setup, please checkout the `with-coc` tag.

Features
---------

* `init.vim` handling
* Incremental and smart case search.
* Trailing whitespace highlighting and cleaning shortcut
* Logical and Visual layout (for Right-To-Left languages) editing
* Tabs expand to 4 spaces by default, 2 spaces for specific file types
* Remap `<Leader>` to `<SPACE>` and `jj` to `<ESC>`
* Highlight current row and color column 80
* Syntax checking and completion via language servers
* Quotes, parens etc pair, surround
* Various fuzzy finders with Telescope
* Git plugins (Fugitive, gitsigns)
* Completion and snippets via LSP
* Commenting
* which-key integration

Shortcuts and re-Mappings
----------------------------

Some are leading to operations, marked as bold Which-key will list them.

| Key                  | Command                                                           |
| ---------------------| ----------------------------------------------------------------- |
| `jj`                 | `<Esc>` in insert and command modes                               |
| `<SPACE>`            | `<Leader>`                                                        |
| `<Leader>v`          | Load `.vimrc`                                                     |
| `<Leader>V`          | Activate changes to `.vimrc` (Make sure to save it before)        |
| `<Leader>S`          | Remove trailing whitespace                                        |
| `<CTRL>hjkl`         | Window movement commands                                          |
| `<CTRL>arrow`        | Resize splits                                                     |   
| `<TAB>`              | trigger completion, completion confirm, snippet expand and jump   |
| **`<Leader>f`**      | Find files, buffers and grep operations                           |
| **`<Leader>l`**      | LSP (programming) related operations                              |
| **`<Leader>g`**      | Git related operations                                            |
| **`<Leader>t`**      | Tree operations                                                   |
| **`<Leader>b`**      | Bidi (Right to left) related operations                           |
| `K`                  | Show documentation/signature hover (LSP)                          |
| `<Leader>e`          | Show error under cursor (LSP)                                     |
| `[d`                 | Previous error                                                    |
| `]d`                 | Next error                                                        |


Prerequisites
-------------

- Neovim and Neovim Python client.
- For faster search, [ripgrep](https://github.com/BurntSushi/ripgrep)
- NodeJS (for some language servers)


Usage
------------

The following commands will clone the repo, and install `vim-plug` plugin
manager:

    mkdir -p ~/.config/nvim
    git clone https://github.com/MeirKriheli/dotneovim.git ~/.config/nvim


After that start Neovim and install the desired language servers, e.g:

    :Mason
