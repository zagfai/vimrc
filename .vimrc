"""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:   Zagfai Kwong    @FOSU
" Version: 0.1
" Last Change:  July 24, 2012
"       
" ~/.vimrc
" For Ubuntu Term
"
" Needed:
"       sudo apt-get install vim-gtk ----- for yank
"""""""""""""""""""""""""""""""""""""""""""""""""""

"******************** Basic **********************
    set nocompatible
    set langmenu=en_US "zh_CN
    language message C "en_US
    set encoding=utf8
    let &termencoding=&encoding
    set imcmdline
    set fenc=utf-8
    set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

    set clipboard=unnamedplus
    set history=100
    set mouse=a
    let mapleader = ","
    let g:mapleader = ","

    " this!
    set nobackup

"***************** Files about *******************
    set tags+=./tags,./../tags,./*/tags,/home/zagfai/.vim/stltags
    set autochdir

    set completeopt+=longest
    set completeopt+=menu
    set wildmenu

    filetype on
    filetype plugin on

"******************** View ***********************
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
    set ruler
    "set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
    set showcmd
    set nu
    "
    "set listchars=tab:'`,trail:`
    "set list

    set ignorecase
    set incsearch
    set hlsearch

"**************** Colorful World *****************
    syntax enable
    syntax on
    set background=dark
    colorscheme slate 

    highlight StatusLine   ctermfg=Black ctermbg=Yellow
    highlight StatusLineNC ctermfg=Gray ctermbg=darkyellow

    " f**king code for gnome, changing the shape of cursor
    if has("autocmd") 
      au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam" 
      au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block" 
      au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block" 
    endif 

"************** Plugin Settings ******************
    " ConqueTerm
    "    ConqueTerm
    "    ConqueTermSplit
    "    ConqueTermVSplit
    "    ConqueTermTab

    " Pathogen
        call pathogen#infect()

    " Supertab
        let g:SuperTabRetainCompletionType = 2
        let g:SuperTabDefaultCompletionType = "<C-X><C-U>" 

    "-- omnicppcomplete setting --
        set completeopt=menu,menuone
        let OmniCpp_MayCompleteDot = 1 " autocomplete with .
        let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
        let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
        let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
        let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
        let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype  in popup window
        let OmniCpp_GlobalScopeSearch=1
        let OmniCpp_DisplayMode=1
        let OmniCpp_DefaultNamespaces=["std"]

    " NeoCompl
        let g:neocomplcache_enable_at_startup = 1 
        let g:neocomplcache_enable_smart_case = 1 
        let g:neocomplcache_disable_auto_complete = 1 
        " Enable omni completion.
        autocmd FileType css set omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python set omnifunc=pythoncomplete#Complete
        autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
        "autocmd Filetype cpp set omnifunc=cppcomplete#Complete
        "autocmd Filetype c set omnifunc=ccomplete#Complete

    " BufExplorer
        let g:bufExplorerDefaultHelp=0       " Do not show default help.
        let g:bufExplorerShowRelativePath=1  " Show relative paths.
        let g:bufExplorerSortBy='mru'        " Sort by most recently used.

    "NERDTree
        "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"************ Languages Settings *****************
    "************** Python Settings *************
    au! BufRead,BufNewFile *.pyw,*.py set filetype=python
    let g:python_highlight_all = 1
    autocmd Filetype python map <F5> :w<cr>:!clear<cr>:!python %<cr>
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


"****************** Mapping **********************
    " leader keys
    nmap <leader>q :qa!<cr>
    nmap <leader>w :w!<cr>
    map <leader>n :nohl<cr>

    nmap <s-q> <c-w>w:set showcmd<cr>

    " space 
    map <space> za

    map <C-TAB> gt
    nmap gr gT

    " Fx Mapping
    map <F2> :NERDTree<cr>
    "map <F2> :MarksBrowser<cr>
    "imap <F2> <esc>:MarksBrowser<cr>a
    "map <F3> :LUWalk<cr><cr>
    "map <C-F5> :call Debug()<cr><cr>/main<cr><F1>
    "map <C-F6> :nbclose<cr>:bd (clewn)_console<cr>:set showcmd<cr>
    map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr><cr>


"autocmd! bufwritepost .vimrc source ~/.vimrc
