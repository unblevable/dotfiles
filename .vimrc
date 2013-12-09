"
" Brian Le's .vimrc file
"
" See https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
" for installation and configuration settings.

" Turn off vi compatibility
set nocompatible

" Set Windows compatibility
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" Plugins " -------------------------------------------------------------------
" Configure Vundle and bundles...
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Manage Vundle with Vundle
Bundle 'gmarik/vundle'

" Molokai color scheme
Bundle 'tomasr/molokai'

" Elixir support
Bundle 'elixir-lang/vim-elixir'
" CSS3 support
Bundle 'hail2u/vim-css3-syntax'
" Python support
Bundle 'klen/python-mode'
" Javascript support
Bundle 'pangloss/vim-javascript'
" Rails support
Bundle 'tpope/vim-rails'
" HTML support
Bundle 'vim-scripts/indenthtml.vim'

" Move across camelCased and snake_cased words
Bundle 'bkad/CamelCaseMotion'
" Edit isolated portions of a file
Bundle 'chrisbra/NrrwRgn'
" Allow collaborative editing
Bundle 'Floobits/floobits-vim'
" Align text based on a character or pattern
Bundle 'godlygeek/tabular'
" Make NERDTree work with tabs
Bundle 'jistr/vim-nerdtree-tabs'
" Full path fuzzy finder
Bundle 'kien/ctrlp.vim'
" Provides a simple way to use motions in Vim
Bundle 'Lokaltog/vim-easymotion'
" Show a side panel to visualize undo branches
Bundle 'mbbill/undotree'
" Show start screen on naked Vim startup
Bundle 'mhinz/vim-startify'
" Provide snippet management, similar to TextMate
Bundle 'SirVer/ultisnips'
" Visualize file structure
Bundle 'scrooloose/nerdtree'
" Use multiple selections
Bundle 'terryma/vim-multiple-cursors'
" Toggle comments
Bundle 'tomtom/tcomment_vim'
" Repeat maps with '.' supported plugins
Bundle 'tpope/vim-repeat'
" Provide mappings for parentheses, brackets, quotes, tags, etc.
Bundle 'tpope/vim-surround'
" Fuzzy-search code completion
Bundle 'Valloric/YouCompleteMe'
" Highlight enclosing HTML/XML tags
Bundle 'Valloric/MatchTagAlways'
" Ruby support
Bundle 'vim-ruby/vim-ruby'
" Configure % to match words and regular expressions
Bundle 'vim-scripts/matchit.zip'

" Set globals for plugins...
" Open a newly created file in a new tab
let g:ctrlp_open_new_file='t'
" Open new tabs after the last tab
let g:ctrlp_tabpage_position='al'
" Set default leader to be a single leader
let g:EasyMotion_leader_key="<Leader>"
" Prevent default mappings
let g:EasyMotion_do_mapping=0
" Prevent the plug-in from interfering with YouCompleteMe
let g:UltiSnipsExpandTrigger="<c-j>"
" Decrease latency for ycm
let g:ycm_allow_changing_updatetime = 0

" ...and done!
filetype plugin indent on

" Colors ----------------------------------------------------------------------
" Set terminal to use 255 colors
set t_Co=256
" Turn on syntax highlighting
syntax on
" Use a color scheme based on TextMates' 'Monokai'
colorscheme molokai

" Make tabs and tabline transparent
highlight TablineFill term=none cterm=none ctermbg=none guibg=none
highlight Tabline term=none cterm=none ctermbg=none guibg=none
highlight TablineSel term=none cterm=none ctermbg=none guibg=none

" Make line number background transparent
highlight LineNr ctermbg=none

" Globals ---------------------------------------------------------------------
" Set leader
let mapleader=' '
" Set last active tab to 1 on start
let g:lasttab = 1

" Writing
" Make a directory for dictionaries and thesauruses
silent !mkdir ~/.vim/txt > /dev/null 2>&1
" download from http://www.gutenburg.org/dirs/etext02/mthes10.zip
set thesaurus+=~/.vim/txt/mthesaur.txt

" Saving and undoing ----------------------------------------------------------
" Automatically read changes to file outside of Vim
set autoread
" Enable persistent undo
set undofile
" Make a directory for persistent undo if it doesn't already exist
silent !mkdir ~/.vim/undos > /dev/null 2>&1
set undodir=~/.vim/undos
" Make a directory for swap files if it doesn't already exist
silent !mkdir ~/.vim/tmp > /dev/null 2>&1
set directory=~/.vim/tmp

" Folding  --------------------------------------------------------------------
" Set folding based on indent
set foldmethod=indent
" Set deepest fold level
set foldnestmax=3
" Make folds open by default
set nofoldenable

" GUI -------------------------------------------------------------------------
" Enable mouse support in console
set mouse=a
" Set line numbering
set number
" Set right margin column
set colorcolumn =80
" Highlight the line the cursor is on
set cursorline
" Vertically position cursor line
set scrolloff=999
" Keep cursor on same column while scrolling
set nostartofline
" Show line number and column of cursor position
set ruler
" Disable statusline
set laststatus=0
" Keep tabline visible
set showtabline=2
" Label tabs with numbers
set tabline=%!ShowTabLine()
" Increase max number of tabs that will open at startup
set tabpagemax=15

" Search ----------------------------------------------------------------------
" Use special characters without escaping in search patterns
set magic
" Ignore case in search patterns
set ignorecase
" Ignore 'ignore case' when using an uppercase letter in search patterns
set smartcase
" Highlight search matches
set hlsearch
" Highlight search matches in real-time
set incsearch
" Search and replace globally (on a line) by default
set gdefault

" Indentation -----------------------------------------------------------------
" Copy the indentation from the previous line (non-interfering)
set autoindent
" Indent to multiple of 'shiftwidth'
set shiftround
" Use spaces instead of tabs
set expandtab
" Set tab to four spaces
set tabstop=4
" Delete number of spaces according to tab width
set softtabstop=4
" Indent with four spaces even with the indentation commands and 'smart tab'
set shiftwidth=4
" Toggle paste mode to paste text that won't be autoindented
set pastetoggle=<F2>

" Text & whitespace -----------------------------------------------------------
" Set recommended encoding for GTK+ 2 environments
set encoding=utf-8
" Backspace over everything in insert mode
set backspace=indent,eol,start
" Disable line wrap
set nowrap
" Set linebreaks at convenient points
set linebreak
" Display unprintable characters, specificaly...
set list
" ... the tab and endofline characters
set listchars=tab:▸\ ,eol:¬

" Leader maps -----------------------------------------------------------------
" NERDTree Tabs; toggle panel
map <leader>n <plug>NERDTreeTabsToggle<cr>
" T-Comment; toggle comment
nmap <leader>c <c-_><c-_>
vmap <leader>c <c-_><c-_>
" Copy and paste to clipboard
nnoremap <leader>y "*y
vnoremap <leader>y "*y
nnoremap <leader>p "*p
vnoremap <leader>p "*p
" Insert horizontal line below current line and its line length (cool!)
nnoremap <leader>= yypVr=
vnoremap <leader>= <Esc>yypVr=
" Source .vimrc
nnoremap <leader>s :so ~/.vimrc<Esc>
" Create new tab
map <leader>t :tabnew<cr>
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Overriding maps -------------------------------------------------------------
" Move across wrapped lines like regular lines (even though 'nowrap' is set...)
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk
" Use normal regex instead of Vim's custom one
nnoremap / /\v
vnoremap / /\v
" Go to first non-blank character at beginning of line
nnoremap 0 ^
vnoremap 0 ^
" When jumping to matching object, visually select text in between
nnoremap <tab> v%
vnoremap <tab> v%
" Go to command mode
nnoremap <cr> :
vnoremap <cr> :

" Maps for commands -----------------------------------------------------------
" Go to next tab
nnoremap <silent> <s-right> :tabnext<cr>
vnoremap <silent> <s-right> :tabnext<cr>
" Go to previous tab
nnoremap <silent> <s-left> :tabprevious<cr>
vnoremap <silent> <s-left> :tabprevious<cr>
" Go to last active tab
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

" Auto-commands ---------------------------------------------------------------
" Return to last known position when opening file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" Save on losing focus
autocmd FocusLost * :wa
" Set last active tab after switching tabs
autocmd TabLeave * let g:lasttab = tabpagenr()
" Remove trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Functions -------------------------------------------------------------------
" Show tab number
function! ShowTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " empty space
    let s .= ' '
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    " set page number string
    let s .= t + 1 . ' '
    " get buffer names and statuses
    let n = ''  "temp string for buffer names while we loop and check buftype
    let m = 0 " &modified counter
    let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        let n .= pathshorten(bufname(b))
        "let n .= bufname(b)
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      "let s .= '[' . m . '+]'
      let s.= '+ '
    endif
    " add buffer names
    if n == ''
      let s .= '[No Name]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space to buffer list
    "let s .= '%#TabLineSel#' . ' '
    " let s .= ' '
    " select the highlighting for the buffer names
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
      " append an asterisk as well to indicate current tab
      let s .= '*'
    else
      let s .= '%#TabLine#'
    endif
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XX'
  endif
  return s
endfunction


" Put cursor back where it was before invoking a command
function! Preserve(command)
    " Save last search and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Execute the command
    execute a:command
    " Restore previous search history and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Python support
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
