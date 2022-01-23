-- Select plugins to load
configs = require('configs')  -- ~/.config/nvim/lua/configs.lua
PLUGINS = function()
    use 'wbthomason/packer.nvim'

    use {  -- Colorscheme
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"},
        config = configs.gruvbox,
    }

    use {  -- Extensible Fuzzy finder
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-bibtex.nvim',
        },
        config = configs.telescope,
    }

    use {  -- LSP Engine configuration
        'neovim/nvim-lspconfig',
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/nvim-lsp-installer",
            'https://gitlab.com/yorickpeterse/nvim-pqf',
        },
        config = configs.lspconfig,
    }

    use {  -- Autocompletion menu
        "hrsh7th/nvim-cmp",
        requires = {
            -- "dcampos/nvim-snippy",
            -- "honza/vim-snippets",
            "onsails/lspkind-nvim",
            "windwp/nvim-autopairs",
            -- "dcampos/cmp-snippy",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "kdheepak/cmp-latex-symbols",
        },
        config = configs.cmp,
    }

    use {  -- Treesitter
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'romgrk/nvim-treesitter-context',
            'lewis6991/spellsitter.nvim',
            "SmiteshP/nvim-gps",
        },
        run = ':TSUpdate',
        config = configs.treesitter,
    }

    use {  -- Better File explorer
        "tamago324/lir.nvim",
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        config = configs.lir,
    }

    use {  -- Better terminals
        "akinsho/toggleterm.nvim",
        requires = {'jpalardy/vim-slime'},
        config = configs.toggleterm,
    }

    use {  -- Better git interactions
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'tpope/vim-fugitive',
            'tpope/vim-rhubarb',
            'junegunn/gv.vim',
        },
        config = configs.gitsigns,
    }

    use {  -- Better statusline
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = configs.lualine,
    }

    -- use {  -- Landing page
    --     'goolord/alpha-nvim',
    --     config = configs.alpha,
    -- }

    use {  -- Colors Hex codes
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup({'*'}, {names=false}) end
    }

    use {  -- Indent guides
        "lukas-reineke/indent-blankline.nvim",
        requires = {"lukas-reineke/virt-column.nvim"},
        config = configs.indent_blankline,
    }

    use {  -- Better f/t targets
        "unblevable/quick-scope",
        config = configs.quickscope,
    }

    use {  -- Firefox injection
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end,
        config = configs.firenvim,
    }

    -- use {  -- Notes plugin
    --     'jakewvincent/mkdnflow.nvim',
    --     config = configs.mkdnflow,
    -- }

    -- use {
    --     'lervag/wiki.vim',
    --     -- requires = {'jakewvincent/mkdnflow.nvim',}
    --     config = configs.wiki,
    -- }

    use {
        "folke/zen-mode.nvim",
        requires = {"folke/twilight.nvim"},
        config = function() require("zen-mode").setup({}) end
    }

    use {  -- iv/av: Text objects for substrings in snake/camel/kebab case
        'Julian/vim-textobj-variable-segment',
        requires = {'kana/vim-textobj-user'}
    }

    use {
        "winston0410/range-highlight.nvim",
        config = function() require('range-highlight').setup({}) end,
        requires = {'winston0410/cmd-parser.nvim'}
    }

    use {
        "jbyuki/venn.nvim",
        config = configs.venn,
    }

    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require("null-ls").setup({
                sources = {
                    require("null-ls").builtins.formatting.yapf,
                },
            })
        end,
    }

    use {
        'rmagatti/auto-session',
        config = function()
            require('auto-session').setup {
                log_level = 'info',
                auto_session_suppress_dirs = {'~/', '~/Projects'}
            }
        end
    }

    use {
        'abecodes/tabout.nvim',
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true, -- shift content if tab out is not possible
                act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                enable_backwards = true, -- well ...
                completion = true, -- if the tabkey is used in a completion pum
                tabouts = {
                    {open = "'", close = "'"},
                    {open = '"', close = '"'},
                    {open = '`', close = '`'},
                    {open = '(', close = ')'},
                    {open = '[', close = ']'},
                    {open = '{', close = '}'}
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {} -- tabout will ignore these filetypes
            }
        end,
        wants = {'nvim-treesitter'}, -- or require if not used so far
        after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
    }

    use {  -- Smaller plugins
        'tpope/vim-repeat',                           -- Better .-repeat actions
        'tpope/vim-surround',                         -- cs]} : Change surrounding brackets
        'tpope/vim-commentary',                       -- gc<motion> : toggle comments
        'tpope/vim-abolish',                          -- crs : coerce cursor work to snake_case
        'alec-gibson/nvim-tetris',                    -- :Tetris
        'danilamihailov/beacon.nvim',                 -- Ping cursor location after jump
        'wellle/targets.vim',                         -- More text objects
        'tommcdo/vim-lion',                           -- align selection with gl<obj><char>
        'Vimjas/vim-python-pep8-indent',              -- Fix for auto-indent in treesitter
        'jbyuki/nabla.nvim',
        'sheerun/vim-polyglot',                       -- Language pack to use if TS not present
    }
end

DISABLED_BUILT_INS = {
    'netrw',
    'netrwPlugin',
    'gzip',
    'man',
    'shada_plugin',
    'tarPlugin',
    'tar',
    'zipPlugin',
    'zip',
    'netrwPlugin',
    'tutor_mode_plugin',
    'remote_plugins',
    'spellfile_plugin',
    '2html_plugin',
}

M = {}

M.setup_packer = function()
    local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    local packer_url = 'https://github.com/wbthomason/packer.nvim'

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        install_cmd = table.concat({'!git clone', packer_url, install_path}, ' ')
        vim.fn.execute(install_cmd)
    end

    -- Update plugins after saving changes to plugins.lua
    vim.api.nvim_exec([[
        augroup Packer
            autocmd!
            autocmd BufWritePost plugins.lua source <afile> | PackerCompile
            autocmd BufWritePost configs.lua source <afile> | PackerCompile
        augroup end
    ]], false)
end

M.disable_built_ins = function()
    for _, i in pairs(DISABLED_BUILT_INS) do
      vim.g['loaded_' .. i] = 1
    end
end

M.load_plugins = function()
    return require('packer').startup(PLUGINS)
end

return M

