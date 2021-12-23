local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

plugins = require('plugins')

-- -- PLUGINS ---------------------------------------------------------
-- Download plugins with ~/.config/nvim/lua/plugins.lua
-- Configure plugins with ~/.config/nvim/lua/plugin_configs.lua
plugins.setup_packer()
plugins.disable_built_ins()
plugins.load_plugins()

-- -- LOAD CUSTOM FUNCTIONS ----------------------------------------------
cmd [[source ~/.config/nvim/vimscript/functions.vim]]
cmd [[source ~/.config/nvim/vimscript/autocmds.vim]]

-- -- LOAD MAPPINGS ------------------------------------------------------

local maps = {
    [''] = {
        -- Better splitting
        ['_']  = ':split<CR>',
        ['|']  = ':vsplit<CR>',
        -- Move left and right faster
        ['H'] = '^',
        ['L'] = '$',
        -- Prevent x and s from overriding what's in the clipboard
        ['x']  = '\"_x',
        ['X']  = '\"_X',
        ['s']  = '\"_s',
        ['S']  = '\"_S',
        -- Center screen and open folds when flicking through search matches
        ['n']  = 'nzzzv',
        ['N']  = 'Nzzzv',
        -- Better jumplist for large line steps (and step through visual lines with j/k)
        ['j']  = {map=[[(v:count > 5 ? 'm`' . v:count : 'g') . 'j']], opts={expr=true, noremap=true}},
        ['k']  = {map=[[(v:count > 5 ? 'm`' . v:count : 'g') . 'k']], opts={expr=true, noremap=true}},
        -- Toggle terminal
        ['<C-t>']  = {map=[[:exe v:count . "ToggleTerm direction=horizontal"<CR>]], opts={silent=true, noremap=true}},
        ['<C-y>']  = {map=[[:exe v:count . "ToggleTerm direction=vertical"<CR>]], opts={silent=true, noremap=true}},
        -- Disable arrow keys
        ['<Left>']  = '',
        ['<Down>']  = '',
        ['<Up>']    = '',
        ['<Right>'] = '',
    },
    n = {
        -- Make Y behave like D and C
        ['Y']  = 'y$',
        -- gp: Visually select last pasted block (like gv)
        ['gp'] = {map=[['`[' . getregtype()[0] . '`]']], opts={expr=true}},
        -- gF: create new file at filename over cursor
        ['gF'] = ':e <c-r><c-f><CR>',
        -- J doesn't move cursor
        ['J']  = 'mzJ`z',
        -- [Ctrl + Arrow] to navigate windows
        ['<C-Left>']  = '<C-w>h',
        ['<C-Down>']  = '<C-w>j',
        ['<C-Up>']    = '<C-w>k',
        ['<C-Right>'] = '<C-w>l',
        -- [Shift + Arrow] Move splits (drop <C-\><C-n> if using vim)
        ['<S-Left>']  = '<C-w>H',
        ['<S-Down>']  = '<C-w>J',
        ['<S-Up>']    = '<C-w>K',
        ['<S-Right>'] = '<C-w>L',
        -- [Alt + Arrow] : resize splits
        ['<A-Left>']  = '<C-w>8<',
        ['<A-Down>']  = '<C-w>8-',
        ['<A-Up>']    = '<C-w>8+',
        ['<A-Right>'] = '<C-w>8>',
    },
    v = {
        -- Maintain Visual Mode after >/</= actions
        ['<'] = '<gv',
        ['>'] = '>gv',
        ['='] = '=gv',
        -- Move visual block up or down
        ['J'] = ":m '>+1<CR>gv",
        ['K'] = ":m '<-2<CR>gv",
    },
    t = {
        -- <Esc><Esc> = (terminal) go to normal mode
        ['<Esc><Esc>'] = '<C-\\><C-n>',
        -- <Esc>: = (terminal) go to command mode
        ['<Esc>:'] = '<C-\\><C-n>:',
        -- [Ctrl + Arrow] to navigate windows
        ['<C-Left>']  = '<C-\\><C-n><C-w>h',
        ['<C-Down>']  = '<C-\\><C-n><C-w>j',
        ['<C-Up>']    = '<C-\\><C-n><C-w>k',
        ['<C-Right>'] = '<C-\\><C-n><C-w>l',
        -- [Shift + Arrow] Move splits
        ['<S-Left>']  = '<C-\\><C-N><C-w>H',
        ['<S-Down>']  = '<C-\\><C-N><C-w>J',
        ['<S-Up>']    = '<C-\\><C-N><C-w>K',
        ['<S-Right>'] = '<C-\\><C-N><C-w>L',
        -- [Alt + Arrow] : resize splits
        ['<A-Left>']  = '<C-\\><C-N><C-w>8<',
        ['<A-Down>']  = '<C-\\><C-N><C-w>8-',
        ['<A-Up>']    = '<C-\\><C-N><C-w>8+',
        ['<A-Right>'] = '<C-\\><C-N><C-w>8>',
    },
    i = {
        -- C-s : Quickly guess correct spelling errors (undoable)
        ['<C-s>'] = '<C-g>u<Esc>[S1z=`]a<c-g>u',
        -- Insert undo breakpoints when typing punctuation
        [','] = ',<C-g>u',
        ['.'] = '.<C-g>u',
        ['!'] = '!<C-g>u',
        ['?'] = '?<C-g>u',
        ['('] = '(<C-g>u',
        [')'] = ')<C-g>u',
        ['['] = '[<C-g>u',
        [']'] = ']<C-g>u',
        ['{'] = '{<C-g>u',
        ['}'] = '}<C-g>u',
        ['<'] = '<<C-g>u',
        ['>'] = '><C-g>u',
        ["'"] = "'<C-g>u",
        ['"'] = '"<C-g>u',
        ['`'] = '`<C-g>u',
    },
    c = {
        -- Make vertical wildmenu controls behave intuitively
        ['<Down>']  = {
            map=[[wildmenumode() ? "\<Right>" : "\<Down>"]],
            opts={expr=true, noremap=true},
        },
        ['<Up>']    = {
            map  = [[wildmenumode() ? "\<Left>" : "\<Up>"]],
            opts = {expr=true, noremap=true},
        },
        ['<Right>'] = {
            map  = [[wildmenumode() ? "\<Down>" : "\<Right>"]],
            opts = {expr=true, noremap=true},
        },
        ['<Left>']  = {
            map  = [[wildmenumode() ? "\<Up>" : "\<Left>"]],
            opts = {expr=true, noremap=true},
        },
    },
    o = {
        -- Custom text object: "around document"
        ['ad'] = '<Cmd>normal! ggVG<CR>',
    },
    x = {
        -- Custom text object: "around document"
        ['ad'] = 'gg0oG$',
    },
}

vim.g.mapleader = " "
local leader_maps = {
    n = {
        -- META MAPS
        ['<Leader><CR>']  = ":lua require'lir.float'.toggle()<CR>",  -- File explorer
        ['<Leader><BS>']  = ":Telescope find_files<CR>",             -- Fuzzy finder
        ['<Leader><Tab>'] = "<C-^>",                                 -- Last file
        ['<Leader><Esc>'] = ":ToggleTerm direction=float<CR>",       -- Quick terminal
        -- KEY MAPS
        ['<Leader>q'] = ":q<CR>",                      -- L-q to quit
        ['<Leader>d'] = ":cd %:p:h<CR>:pwd<CR>",       -- Change dir to current
        ['<Leader>s'] = ":set hls!<CR>",               -- Toggle highlights
        ['<Leader>c'] = ":call ToggleQuickFix()<CR>",  -- Toggle qflist
        ['<Leader>l'] = ":call ToggleLocation()<CR>",  -- Toggle loclist
        -- TELESCOPE MAPS
        ['<Leader>b'] = ":Telescope buffers<CR>",                    -- Switch between buffers
        ['<Leader>r'] = ":Telescope oldfiles<CR>",                   -- Recently changed files
        ['<Leader>f'] = ":Telescope current_buffer_fuzzy_find<CR>",  -- Jumping with fuzzyfind
        ['<Leader>g'] = ":Telescope live_grep<CR>",                  -- Jumping with livegrep
        -- HARPOON MAPS
        ['<Leader>h'] = ":lua require('harpoon.ui').toggle_quick_menu()<CR>",  -- Show Harpoon
        ['<Leader>j'] = ":lua require('harpoon.mark').add_file()<CR>",         -- Mark for harpoon
        -- TOGGLETERM MAPS
        ['<Leader>g'] = ":call v:lua.lazygit_toggle()<CR>",
        ['<Leader>n'] = ":call v:lua.nvtop_toggle()<CR>",
        ['<Leader>t'] = ":call v:lua.bashtop_toggle()<CR>",
    },
}

-- Apply mappings
for _, list in pairs({maps, leader_maps}) do
    for mode, mappings in pairs(list) do
        for keys, mapping in pairs(mappings) do
            if (type(mapping) == "table") then
                vim.api.nvim_set_keymap(mode, keys, mapping.map, mapping.opts)
            else
                vim.api.nvim_set_keymap(mode, keys, mapping, {noremap=true, silent=true})
            end
        end
    end
end

-- -- LOAD OPTIONS ----------------------------------------------

local behaviour_options = {
    -- MAIN INPUT/OUTPUT
    clipboard   = "unnamedplus",
    ttimeoutlen = 10,   --
    updatetime  = 300,  --
    -- TABS AND INDENTS
    smartindent = true,  -- Enable better indenting
    tabstop     = 4,     -- Number of space chars for each tab char
    softtabstop = 4,     -- Number of space chars to insert on pressing tab
    shiftwidth  = 4,     -- Number of space chars used when auto-indenting
    expandtab   = true,  -- Replace tabs with spaces when indenting with </>
    -- SEARCHING
    incsearch  = true,   -- HL while typing, smartcase search
    ignorecase = true,   --
    smartcase  = true,   --
    hlsearch   = false,  --
    -- BACKUPS AND SPELLING
    swapfile = false,  --
    backup   = false,  --
    spell    = true,   --
    undofile = true,   --
    undodir  = os.getenv "HOME" .. '/.vim/undodir',
}

local layout_options = {
    -- WINDOW DISPLAY
    splitbelow = true,  -- Open splits below
    splitright = true,  -- Open vsplits on right
    -- LINE DISPLAY
    cursorline    = false,  -- Highlight current line
    scrolloff     = 8,      -- N lines to keep visible above/below cursor
    sidescrolloff = 8,      -- N columns to keep visible left/right of cursor
    textwidth     = 99,     -- Margin for text input
    wrap          = false,  --
    linebreak     = true,   --
    breakindent   = true,   --
    showmatch     = true,   -- Highlight matching brackets
    -- FOLDS
    foldmethod = 'indent',        --
    foldlevel  = 0,               -- Close all folds when opening file
    foldtext   = 'MyFoldText()',  --
    fillchars  = 'fold: ',        --
    -- LEFT MARGIN
    number         = true,     --
    relativenumber = true,     -- Show rel/abs line numbers
    -- signcolumn     = '',  -- Always show sign column beside numbers
    -- RIGHT MARGIN
    colorcolumn = {100},  -- Set vertical margin
    -- BOTTOM MARGIN
    showcmd    = true,  -- Show command in bottom right
    cmdheight  = 2,     --
    wildignore = {'*.pyc', '**/.git/*', '**/data/*'},
    -- TOP MARGIN
    showtabline = 0,
}

-- Apply options
for _, options in pairs({behaviour_options, layout_options}) do
    for k, v in pairs(options) do
        vim.opt[k] = v
    end
end

-- Set colorscheme
opt.termguicolors           = true
opt.background              = 'dark'
g.gruvbox_italic            = 1
g.gruvbox_italicize_strings = 1
g.gruvbox_contrast_dark     = 'hard'
cmd [[colorscheme gruvbox]]

