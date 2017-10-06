"
" unblevable's init.vim/.vimrc
"
" See https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
" for installation and configuration settings.

" TIP: Press K with your cursor on an unknown keyword or setting (in this
" .vimrc) to automatically open its help file.
augroup vimrc_group " {
  autocmd!
  autocmd FileType vim setlocal keywordprg=:help
augroup END " }

" set settings for Vim that are enabled by default by Neovim
if !has('nvim')
  set autoindent
  set autoread
  set backspace=indent,eol,start
  " make a directory if it already doesn't exist for backup files
  silent !mkdir ~/.vim/backup > /dev/null 2>&1
  set backupdir=~/.vim/backup
  silent !mkdir ~/.vim/swap > /dev/null 2>&1
  set directory=~/.vim/swap
  set display+=lastline
  set encoding=utf-8
  set history=10000
  set hlsearch
  set incsearch
  set mouse=a
  set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
  set smarttab
  set syntax=on
  set tabpagemax=50
  set tags=./tags;.tags
  set ttyfast
  set viminfo=!,'100,<50,s10,h
  set wildmenu
endif

" Plugins  --------------------------------------------------------------------
" automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" locally developed
" Plug '~/Code/quick-scope'
Plug 'unblevable/quick-scope'

" colorscheme
Plug 'chriskempson/base16-vim'

" syntax support for lots of languages
Plug 'sheerun/vim-polyglot'
" align text based on delimiters
Plug 'junegunn/vim-easy-align'
" distraction-free writing
Plug 'junegunn/goyo.vim'
      \| Plug 'junegunn/limelight.vim'
" provide access to fake clipboard registers (i.e. tmux's paste buffer)
Plug 'kana/vim-fakeclip'
" define custom text objects
Plug 'kana/vim-textobj-user'
      \| Plug 'glts/vim-textobj-comment'
      \| Plug 'kana/vim-textobj-indent'
      \| Plug 'Julian/vim-textobj-variable-segment'
      \| Plug 'sgur/vim-textobj-parameter'
" auto-complete quotes, parentheses, etc.
Plug 'Raimondi/delimitMate'
" language-aware commenting
Plug 'tomtom/tcomment_vim'
" add `end` in Ruby, etc.
Plug 'tpope/vim-endwise'
" repeat custom maps with '.'
Plug 'tpope/vim-repeat'
" provide a 'surround' text-object selection
Plug 'tpope/vim-surround'
" display indentation levels
Plug 'Yggdroot/indentLine'

let delimitMate_balance_matchpairs = 1
let delimitMate_expand_cr = 2
let g:fakeclip_no_default_key_mappings = 1
let g:indentLine_color_term = 11
let g:jsx_ext_required = 0
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:tcommentMaps = 0
let g:used_javascript_libs = 'react,flux'
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_no_default_key_mappings = 1

if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" add plugins to &runtimepath
call plug#end()

" Globals ---------------------------------------------------------------------
let mapleader = '\'
let g:lasttab = 1

" Colors ----------------------------------------------------------------------
colorscheme base16-default-dark

" make parts of the GUI transparent
highlight CursorLineNR  ctermfg=11  ctermbg=bg
highlight LineNr        ctermfg=11  ctermbg=bg
highlight Tabline       ctermfg=fg  ctermbg=bg
highlight TablineFill   ctermfg=fg  ctermbg=bg
highlight TablineSel    ctermfg=2   ctermbg=bg
highlight StatusLine    ctermfg=2   ctermbg=bg
highlight StatusLineNC  ctermfg=fg  ctermbg=bg
highlight VertSplit     ctermfg=bg  ctermbg=bg

" mark any character past textwidth or on colorcolumn
call matchadd('ColorColumn', '\%81v', 100)
highlight ColorColumn   ctermfg=1   ctermbg=NONE  cterm=bold

" Saving and undoing ----------------------------------------------------------
set undofile
" make a directory if it doesn't already exist for persistent undos
silent !mkdir ~/.vim/undos > /dev/null 2>&1
set undodir=~/.vim/undos
" disable any possibility of 'safe writes' that can potentially interfere with
" Webpack recompilation.
set backupcopy=yes

" GUI ------------------------------------------------------------------------
set colorcolumn=81
set cursorline
set laststatus=0
set nofoldenable
set nostartofline
set number
set ruler
set scrolloff=999
set showtabline=2
" label tabs with numbers
set tabline=%!ShowTabLine()
" set tabline=%f
" eliminate <esc> delays
set ttimeoutlen=0

" Command line ---------------------------------------------------------------
set path=.,**

" Search ---------------------------------------------------------------------
set gdefault
set ignorecase
set smartcase

" Indentation ----------------------------------------------------------------
set expandtab
set shiftround
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2

" Text & whitespace -----------------------------------------------------------
set conceallevel=0
set formatoptions=cqj
set list
set listchars=tab:→\ ,eol:¬,nbsp:+
set nowrap

" Leader maps -----------------------------------------------------------------
" source .vimrc
noremap <silent> <leader>s :so $MYVIMRC<cr>
" go to last (i.e. not first) tab
noremap <silent> <leader>0 :tablast<cr>
" go to previous tab
noremap <silent> <leader>l :exe "tabn " . g:lasttab<cr>
" unhighlight active search
noremap <silent> <leader>\ :noh<cr>
" show buffer list
noremap <leader>b :ls<cr>:b<space>
" quick-scope
nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)
" t_comment; toggle comments
nmap <silent> <leader>c  <plug>TComment_<c-_><c-_>
vmap <silent> <leader>c  v_<plug>TComment_<c-_><c-_>
imap <silent> <leader>c  i_<plug>TComment_<c-_><c-_>
" use tmux paste buffer as clipboard
nmap <leader>y <Plug>(fakeclip-screen-Y)
vmap <leader>y v_<Plug>(fakeclip-screen-Y)
nmap <leader>p <Plug>(fakeclip-screen-p)
vmap <leader>p v_<Plug>(fakeclip-screen-p)
" vim-easy-align
nmap <leader>e <plug>(EasyAlign)
vmap <leader>e <plug>(EasyAlign)
" goyo + limeight
nmap <leader>g :Goyo<cr>
vmap <leader>g :Goyo<cr>

" Overriding maps -------------------------------------------------------------
noremap j gj
noremap k gk
noremap 0 ^
noremap ^ 0
" prevent accidental switches to Ex mode
nnoremap Q <nop>
" use <enter> to go to command mode
noremap <cr> :
" use normal regex instead of Vim's custom one
noremap / /\v
" go to last active tab
noremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

" Auto-commands ---------------------------------------------------------------
augroup autocmd_group " {
  autocmd!
  " return to last known position when opening file
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  " remove trailing whitespace
  autocmd BufWritePre * :call StripTrailingWhitespaces()
  " auto-reload .vimrc
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  " automatically read files when changes are detected outside of Vim
  autocmd BufEnter,CursorHold,CursorHoldI * silent! checktime
  " set last active tab after switching tabs
  autocmd TabLeave * let g:lasttab = tabpagenr()
augroup END " }

" Functions -------------------------------------------------------------------
function! ShowTabLine()
  " complete tabline goes here
  let s = ''
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " set highlight
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . t . 'T'
    let s .= ' '
    " set page number string
    let s .= t . ' '
    " get buffer names and statuses
    " temp string for buffer names while we loop and check buftype
    let n = ''
    " &modified counter
    let m = 0
    " counter to avoid last ' '
    let bc = len(tabpagebuflist(t + 1))
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
      let pluses = ''
      let plus_count = 0
      while plus_count < m
        let pluses .= '+'
        let plus_count += 1
      endwhile
      let s .= pluses . ' '
    endif
    " select the highlighting for the buffer names
    " my default highlighting only underlines the active tab
    " buffer names.
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " add buffer names
    if n == ''
      let s .= '[untitled]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space to buffer list
    let s .= ' '
  endfor
  return s
endfunction

" put cursor back where it was before invoking a command
function! StripTrailingWhitespaces()
  " preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
