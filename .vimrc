"""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:   Zagfai Kwong
" Version: 0.5
" Last Change:  Mar 16 2021
" ~/.vimrc
" For Ubuntu Term, base on Ubuntu 20.04
" Need to do:
"    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"    :PluginInstall
"
"    sudo apt-get install vim-gtk # for beautiful
"
"    sudo apt-get install rake ruby-dev # for command-T
"    cd to command-T dir, run command 'rake make'
"
"    cd to tabnine-vim, python3 install.py
"""""""""""""""""""""""""""""""""""""""""""""""""""

"***************** Vundle install *******************
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() "call vundle#begin('~/some/path/here')
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale' " syn spill check
Plugin 'ervandew/supertab'
Plugin 'Chiel92/vim-autoformat'

"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"Plugin 'Valloric/YouCompleteMe'
Plugin 'zxqfl/tabnine-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/DirDiff.vim'
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'wincent/Command-T'
Plugin 'dhruvasagar/vim-table-mode'

Plugin 'vim-scripts/pydoc.vim'

call vundle#end()            " required
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update == :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"
"Plugin 'ervandew/supertab'
"Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'vim-scripts/pydoc.vim'
"Plugin 'pyflakes.vim'
"Plugin 'pangloss/vim-javascript'
"Plugin 'taglist.vim'
"Plugin 'tlib'
"Plugin 'L9'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}   " HTML writter
"Plugin 'ConqueTerm'                          " ConqueTerm 分屏命令行
"Plugin 'tpope/vim-fugitive'                  " merge git 文件冲突插件


"********************* Basic ************************
    set nocompatible
    set langmenu=en_US "zh_CN
    language message C "en_US
    set encoding=utf8
    let &termencoding=&encoding
    set imcmdline
    set fenc=utf-8
    set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
    set t_Co=256

    set clipboard=unnamedplus
    set history=1000
    set mouse=v
    "if executable("gconftool-2")
    "set mouse=a
    "endif
    let mapleader = ","
    let g:mapleader = ","

    set autochdir

    set completeopt+=longest
    set completeopt+=menu
    "set completeopt-=preview
    set wildmenu


"********************* View *************************
    "set guifont=Mono\ 13
    set t_Co=256
    set shortmess=at "I

    set backspace=indent,eol,start
    set whichwrap+=<,>,h,l,b,s
    set iskeyword+=_,$,@,%,#,-
    set smartindent

    set foldmethod=indent
    set foldlevel=8

    set tabstop=8
    set expandtab
    set shiftwidth=4
    set softtabstop=4
    set modeline

    set mousehide
    set ruler
    set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
    set showcmd
    set nu
    set relativenumber

    "set listchars=tab:'`,trail:`
    "set list

    set ignorecase
    set incsearch
    set hlsearch

    syntax enable
    syntax on
    filetype plugin indent on
    set background=dark
    colorscheme slate

    "highlight StatusLine   ctermfg=Black ctermbg=Yellow
    "highlight StatusLineNC ctermfg=Gray ctermbg=darkyellow

    " changing the shape of cursor
    if has("autocmd")
          au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
            au InsertEnter,InsertChange *
                \ if v:insertmode == 'i' |
                \   silent execute '!echo -ne "\e[5 q"' | redraw! |
                \ elseif v:insertmode == 'r' |
                \   silent execute '!echo -ne "\e[3 q"' | redraw! |
                \ endif
              au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
          endif

    if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif

    let g:html_indent_script1 = "inc"
    let g:html_indent_style1 = "inc"
    let g:html_indent_inctags = "html,body,head"


"******************** Plugin ************************
    " powerline
        set guifont=PowerlineSymbols\ for\ Powerline
        set laststatus=2
        let g:Powerline_symbols = 'fancy'
        let Powerline_symbols = 'compatible'

    " rainbow_parentheses
        let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
        let g:rbpt_max = 16
        let g:rbpt_loadcmd_toggle = 0
        au VimEnter * RainbowParenthesesToggle
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au Syntax * RainbowParenthesesLoadBraces

    " Snippet
        let g:snips_author = "Zagfai"

    " Supertab
        "let g:SuperTabRetainCompletionType = 2
        "let g:SuperTabDefaultCompletionType = '<c-o>'
        "let g:SuperTabDefaultCompletionType = 'context'
        "let g:SuperTabMappingForward='<tab>'
        "let g:SuperTabMappingBackward='<s-tab>'
        "let g:SuperTabClosePreviewOnPopupClose = 1

    " ale  - Check Python files with flake8 and pylint.
        let b:ale_linters = ['flake8', 'pylint']
        " Fix Python files with autopep8 and yapf.
        let b:ale_fixers = ['autopep8', 'yapf']
        " Disable warnings about trailing whitespace for Python files.
        let b:ale_warn_about_trailing_whitespace = 0
        "highlight ALEWarning ctermbg=DarkMagenta
        let g:ale_python_pylint_options = '--rcfile ./pylint.rc'
        let g:ale_python_pylint_executable = 'python3'
        " let g:ale_echo_cursor = 0

    " folder
        let g:SimpylFold_docstring_preview=1

    " YCM
        let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
        let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
        let g:ycm_python_binary_path='python3'
        let g:ycm_autoclose_preview_window_after_completion=1

    " Ultisnips
        let g:UltiSnipsExpandTrigger = "<tab>"
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
        let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

    " Supertab
        let g:SuperTabDefaultCompletionType = '<c-n>'

    " NerdTree
    " enable line numbers
    let NERDTreeShowLineNumbers=1
    " make sure relative line numbers are used
    autocmd FileType nerdtree setlocal relativenumber


"************ Languages Settings *****************
    "************** Python Settings *************
    au! BufRead,BufNewFile *.pyw,*.py set filetype=python
    let g:python_highlight_all = 1
    autocmd Filetype python map <F5> :w<cr>:!clear<cr>:!python3 %<cr>
    autocmd Filetype python map <F6> :w<cr>:!clear<cr>:!python %<cr>
    autocmd Filetype python map <F7> :w<cr>:!clear<cr>:!python3 server.py -t test -p 8000%<cr>
    "autocmd Filetype python map <F3> :ConqueTermVSplit ipython<cr>
    "autocmd Filetype python colorscheme wombat256

    "*************** IO Settings *************
    au! BufRead,BufNewFile *.io set filetype=io
    autocmd Filetype io map <F5> :w<cr>:!clear<cr>:!io %<cr>

    "*************** C/C++ Settings *************
    au! BufRead,BufNewFile *.cpp set filetype=cpp
    au! BufRead,BufNewFile *.c set filetype=c
    autocmd Filetype c map <F5> :w<cr>:!clear<cr>:!gcc % -o %.out<cr>
    autocmd Filetype cpp map <F5> :w<cr>:!clear<cr>:!g++ -Wall % -o %.out<cr>
    autocmd Filetype c,cpp map <F6> :w<cr>:!clear<cr>:!./%.out<cr>

    "**************** Tex Settings **************
    au! BufRead,BufNewFile *.tex set filetype=tex
    autocmd Filetype tex map <F5> :w<cr>:!clear<cr>:!xelatex %<cr>
    autocmd Filetype tex map <F6> :w<cr>:!xdg-open %:r.pdf<cr>

    "*************** Bash Settings **************
    au! BufRead,BufNewFile *.sh set filetype=sh
    autocmd Filetype sh map <F5> :w<cr>:!clear<cr>:!bash %<cr>

    "**************** Dot Settings **************
    au! BufRead,BufNewFile *.dot set filetype=dot
    autocmd Filetype dot map <F5> :w<cr>:!clear<cr>:!dot -Tpng % -o %:r.png<cr>
    autocmd Filetype dot map <F6> :w<cr>:!xdg-open %:r.png<cr>

    "**************** js Settings ***************
    "au! BufRead,BufNewFile *.js set filetype=js
    autocmd Filetype javascript map <F5> :w<cr>:!clear<cr>:!phantomjs %<cr>


"****************** Mapping **********************
    map <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
    map <leader>D <C-o>
    nmap <leader>q :q<cr>
    nmap <leader>Q :qa<cr>
    map <leader>n :nohl<cr>

    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

    " space
    map <space> za

    map <F2> :NERDTree<cr>
    map <F3> :CommandT<cr>
    "map <C-TAB> gt
    " nmap gr gT

    " Fx Mapping
    "map <F2> :MarksBrowser<cr>
    "imap <F2> <esc>:MarksBrowser<cr>a
    "map <C-F5> :call Debug()<cr><cr>/main<cr><F1>
    "map <C-F6> :nbclose<cr>:bd (clewn)_console<cr>:set showcmd<cr>
    "map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr><cr>

