" Bootstrap plug.vim
let dir = (has('nvim') ? '~/.config/nvim' : '~/.vim')
if empty(glob(dir . '/autoload/plug.vim'))
  " Download plug.vim
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " Source plug.vim so that the pluig#begin/end calls work below
  source ~/.vim/autoload/plug.vim
  " Call PlugInstall once everything is up
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call functions#setPreVars()
call plug#begin(expand(dir . '/plugged'))

"" ENHANCEMENTS
Plug 'https://github.com/tpope/vim-sensible'    " Sane defaults
Plug 'https://github.com/tpope/vim-rsi'         " Readline shortcuts for insert mode
Plug 'https://github.com/tpope/vim-eunuch'      " Unix commands
Plug 'https://github.com/tpope/vim-vinegar'     " Better netrw
Plug 'https://github.com/tpope/vim-repeat'      " Better dot-repeat action
Plug 'https://github.com/tpope/vim-surround'    " Surrounds (`cs<ch><ch>`, `ys<motion><char>`)
Plug 'https://github.com/tpope/vim-commentary'  " Toggle comments (`gc<motion>`)
Plug 'https://github.com/tpope/vim-unimpaired'  " Extra `[`, `]` mappings
Plug 'https://github.com/tpope/vim-dispatch'    " Asynchronous `:Make` command
Plug 'https://github.com/tpope/vim-sleuth'      " Auto-detect indent in file
Plug 'https://github.com/tpope/vim-fugitive'    " The Ultimate `:Git` plugin (`<leader>c`)
Plug 'https://github.com/tpope/vim-rhubarb'     " GitHub integration for `:GBrowse` (`<leader>b`)

"" ACTIONS
" Conflict highlighting and resolution (`co`/`ct` mappings)
Plug 'https://github.com/rhysd/conflict-marker.vim'
" Sub-word text object (`iv`, `av`)
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/Julian/vim-textobj-variable-segment'
" Entire buffer textobj
Plug 'https://github.com/kana/vim-textobj-entire'
" Easily align selection (`:Tabularize /<char>`)
Plug 'https://github.com/godlygeek/tabular'
" Test
Plug 'https://github.com/vim-test/vim-test'

"" INTERFACE
" Fzf <3 Vim
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'
" Ripgrep
Plug 'https://github.com/jremmen/vim-ripgrep'
" Edit quickfix items in quickfix list
Plug 'https://github.com/stefandtw/quickfix-reflector.vim'
" Gitsigns in signcolumn (and diff hunks popups `<Leader>C`)
Plug 'https://github.com/mhinz/vim-signify'
" Fugitive enhancements
Plug 'https://github.com/sodapopcan/vim-twiggy'
Plug 'https://github.com/junegunn/gv.vim'
" Send lines to tmux (`<C-c><C-c>`)
Plug 'https://github.com/jpalardy/vim-slime'
Plug 'https://github.com/klafyvel/vim-slime-cells'
" Show undotree (`:UndotreeToggle` or `<Leader>u`)
Plug 'https://github.com/mbbill/undotree'
" AI plugin
Plug 'https://github.com/madox2/vim-ai'

"" COMPLETION
" Autocomplete
Plug 'https://github.com/prabirshrestha/asyncomplete.vim'
Plug 'https://github.com/prabirshrestha/asyncomplete-lsp.vim'
Plug 'https://github.com/prabirshrestha/asyncomplete-buffer.vim'
Plug 'https://github.com/prabirshrestha/asyncomplete-file.vim'
Plug 'https://github.com/machakann/asyncomplete-unicodesymbol.vim'
" Tab completion
Plug 'https://github.com/ervandew/supertab'
" Auto-close brackets
Plug 'https://github.com/Raimondi/delimitMate'

"" LANGUAGES
" Lsp servers
Plug 'https://github.com/prabirshrestha/vim-lsp'
Plug 'https://github.com/machakann/vim-lsp-julia'
" Fixers and linters
Plug 'https://github.com/dense-analysis/ale'
" Syntax files
Plug 'https://github.com/sheerun/vim-polyglot'
" Pytest compiler option
Plug 'https://github.com/5long/pytest-vim-compiler'

"" STYLE
" Colorscheme
Plug 'https://github.com/gruvbox-community/gruvbox'
Plug 'rose-pine/vim', { 'as': 'rose_pine' }
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
" Highlight yanked txt
Plug 'https://github.com/machakann/vim-highlightedyank'

call plug#end()
