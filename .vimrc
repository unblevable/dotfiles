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

" Add custom runtimepath for personal installation
set rtp+=/opt/hg/vim/runtime

" Plugins " -------------------------------------------------------------------
" Configure Vundle and bundles...
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Manage Vundle with Vundle
Plugin 'gmarik/Vundle.vim'
" Make sure plugins developed locally are compatible with Pathogen
Plugin 'tpope/vim-pathogen'

" Plugins developed locally
Plugin 'unblevable/quick-scope'

" Base16 color scheme (eighties)
Plugin 'chriskempson/base16-vim'
" Molokai color scheme
Plugin 'tomasr/molokai'

" Sass/SCSS support
Plugin 'cakebaker/scss-syntax.vim'
" Elixir support
Plugin 'elixir-lang/vim-elixir'
" Dockerfile support
Plugin 'ekalinin/Dockerfile.vim'
" CSS3 support
Plugin 'hail2u/vim-css3-syntax'
" Python support
Plugin 'klen/python-mode'
" React JSX support
Plugin 'mxw/vim-jsx'
" Javascript support
Plugin 'pangloss/vim-javascript'
" Markdown and Github Flavored Markdown support
Plugin 'plasticboy/vim-markdown'
" Rails support
Plugin 'tpope/vim-rails'
" AutoHotKey support
Plugin 'autohotkey-ahk'
" HTML support
Plugin 'vim-scripts/indenthtml.vim'
" Ruby support
Plugin 'vim-ruby/vim-ruby'
" Stylus support
Plugin 'wavded/vim-stylus'
" Slim templating engine support
Plugin 'slim-template/vim-slim'

" Use custom text objects
Plugin 'kana/vim-textobj-user'
" Define text objects based on indentation level
Plugin 'kana/vim-textobj-indent'
" Define snake_case or camelCase segments as text objects
Plugin 'Julian/vim-textobj-variable-segment'
" Define text objects for parameters of functions
Plugin 'sgur/vim-textobj-parameter'

" tmux statusline generator
Plugin 'edkolev/tmuxline.vim'
" Replace fuzzy matcher provided with CtrlP
Plugin 'FelikZ/ctrlp-py-matcher'
" Indent-level based motion
Plugin 'jeetsukumaran/vim-indentwise'
" Align text based on delimieters
Plugin 'junegunn/vim-easy-align'
" Provide access to fake clipboard registers (i.e. tmux's paste buffer)
Plugin 'kana/vim-fakeclip'
" Full path fuzzy finder
Plugin 'kien/ctrlp.vim'
" Show a side panel to visualize undo branches
Plugin 'mbbill/undotree'
" Show start screen on naked Vim startup
Plugin 'mhinz/vim-startify'
" NERDTree
Plugin 'scrooloose/nerdtree'
" Provide snippet management, similar to TextMate
Plugin 'SirVer/ultisnips'
" Make Vim play nicely with iTerm2 and tmux
Plugin 'sjl/vitality.vim'
" Use multiple selections
Plugin 'terryma/vim-multiple-cursors'
" Toggle comments
Plugin 'tomtom/tcomment_vim'
" Repeat maps with '.' supported plugins
Plugin 'tpope/vim-repeat'
" Provide mappings for parentheses, brackets, quotes, tags, etc.
Plugin 'tpope/vim-surround'
" Fuzzy-search code completion
" Plugin 'Valloric/YouCompleteMe'
" Highlight enclosing HTML/XML tags
" Configure % to match words and regular expressions
Plugin 'vim-scripts/matchit.zip'

" Set globals for plugins...
" Search by filename as opposed to full path by default
let g:ctrlp_by_filename=1
" Open a newly created file in a new tab
let g:ctrlp_open_new_file='t'
" Open new tabs after the last tab
let g:ctrlp_tabpage_position='al'
" Don't define default key mappings for fakeclip
let g:fakeclip_no_default_key_mappings=1
" Prevent the plug-in from interfering with YouCompleteMe
let g:UltiSnipsExpandTrigger="<c-j>"
" Disable default mappings
let g:vim_markdown_no_default_key_mappings=1
" Decrease latency for ycm
let g:ycm_allow_changing_updatetime=0
" Link to 'ycm_extra_conf'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" The Silver Searcher (ag)
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " No file limit
    let g:ctrlp_max_files=0

    " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command='ag %s -i -l --nogroup --nocolor --hidden -g ""'

    " Ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching=0
endif

" Use pymatcher as a replacement for the fuzzy matcher provided with CtrlP for
" performance improvements
if has('python')
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

" ...and done!
call vundle#end()
filetype plugin indent on

" Globals ---------------------------------------------------------------------
" Set leader
let mapleader='\'
" Set last active tab to 1 on start
let g:lasttab = 1

" Colors ----------------------------------------------------------------------
" Set terminal to use 255 colors
set t_Co=256
" Set terminal type to use
set term=xterm-256color
" Turn on syntax highlighting
syntax on
" Use dark theme of color scheme
set background=light
" Use a color scheme based on TextMates' Monokai
colorscheme molokai

" Mute lime green color in molokai
if g:colors_name ==? 'molokai'
    highlight Directory ctermfg=155 cterm=bold
    highlight Exception ctermfg=155 cterm=bold
    highlight Function ctermfg=155
    highlight PreCondit ctermfg=155 cterm=bold
    highlight PreProc ctermfg=155
    highlight SignColumn ctermfg=155 ctermbg=235

    highlight CursorLine ctermbg=235
endif

" Make tabs and tabline transparent
highlight TablineFill term=none cterm=none ctermfg=none ctermbg=none guibg=none
highlight Tabline term=none cterm=none ctermfg=none ctermbg=none guibg=none
highlight TablineSel term=none cterm=none ctermfg=none ctermbg=none guibg=none

" Make line number background transparent
highlight LineNr ctermbg=none

" Make background match terminal background
highlight Normal ctermbg=none

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
" Eliminate ESC delays
set ttimeoutlen=0

" Search ----------------------------------------------------------------------
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
set tabstop=2
" Delete number of spaces according to tab width
set softtabstop=2
" Indent with four spaces even with the indentation commands and 'smart tab'
set shiftwidth=2
" Toggle paste mode to paste text that won't be autoindented
set pastetoggle=<F2>

" Text & whitespace -----------------------------------------------------------
" Set recommended encoding for GTK+ 2 environments
set encoding=utf-8
" Backspace over everything in insert mode
set backspace=indent,eol,start
" Disable line wrap
set nowrap
" Set maximum width of text that can be inserted
" set textwidth=80
" Set linebreaks at convenient points
" set linebreak
" Display unprintable characters, specificaly...
set list
" ... the tab and endofline characters
set listchars=tab:→\ ,eol:¬

" Leader maps -----------------------------------------------------------------
" NERDTree toggle
nmap <leader>n :NERDTreeToggle<cr>
vmap <leader>n :NERDTreeToggle<cr>
" quick-scope; toggle
nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)
" Undotree; toggle
nnoremap<leader>g :UndotreeToggle<cr>
" T-Comment; toggle comment
map <leader>c <c-_><c-_>
" Use tmux paste buffer as clipboard
nmap <leader>y <Plug>(fakeclip-screen-Y)
vmap <leader>y v_<Plug>(fakeclip-screen-Y)
nmap <leader>p <Plug>(fakeclip-screen-p)
vmap <leader>p v_<Plug>(fakeclip-screen-p)
" Source .vimrc
noremap <silent> <leader>s :so $MYVIMRC<cr>
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
" Switch between 2 and 4 space indents
noremap <silent> <leader>= :call ToggleIndentation()<cr>
" Unhighlight current search
noremap <silent> <leader>\ :noh<cr>
" Add semicolon to end of line without losing cursor position (uses 'q' mark)
noremap <silent> <leader>; mqA;<esc>`q

" Overriding maps -------------------------------------------------------------
" Move across wrapped lines like regular lines (even though 'nowrap' is set...)
" Also, map 0 to ^ for easy access to first non-blank character at the
" beginning of a line.
noremap j gj
noremap k gk
noremap 0 g^
noremap ^ g^
noremap $ g$
" Use normal regex instead of Vim's custom one
noremap / /\v
" Go to command mode
noremap <cr> :
" Leave Ex mode--for good
nnoremap Q <nop>
" Go to last active tab
noremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
" vim-easy-align
" nmap <space> <plug>(EasyAlign)
" vmap <space> <plug>(EasyAlign)

" Auto-commands ---------------------------------------------------------------
" Return to last known position when opening file
augroup returntolastposition " {
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END " }
" Save on losing focus
augroup saveall " {
    autocmd!
    autocmd FocusLost * :wa
augroup END " }
" Set last active tab after switching tabs
augroup setlastactivetab " {
    autocmd!
    autocmd TabLeave * let g:lasttab = tabpagenr()
augroup END " }
" Remove trailing whitespace
augroup removetrailingwhitespace " {
    autocmd!
    autocmd BufWritePre * :call StripTrailingWhitespaces()
augroup END " }
" Auto-reload .vimrc
augroup reloadvimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

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
function! StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history,
    " and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Toggle between 2 and 4 space indents
function! ToggleIndentation()
    if &tabstop == 4 && &softtabstop == 4 && &shiftwidth == 4
        set tabstop=2 softtabstop=2 shiftwidth=2
        echo "Set indentation to 2 spaces."
    else
        set tabstop=4 softtabstop=4 shiftwidth=4
        echo "Set indentation to 4 spaces."
    endif
endfunction
