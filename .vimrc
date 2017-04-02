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
set runtimepath+=/opt/hg/vim/runtime

" Plugins " ------------------------------------------------------------------
" Automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Configure plugins
call plug#begin('~/.vim/plugged')

" Plugins developed locally
" Plug '~/Code/quick-scope'
Plug 'unblevable/quick-scope'

" Colorschemes
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'

" Syntax
Plug 'cakebaker/scss-syntax.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'ElmCast/elm-vim'
Plug 'elzr/vim-json'
Plug 'ekalinin/Dockerfile.vim'
Plug 'hail2u/vim-css3-syntax'
" Plug 'lambdatoast/elm.vim'
Plug 'klen/python-mode'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5.vim'
" Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
      \| Plug 'mxw/vim-jsx'
      \| Plug 'othree/javascript-libraries-syntax.vim'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'vim-scripts/autohotkey-ahk'
Plug 'vim-scripts/indenthtml.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'wavded/vim-stylus'
Plug 'slim-template/vim-slim'

" Full path fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" tmux statusline generator
Plug 'edkolev/tmuxline.vim'
" Improve HTML and CSS workflow
Plug 'mattn/emmet-vim'
" Indent-level based motion
Plug 'jeetsukumaran/vim-indentwise'
" Align text based on delimieters
Plug 'junegunn/vim-easy-align'
" Distraction-free writing
Plug 'junegunn/goyo.vim'
      \| Plug 'junegunn/limelight.vim'
" Provide access to fake clipboard registers (i.e. tmux's paste buffer)
Plug 'kana/vim-fakeclip'
" Define custom text objects
Plug 'kana/vim-textobj-user'
      \| Plug 'glts/vim-textobj-comment'
      \| Plug 'kana/vim-textobj-indent'
      \| Plug 'kana/vim-textobj-function'
      \| Plug 'Julian/vim-textobj-variable-segment'
      \| Plug 'sgur/vim-textobj-parameter'
      \| Plug 'FelikZ/ctrlp-py-matcher'
" Turn Vim's default register into a stack.
Plug 'maxbrunsfeld/vim-yankstack'
" Show a side panel to visualize undo branches
Plug 'mbbill/undotree'
" Show start screen on naked Vim startup
Plug 'mhinz/vim-startify'
" Auto-complete quotes, parentheses, etc.
Plug 'Raimondi/delimitMate'
" Syntax checking
" Plug 'scrooloose/syntastic'
"       \| Plug 'walm/jshint.vim'
" Snippet management, similar to TextMate
Plug 'SirVer/ultisnips'
" Multiple cursors for multiple simultaneous edits
Plug 'terryma/vim-multiple-cursors'
" Commenting
Plug 'tomtom/tcomment_vim'
" Add `end` in Ruby, etc.
Plug 'tpope/vim-endwise'
" Repeat custom maps with '.'
Plug 'tpope/vim-repeat'
" Provide a 'surround' text-object selection
Plug 'tpope/vim-surround'
" Fuzzy-search code completion
Plug 'Valloric/YouCompleteMe'
" Display indentation levels
Plug 'Yggdroot/indentLine'

" Set globals for plugins...
" Search by filename as opposed to full path by default
let g:ctrlp_by_filename=1
" Open a newly created file in a new tab
let g:ctrlp_open_new_file='t'
" Open new tabs after the last tab
let g:ctrlp_tabpage_position='al'
" Balance matching pairs
let delimitMate_balance_matchpairs=1
" Turn on expansion of <cr>
let delimitMate_expand_cr=2
" Don't define default key mappings for fakeclip
let g:fakeclip_no_default_key_mappings=1
" Support JSX highlighting and indenting in JS files
let g:jsx_ext_required=0
" Define syntax checkers
let g:syntastic_javascript_checkers=['eslint']
" Tell syntastic to automatically open and/or close the location list
let g:syntastic_auto_loc_list=1
" Run syntax checks when buffers are saved or first loaded
let g:syntastic_check_on_open=1
" Skip syntax checks when running :wq and :x
let g:syntastic_check_on_wq=0
" Trigger quick-scope highlight on key press
" let g:qs_highlight_on_keys=['f', 'F', 't', 'T']
" Don't define default key mappings for TComment
let g:tcommentMaps=0
" Prevent the plug-in from interfering with YouCompleteMe
let g:UltiSnipsExpandTrigger="<c-j>"
" Remap emmet leader key
let g:user_emmet_leader_key='<leader>e'
" Setup syntax for JS libraries
let g:used_javascript_libs='react,flux'
" Disable concealing!
let g:vim_json_syntax_conceal=0
" Disable default mappings
let g:vim_markdown_no_default_key_mappings=1
" Load yankstack without default key mappings
let g:yankstack_map_keys=0
" Decrease latency
let g:ycm_allow_changing_updatetime=0
" Link to 'ycm_extra_conf'
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" Turn off diagnostic display features
let g:ycm_show_diagnostics_ui=0

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

" Add plugins to &runtimepath
call plug#end()

" Globals --------------------------------------------------------------------
" Set leader
let mapleader='\'
" Set last active tab to 1 on start
let g:lasttab = 1

" Colors ---------------------------------------------------------------------
" Set terminal type to use
" set term=xterm-256color
" Filetype support
filetype plugin indent on
" Turn on syntax highlighting
syntax on
" Use dark theme of color scheme
set background=dark
" Use a color scheme based on TextMates' Monokai
colorscheme base16-default-dark

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
highlight TablineFill term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE guibg=NONE

highlight Tabline term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE guibg=NONE
highlight TablineSel term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE guibg=NONE

" Make line number background transparent
highlight LineNr ctermbg=NONE

" " Make background match terminal background
" highlight Normal ctermbg=none

" Saving and undoing ---------------------------------------------------------
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

" Folding  -------------------------------------------------------------------
" Set folding based on indent
set foldmethod=indent
" Set deepest fold level
set foldnestmax=3
" Make folds open by default
set nofoldenable

" GUI ------------------------------------------------------------------------
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

" Search ---------------------------------------------------------------------
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

" Indentation ----------------------------------------------------------------
" Copy the indentation from the previous line (non-interfering)
set autoindent
" Do smart autoindenting when starting a new line
set smartindent
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

" Text & whitespace ----------------------------------------------------------
" Set recommended encoding for GTK+ 2 environments
set encoding=utf-8
" Backspace over everything in insert mode
set backspace=indent,eol,start
" Disable line wrap
set nowrap
" Set maximum width of text that can be inserted
set textwidth=78
" Only wrap text in comments and with `gq`
set formatoptions=cq
" Display unprintable characters, specifically...
set list
" ... the tab and endofline characters
set listchars=tab:→\ ,eol:¬

" Leader maps ----------------------------------------------------------------
" yankstack
nmap <leader>o <plug>yankstack_substitute_older_paste
nmap <leader>O <plug>yankstack_substitute_newer_paste
vmap <leader>o <plug>yankstack_substitute_older_paste
vmap <leader>O <plug>yankstack_substitute_newer_paste
" quick-scope; toggle
nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)
" Undotree; toggle
nnoremap<leader>u :UndotreeToggle<cr>
" T-Comment; toggle comment
nmap <silent> <leader>c  <plug>TComment_<c-_><c-_>
vmap <silent> <leader>c  v_<plug>TComment_<c-_><c-_>
imap <silent> <leader>c  i_<plug>TComment_<c-_><c-_>
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
noremap <leader>l :exe "tabn " . g:lasttab<cr>
" Switch between 2 and 4 space indents
noremap <silent> <leader>= :call ToggleIndentation()<cr>
" Unhighlight current search
noremap <silent> <leader>\ :noh<cr>
" vim-easy-align
nmap <leader>z <plug>(EasyAlign)
vmap <leader>z <plug>(EasyAlign)
" goyo + limeight
nmap <leader>g :Goyo<cr>
vmap <leader>g :Goyo<cr>

" Overriding maps ------------------------------------------------------------
" Move across wrapped lines like regular lines (even though 'nowrap' is set...)
noremap j gj
noremap k gk
" Map 0 to ^ for easy access to first non-blank character at the beginning of
" a line.
noremap 0 ^
noremap ^ 0
" Use normal regex instead of Vim's custom one
noremap / /\v
" Go to command mode
noremap <cr> :
" Leave Ex mode--for good
nnoremap Q <nop>
" Go to last active tab
" noremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
" vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
" vim-indentwise
nmap [[ <plug>(IndentWisePreviousEqualIndent)
vmap [[ <plug>(IndentWisePreviousEqualIndent)
nmap ]] <plug>(IndentWiseNextEqualIndent)
vmap ]] <plug>(IndentWiseNextEqualIndent)

" Auto-commands --------------------------------------------------------------
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
" Automatically read files when changes are detected outside of Vim
augroup autoread
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * checktime
augroup END

" Functions ------------------------------------------------------------------
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
