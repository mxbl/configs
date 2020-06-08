" Plugins {{{
call plug#begin('~/.nvim/plugged')
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'nightsense/vimspectr'
Plug 'terryma/vim-multiple-cursors'
Plug 'mbbill/undotree'
Plug 'justinmk/vim-syntax-extra'
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'AndrewRadev/bufferize.vim'
" ready to clean up ??
"Plug 'junegunn/vim-easy-align'
"Plug 'luochen1990/rainbow'
"Plug 'dag/vim-fish'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'joshdick/onedark.vim'
"Plug 'majutsushi/tagbar'
call plug#end()
" }}}
" {{{Plugin Settings
" Nerdtree
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1        " Show hidden files
let g:NERDTreeQuitOnOpen=0      " close NT after a file is opened
let g:rainbow_active = 1
" }}}
" General Settings {{{
filetype plugin indent on
set shell=/bin/zsh  " don't use fish here ??
set expandtab		" use spaces instead of tabs
set smarttab		" insert tabs on the start of a line according to shiftwidth, not tabstop
set shiftwidth=4 	" 1 tab == 4 spaces
set tabstop=4
set autoindent      " auto indent
set smartindent	    " smart indent
set nowrap
set nobackup        " turn backup off
set nowb
set noswapfile
set scrolloff=7
set sidescrolloff=7
set novisualbell    " don't beep
set noerrorbells    " don't beep
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hidden          " hide buffers instead of closing them
set autowrite
set autoread
set gdefault        " use 'g' flag by default with :s/foo/bar/
"set nohlsearch
set splitbelow
set splitright
set nostartofline   " Do not jump to first character with page commands
set undodir=~/.vimundo/
set undofile
set mouse=a         " enable mouse to select windows
set path+=**
set wildmenu
" }}}
" Folding {{{
set foldenable
autocmd FileType vim,tmux,conf,sh,zsh,text,lua,markdown,xdefaults setlocal foldmethod=marker
autocmd FileType python setlocal foldmethod=indent
nnoremap ff za
nnoremap fa zA
nnoremap fm zM
nnoremap f[ [z
nnoremap f] ]z
" }}}
" Airline {{{
"let g:airline_powerline_fonts = 1
"let g:airline_theme="dark"
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_section_c = airline#section#create(['%t'])
"if !exists('g:airline_mode_map')
"    let g:airline_mode_map = {
"        \ '__' : '------',
"        \ 'n'  : 'N',
"        \ 'i'  : 'INSERT',
"        \ 'R'  : 'REPLACE',
"        \ 'v'  : 'VISUAL',
"        \ 'V'  : 'V-LINE',
"        \ 'c'  : 'COMMAND',
"        \ '' : 'V-BLOCK',
"        \ 's'  : 'SELECT',
"        \ 'S'  : 'S-LINE',
"        \ '' : 'S-BLOCK',
"        \ 't'  : 'TERMINAL',
"        \ }
"else
"    let g:airline_mode_map.n = 'N' " Normal mode
"    let g:airline_mode_map.t = 'T' " Terminal mode
"endif

" }}}
" Colors and Appearance {{{
" https://github.com/Michal-Miko/vim-mono-red -> ~/.config/nvim/colors/
colorscheme mono_red 
syntax enable
set fillchars=vert:│
set relativenumber
set number
set background=dark
set showmatch        " show matching brackets
set showmode         " don't show mode because airline shows it already
set showcmd
set cursorline
set list
set listchars=eol:¬,space:·,trail:~

hi VertSplit    ctermbg=Black ctermfg=Red cterm=bold
hi LineNr       ctermbg=Black ctermfg=235
hi CursorLineNr ctermbg=Black ctermfg=Red
hi Normal       ctermbg=Black
hi Character    ctermbg=NONE
hi CursorLine                 ctermfg=NONE
hi ModeMsg                    ctermfg=Green
hi MatchParen   ctermbg=NONE  ctermfg=31
hi NonText                    ctermfg=237

" Tabs
hi TabLine      ctermbg=234
hi TabLineFill  ctermbg=Black
hi TabLineSel   ctermbg=31

hi TODO  ctermfg=190  ctermbg=NONE cterm=NONE
hi FIXME ctermfg=190  ctermbg=NONE cterm=NONE

" FIXME ain't working ??
"hi StatusLine          ctermfg=231  ctermbg=197  cterm=bold       guifg=#eeeeee  guibg=#ff005f  gui=bold
"hi StatusLineNC        ctermfg=231  ctermbg=204  cterm=bold       guifg=#eeeeee  guibg=#ff5f87  gui=bold
"hi StatusLine   ctermbg=NONE  ctermfg=235
"hi StatusLineNC ctermbg=Black ctermfg=235

" gitgutter colors
hi GitGutterAdd          ctermbg=NONE ctermfg=Green
hi GitGutterChange       ctermbg=NONE ctermfg=White
hi GitGutterDelete       ctermbg=NONE ctermfg=Red
hi GitGutterChangeDelete ctermbg=NONE ctermfg=Red

" ready to clean up ??
"hi Folded       ctermfg=DarkGreen ctermbg=NONE
"hi Visual       ctermfg=Black     ctermbg=31
"hi ErrorMsg     ctermfg=Red       ctermbg=NONE
"hi MsgArea      ctermfg=Green
"hi IncSearch    ctermbg=LightGreen
"hi Search       ctermbg=LightMagenta
" }}}
" Keybindings {{{
" Miscellaneous
map <C-j> :call TmuxAwareSwitchWindow("j")<CR>
map <C-k> :call TmuxAwareSwitchWindow("k")<CR>
map <C-l> :call TmuxAwareSwitchWindow("l")<CR>
map <C-h> :call TmuxAwareSwitchWindow("h")<CR>

" leave insert mode with `jk`
inoremap jk <esc>

"easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>

"undotree
nnoremap ut :UndotreeToggle<CR>

nnoremap / /\v

" goto beginning and end of line
noremap H ^
noremap L g_

" toggle between open and closing parentheses
nnoremap <tab> %
vnoremap 5 %

" execute default register
nnoremap Q @q

inoremap <C-f> <Right>
inoremap <C-b> <Left>

" Grep word under cursor with ripgrep
nnoremap K :Rg<CR>

" }}}
" Leader Shortcuts {{{
let mapleader = "\<Space>"

map <leader>k :wq<CR>
map <leader>w :wa<CR>

" windows
map <leader>s :split<CR>
map <leader>v :vsplit<CR>
map <leader>o :only<CR>

" tabs
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
map <leader>u  :tabp<CR>
map <leader>i  :tabN<CR>
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt

" toggle between current and last buffer
nmap <leader>. <c-^>

" edit vimrc quickly
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" search and replace
vnoremap <leader>r :s//<Left>

" save and run last command in other tmux pane
nnoremap <leader>r :w<CR>:call <SID>TmuxRepeat()<CR>

" Ctrl-p shortcuts
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
"nnoremap <leader>r :CtrlPMRUFiles<CR>

" execute the q macros
nnoremap <leader>m @q

" tagbar
nnoremap <leader>tb :TagbarToggle<CR>

nnoremap <leader>q q:
" }}}
" Functions {{{
function! s:TmuxRepeat()
    silent! exec "!tmux select-pane -l && tmux send up enter && tmux select-pane -l"
    redraw!
endfunction
" }}}
" Terminal Mode {{{
tnoremap <Esc> <C-\><C-n>
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap ii <C-\><C-n>:tabN<CR>
tnoremap uu <C-\><C-n>:tabp<CR>
" }}}
" StatusLine {{{
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endf
function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endf
set stl=
set stl+=%#PmenuSel#
set stl+=%{StatuslineGit()}
set stl+=\ %f%m
set stl+=\ %=
set stl+=\ %y
set stl+=\ %{&fileencoding?&fileencoding:&encoding}
set stl+=\[%{&fileformat}\]
set stl+=\ %l/%L[%p%%]
set stl+=\ 
" }}}

" use emmet just in html and css mode
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-E>'

let g:notes_directories = ['~/docs/notes']

augroup asm_ft
    au!
    autocmd BufNewFile,BufRead *.asm,*.s set ft=nasm 
augroup END

function! TmuxAwareSwitchWindow(direction)
    " clear the call command 
    echo "" 
    let current = winnr()
    execute 'wincmd ' . a:direction
    if winnr() != current
        " successfully moved to another window
    else
        if a:direction == "l"
            silent !tmux select-pane -R
        elseif a:direction == "h"
            silent !tmux select-pane -L
        elseif a:direction == "j"
            silent !tmux select-pane -D
        elseif a:direction == "k"
            silent !tmux select-pane -U
        endif
    endif
endf
