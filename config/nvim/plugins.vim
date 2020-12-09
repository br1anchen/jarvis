" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" auto-close plugin
Plug 'rstacruz/vim-closer'

" Improved motion in Vim
Plug 'easymotion/vim-easymotion'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'

" abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" caser.vim: Easily change word casing with motions, text objects or visual mode.
Plug 'arthurxavierx/vim-caser'

" Start a * or # search from a visual block
Plug 'nelstrom/vim-visual-star-search'

" Intellisense Engine
" Plug 'neoclide/coc.nvim', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'amiralies/coc-elixir'
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}

" Tmux/Neovim movement integration
Plug 'christoomey/vim-tmux-navigator'

" Denite - Fuzzy finding, buffer management
Plug 'Shougo/denite.nvim'

" Snippet support
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'

" Asynchronous Lint Engine
"Plug 'dense-analysis/ale'
" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'junegunn/gv.vim'
Plug 'jreybert/vimagit'

" === Lanaguage syntax === "
Plug 'sheerun/vim-polyglot'
" === Javascript Plugins === "
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === Syntax Highlighting === "

" Syntax highlighting for nginx
Plug 'chr4/nginx.vim'

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'

" Elixir support for vim
Plug 'elixir-editors/vim-elixir'
" Elixir 1.6 introduced the formatter: mix format
Plug 'mhinz/vim-mix-format'

" ReasonML
Plug 'jordwalke/vim-reasonml'

" Graphql
Plug 'jparise/vim-graphql'

" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

"ALE: Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" Async tasks
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" === UI === "
" File explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Colorscheme
Plug 'flazz/vim-colorschemes'
Plug 'mhartington/oceanic-next'
Plug 'haishanh/night-owl.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'rakr/vim-one'
Plug 'ghifarit53/tokyonight-vim'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" tmux
Plug 'benmills/vimux'

" tag
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Initialize plugin system
call plug#end()
