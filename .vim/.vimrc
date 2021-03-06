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

Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'alvan/vim-closetag'
Plugin 'aperezdc/vim-template'
Plugin 'chiedojohn/vim-case-convert'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'darthmall/vim-vue'
Plugin 'elixir-lang/vim-elixir'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/limelight.vim'
Plugin 'jgdavey/vim-blockle'
Plugin 'jpalardy/vim-slime'
Plugin 'junegunn/goyo.vim'
Plugin 'kana/vim-vspec'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mtth/scratch.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'raimondi/delimitMate'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'sirver/ultisnips'
Plugin 'terryma/vim-expand-region'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/mru.vim'
Plugin 'wlangstroth/vim-racket'
Plugin 'wting/rust.vim'
Plugin 'yggdroot/indentLine'

" Clojure
Plugin 'guns/vim-clojure-static'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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
:let mapleader = ","
:let maplocalleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Plugin Customization {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"==============================================
let g:airline_powerline_fonts = 1

" Disable whitespace extension
let g:airline#extensions#whitespace#enabled = 0


" Automatically display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Use shortform text for modes
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

" Defaut Airline theme
let g:airline_theme = 'bubblegum'

" The Silver Searcher (Ag)
"==============================================
" Bind K to search word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>
" TODO add vmode key to search selected text
" vnoremap K :Ag `<i"<esc>`>i"<esc>

" CtrlP
"==============================================
" Set local working directory while searching files
" r - the nearest ancestor that contains one of these directories or files:
"      .git .hg .svn .bzr _darcs, and your own root markers defined with the
"      g:ctrlp_root_markers option.
" a - the directory of the current file, but only applies when the current
"      working directory outside of CtrlP isn't a direct ancestor of the
"      directory of the current file.
" w - begin finding a root from the current working directory outside of CtrlP
"      instead of from the directory of the current file (default). Only applies
"      when "r" is also present.
let g:ctrlp_working_path_mode = 'rwa'

" For macvim change CtrlP mapping to Cmd + t
" For this, first free the gui mapping in gvimrc
" if has ("gui_macvim")
"   let g:ctrlp_map = '<D-t>'
" else
"   let g:ctrlp_map = '<Leader>t'
" endif

" List files using git ls-files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']

" Placement of window, order and size of file list
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'

" MRU Mode
nnoremap <Leader>m :CtrlPMRU<CR>
nnoremap <Leader>t :CtrlP<CR>

" Expand Region
"==============================================
" Expand region in visual mode by repeating 'v'
vmap v <Plug>(expand_region_expand)

" Scratch
"==============================================
let g:scratch_horizontal = 0        " Vertical window
let g:scratch_top = 0               " Rigt side
let g:scratch_insert_autohide = 0   " Do not hide on leaving insert mode
let g:scratch_filetype = 'ruby'     " Default filetype for syntax highlight
let g:scratch_height = 0.3

" NERDTree
"==============================================
" Open nerd tree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open bookmarks automatically
let NERDTreeShowBookmarks=1

" Change working directory each time nerdtree's root changes
let NERDTreeChDirMode=2

" Autoclose NERDTree after opening file
let NERDTreeQuitOnOpen = 1

" Close vim if nerdtree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&
      \ b:NERDTreeType == "primary") | q | endif

" Shortcut for NERDTreeFind
nnoremap ;; :NERDTreeFind<cr>

" Vim Template
"==============================================
" Set folder for global template search
let g:templates_directory = ['~/dot_files/.vim/templates']

" Plasticboy/markdown
"==============================================
let g:vim_markdown_folding_disabled=1

" Vim-Slime
"==============================================
let g:slime_target = "tmux"

" Easier command than C-c C-c
:nnoremap <leader>v :SlimeSend<cr>
:vnoremap <leader>v :'<,'>SlimeSend<cr>

" DelimitMate
"==============================================
" Do not autocomplete '<' so that vim-closetag can be used
:let delimitMate_matchpairs = "(:),[:],{:}"

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<down>"
let g:UltiSnipsJumpBackwardTrigger="<up>"

" Limelight
"==============================================
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

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
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hidden

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

" When copying/cutting use the system clipboard
set clipboard=unnamed

" When pasting, yank back the selection to paste again
xnoremap p pgvy

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Cursor, Colors and Fonts {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme solarized
set background=dark

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
set guifont=Inconsolata\ for\ Powerline:h15

" Customize the cursor and selection
highlight Visual guifg=darkolivegreen4 guibg=black
highlight Cursor guifg=black guibg=green
set guicursor=
      \n:hor10-Cursor/lCursor,
      \v:hor10-Cursor/lCursor-blinkoff0,
      \ve:ver35-Cursor,
      \o:hor50-Cursor,
      \c:ver20-Cursor/lCursor,
      \i-ci:ver15-Cursor/lCursor-blinkon0,
      \r-cr:hor20-Cursor/lCursor,
      \sm:block-Cursor-blinkwalt175-blinkoff150-blinkon175

" Change cursor shape between insert and normal mode in iTerm2.app
if exists('$TMUX')
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
elseif $TERM_PROGRAM =~ "iTerm"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
endif

" MatchParen color
highlight MatchParen guifg=white guibg=NONE

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

" Delete current file and close buffer
" Note: Buffer is NOT deleted, so file can be retrieved
:nnoremap <C-BS> :call delete(expand('%')) \| Bclose<CR>

" My left pinkie hurts because of using <shift> so often for all ':' commands
nmap <leader><leader> :update<CR>
" Flush out muscle memory :)
:cnoremap w<CR> <nop>

" Autosave
:set autowrite

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
" inoremap {      {}<Left>
" inoremap {      {<CR>}<Esc>O
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}<Left>
" inoremap (      ()<Left>
" inoremap (<CR>  (<CR>)<Esc>O
" inoremap ((     (
" inoremap ()     ()<Left>

" Highlight the column after 80 chars
set textwidth=80
:set colorcolumn=+1  " highlight one columns after 'textwidth'

" Instant rewrap
nnoremap œ gq}       " This is the <Alt-q> Combination

" Copy relative and full filename of buffer
noremap <silent> <leader>y :let @+=expand("%")<CR>
noremap <silent> <leader>Y :let @+=expand("%:p")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Visual mode related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Allow pressing '.' in visual mode
vnoremap . :norm.<CR>


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

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

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

" Configuration files code folding
augroup filetype_conf
    autocmd!
    autocmd FileType conf setlocal foldmethod=marker
    autocmd FileType conf setlocal foldlevelstart=0
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
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vnoremap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nnoremap <D-j> <M-j>
  nnoremap <D-k> <M-k>
  vnoremap <D-j> <M-j>
  vnoremap <D-k> <M-k>
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
" vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
" map <leader>g :Ack

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
" map <leader>cc :botright cope<cr>
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Spell checking {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <eader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Misc {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

augroup filetype_pl
  autocmd BufEnter * if &filetype == "perl" | setlocal filetype=prolog | endif
augroup END

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
" => GitGutter fixes {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter will use Sign Column to set its color, reload it.
call gitgutter#highlight#define_highlights()

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

" Auto expansions
"==============================================
:augroup text_snippets
:  autocmd FileType mkd :iabbrev <buffer> @
   \ saru<left><left>ga<right>ja<right>hari@gmc<left>ail.<right>om
:augroup END

" Insert current date and time
:iabbrev <expr> dts strftime("%x %X (%Z)")

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
:inoremap JK <esc>
" Change escape key otherwise visual selection becomes difficult
:vnoremap <enter> <esc>

" Flush out muscle memory
:inoremap <esc> <nop>
:vnoremap <esc> <nop>

" Autocmd
"==============================================
:augroup code_snippets
:  autocmd FileType python     :iabbrev <buffer> iff if:<left>
:  autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
:augroup END

:augroup fold_levels
:  autocmd FileType mkd        setlocal foldlevel=3
:augroup END

:augroup ruby
"  Add focus to tests
:  autocmd FileType ruby :nnoremap ff :s/\"\sdo/\"\, focus\: true do/<enter>:let @/=""<enter>

"  PUTS the caller (http://tenderlovemaking.com/2016/02/05/i-am-a-puts-debuggerer.html)
:  autocmd FileType ruby nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>
:augroup END

:augroup javascript
" Add/Remove console.log
:  autocmd FileType javascript :nnoremap ff oconsole.log("");<left><left><left>
:augroup END

:augroup gitrebase
  " Fixup during rebase
:  autocmd FileType gitrebase :nnoremap ff :s/^pick/f/<enter>j
:augroup END

" Operator pending audocmds
"==============================================
:augroup markdown_text
"  Inside header
:  autocmd FileType mkd :onoremap <buffer> ih :<c-u>execute
     \ "normal! ?^[=-]\\{3,}$\r:nohlsearch\rkvg_"<cr>

"  Around header
:  autocmd FileType mkd :onoremap <buffer> ah :<c-u>execute
     \ "normal! ?^[=-]\\{3,}$\r:nohlsearch\rg_vk0"<cr>

  " Add link
:  autocmd FileType mkd :nnoremap fl a<space>[link]()<left>
:augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" => Other Tweaks {{{

" Disable the annoying balloon expression
" set noballooneval

" Play with timeouts
set timeoutlen=1000 ttimeoutlen=0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
