"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/mru.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'wting/rust.vim'
Plugin 'wincent/Command-T'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'ryanss/vim-hackernews'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kana/vim-vspec'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Plugin Customization {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Tree
"----------
:augroup nerd_tree
:  autocmd StdinReadPre * let s:std_in=1
:  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
:augroup END

" Airline
"--------
let g:airline_powerline_fonts = 1

" Automatically display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => General {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Map leader and localleader
:let mapleader = "\\"
:let maplocalleader = "\\"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => VIM user interface {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set noeb vb t_vb=
set vb t_vb=

" Add a bit extra margin to the left
set foldcolumn=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Colors and Fonts {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

colorscheme solarized
set background=dark

" Fix git-gutter's sign-column contrast issue with dark solarized theme
highlight clear SignColumn

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Default font
" Install patched powerline font: https://github.com/powerline/fonts
set guifont=Inconsolata\ for\ Powerline:h16

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Files, backups and undo {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Turn persistent undo on
" means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Text, tab and indent related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Insert matching closing characters
"inoremap {      {}<Left>
inoremap {      {<CR>}<Esc>O
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}<Left>
inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()<Left>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Visual mode related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Moving around, tabs, windows and buffers {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
:augroup remember_last
:  autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
:augroup END
" Remember info about open buffers on close
set viminfo^=%

" Vimscript code folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevelstart=0
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Status line {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Editing mappings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
:augroup delete_trailing_ws
:  autocmd BufWrite *.py :call DeleteTrailingWS()
:  autocmd BufWrite *.coffee :call DeleteTrailingWS()
:augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Ack searching and cope displaying {{{
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Spell checking {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Misc {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Helper functions {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Experimental mappings {{{
"
" Inspired by Learn Vimscript the Hard Way
" http://learnvimscriptthehardway.stevelosh.com
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open vimrc in a vertial split
"==============================================
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Common typos
"==============================================
:iabbrev adn and
:iabbrev wordl world
:iabbrev witha with a
:augroup text_snippets
:  autocmd FileType mkd :iabbrev <buffer> @
   \ saru<left><left>ga<right>ja<right>hari@gmc<left>ail.<right>om
:augroup END

" Text manipulation
"==============================================
" Surround text with quotes
:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
:nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" :vnoremap <leader>" `<i"<esc>`>i"<esc>
" :vnoremap <leader>' `<i'<esc>`>i'<esc>

" Navigation
"==============================================
:nnoremap H ^
:nnoremap L $

" Mode change
"==============================================
:inoremap jk <esc>
:vnoremap jk <esc>

" Flush out muscle memory
:inoremap <esc> <nop>

" Autocmd
"==============================================
:augroup code_snippets
:  autocmd FileType python     :iabbrev <buffer> iff if:<left>
:  autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
:  autocmd FileType javascript :iabbrev <buffer> fn function
:  autocmd FileType javascript :iabbrev <buffer> function XXXXXXXX
:  autocmd FileType ruby       :iabbrev <buffer> iff if<enter>end<up>
:  autocmd FileType ruby       :iabbrev <buffer> def def<enter>end<up>
:augroup END

:augroup code_comments
:  autocmd FileType vim        nnoremap <buffer> <localleader>c I" <esc>
:  autocmd FileType python     nnoremap <buffer> <localleader>c I# <esc>
:  autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
:augroup END

" Operator pending audocmds
"--------------------------
:augroup markdown_text
"  Inside header
:  autocmd FileType mkd :onoremap <buffer> ih :<c-u>execute
     \ "normal! ?^[=-]\\{3,}$\r:nohlsearch\rkvg_"<cr>

"  Around header
:  autocmd FileType mkd :onoremap <buffer> ah :<c-u>execute
     \ "normal! ?^[=-]\\{3,}$\r:nohlsearch\rg_vk0"<cr>
:augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
