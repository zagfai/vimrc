"""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:   Zagfai Kwong  @Kingsoft
" Version: 0.3
" Last Change:  Dec 20 2015
" ~/.vimrc
" For Ubuntu Term, base on Ubuntu 14.04
" Need to do:
"    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"    :PluginInstall
"
"    sudo apt-get install vim-gtk # for beautiful
"
"    sudo apt-get install rake ruby-dev # for command-T
"    cd to command-T dir, run command 'rake make'
"""""""""""""""""""""""""""""""""""""""""""""""""""

"***************** Vundle install *******************
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() "call vundle#begin('~/some/path/here')
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'davidhalter/jedi-vim'
Plugin 'SuperTab'
Plugin 'snipMate'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'vim-scripts/pydoc.vim'
Plugin 'pyflakes.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'taglist.vim'
Plugin 'tlib'
Plugin 'L9'
Plugin 'bling/vim-airline'
Plugin 'wincent/Command-T'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}   " HTML writter
Plugin 'Yggdroot/indentLine'
Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'ConqueTerm'                          " ConqueTerm 分屏命令行
"Plugin 'tpope/vim-fugitive'                  " merge git 文件冲突插件
call vundle#end()            " required
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update == :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache


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
    let mapleader = ","
    let g:mapleader = ","

    set autochdir

    set completeopt+=longest
    set completeopt+=menu
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
    set foldlevel=5

    set tabstop=8
    set expandtab
    set shiftwidth=4
    set softtabstop=4
    set modeline

    set mousehide
    "set ruler
    "set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
    set showcmd
    set nu

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

    highlight StatusLine   ctermfg=Black ctermbg=Yellow
    highlight StatusLineNC ctermfg=Gray ctermbg=darkyellow

    " changing the shape of cursor
    if executable("gconftool-2") 
      au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam" 
      au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block" 
      au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block" 
    endif 


"******************** Plugin ************************
    " powerline
        set guifont=PowerlineSymbols\ for\ Powerline
        set laststatus=2
        let g:Powerline_symbols = 'fancy'
        let Powerline_symbols = 'compatible'

    " taglist
        let Tlist_Ctags_Cmd='ctags'
        let Tlist_Show_One_File=1
        let Tlist_WinWidt =28
        "let Tlist_Exit_OnlyWindow=1
        "let Tlist_Use_Right_Window=1 "let Tlist_Use_Left_Windo =1

    " nerdtree
        map <F2> :NERDTree<cr>

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

    " Supertab
        let g:SuperTabRetainCompletionType = 2
        let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
        let g:SuperTabMappingForward="<tab>"

    " NeoCompl
        "let g:neocomplcache_enable_at_startup = 1 
        "let g:neocomplcache_enable_smart_case = 1 
        "let g:neocomplcache_disable_auto_complete = 1 
        " Enable omni completion.
        "autocmd FileType css set omnifunc=csscomplete#CompleteCSS
        "autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
        "autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
        "autocmd FileType python set omnifunc=pythoncomplete#Complete
        "autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
        "autocmd Filetype cpp set omnifunc=cppcomplete#Complete
        "autocmd Filetype c set omnifunc=ccomplete#Complete

    " Snippet
        let g:snips_author = "Zagfai"
    
    " jedi-vim
        "let g:jedi#use_tabs_not_buffers = 1
        let g:jedi#popup_on_dot = 0
        autocmd FileType python setlocal completeopt-=preview
        let g:jedi#goto_command = "<leader>d"
        let g:jedi#goto_assignments_command = "<leader>g"
        let g:jedi#goto_definitions_command = "<leader>f"
        let g:jedi#rename_command = "<leader>r"


"************ Languages Settings *****************
    "************** Python Settings *************
    au! BufRead,BufNewFile *.pyw,*.py set filetype=python
    let g:python_highlight_all = 1
    autocmd Filetype python map <F5> :w<cr>:!clear<cr>:!python %<cr>
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
    nmap <leader>q :qa<cr>
    "nmap <leader>w :w!<cr>
    map <leader>n :nohl<cr>

    "nmap <s-q> <c-w>w:set showcmd<cr>

    " space 
    map <space> za

    map <F2> :NERDTree<cr>
    map <C-TAB> gt
    " nmap gr gT

    " Fx Mapping
    "map <F2> :MarksBrowser<cr>
    "imap <F2> <esc>:MarksBrowser<cr>a
    "map <C-F5> :call Debug()<cr><cr>/main<cr><F1>
    "map <C-F6> :nbclose<cr>:bd (clewn)_console<cr>:set showcmd<cr>
    "map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr><cr>


