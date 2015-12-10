source $VIMRUNTIME/mswin.vim
behave mswin

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let path='~/vimfiles/bundle'
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'Valloric/YouCompleteMe'
"Bundle 'scrooloose/syntastic'
"Plugin 'szw/vim-tags'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'gosukiwi/vim-atom-dark'
"Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/AutoComplPop'
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Bundle 'lrvick/Conque-Shell'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

":colorscheme dusk
set background=dark
colorscheme atom-dark
"
let g:acp_autoselectFirstCompletion = 1
:set nobackup

:set number
:set guioptions-=T  "remove toolbar"
set guioptions-=m 
if has("gui_running")
    set lines=48 columns=150
endif
:set ignorecase


"tab navigation"
:nnoremap <C-S-tab> :bprevious<CR>:call NTLookup()<CR>
:nnoremap <C-tab>   :bnext<CR>:call NTLookup()<CR>
:nnoremap <C-t>     :set hidden<cr>:enew<cr>:call NTLookup()<CR>
:vnoremap <C-S-tab> <Esc>:bprevious<CR>:call NTLookup()<CR>
:vnoremap <C-tab>   <Esc>:bnext<CR>:call NTLookup()<CR>
:vnoremap <C-t>     <Esc>:set hidden<cr>:enew<cr>:call NTLookup()<CR>
:inoremap <C-S-tab> <Esc>:bprevious<CR>:call NTLookup()<CR>i
:inoremap <C-tab>   <Esc>:bnext<CR>:call NTLookup()<CR>i
:inoremap <C-t>     <Esc>:set hidden<cr>:enew<cr>:call NTLookup()<CR>i
:nnoremap <C-w> :Bclose<CR>:call NTLookup()<cr>
:vnoremap <C-w> <Esc>:Bclose<CR>:call NTLookup()<cr>
:inoremap <C-w> :Bclose<CR>:call NTLookup()<cr>i

"Clear search with return key" 
:nnoremap <CR> :noh<CR><CR>
:set tabstop=4 shiftwidth=4 expandtab
:syntax on
:set history=1000
:set hlsearch
:set incsearch


"special bindings"
"quit with :Q"
:command! -bar -bang Q quit<bang>

:inoremap <c-s> <c-o>:Update<CR><CR>
:noremap dd "_dd
:map <c-d> dd
:imap <c-d> <Esc>ddi


"For ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*/.git,*/.svn     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_clear_cache_on_exit = 0

let g:ctrlp_working_path_mode = '0'

"let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
:imap <expr> <CR> pumvisible() ? "\<C-n><C-y><C-e>" : "\<CR>"
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

"refresh vimrc - sorta works?
":map <F5> :so $MYVIMRC<CR>

"input maps
:inoremap { {}<Esc>i


:imap <S-Return> <CR><CR><C-o>k<Tab>

:let g:EclimCompletionMethod = 'omnifunc'

:inoremap  <Up>     <NOP>
:inoremap  <Down>   <NOP>
:inoremap  <Left>   <NOP>
:inoremap  <Right>  <NOP>
:noremap   <Up>     <NOP>
:noremap   <Down>   <NOP>
:noremap   <Left>   <NOP>
:noremap   <Right>  <NOP>


":map     <C-N>       :!gvim &<CR><CR>
":map     <C-W>       :confirm bdelete<CR>


let g:solarized_contrast = "high"
set cursorline
set laststatus=2

map <C-n> :NERDTreeToggle<CR>

function! TagInNewTab()
    let word = expand("<cword>")
    redir => tagsfiles
    silent execute 'set tags'
    redir END
    tabe
    execute 'setlocal' . strpart(tagsfiles, 2)
    execute 'tag ' . word
endfunction

nmap    <C-LeftMouse>    :call TagInNewTab()<CR>endfunction

nmap <C-LeftMouse>:call TagInNewTab()<CR>

map <F1> :set rnu!<CR>
"autocmd BufEnter * silent! if bufname('%') !~# 'NERD_tree_' | cd %:p:h | NERDTreeCWD | wincmd p | endif

map <S-b> :ConqueTermSplit CMD.exe<CR><Esc>:resize 10<CR>i
let g:ConqueTerm_CloseOnEnd = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_powerline_fonts = 1

"settings for moving bettwen buffer splits with ctrl+dkeys
"noremap <Tab> <C-w>w
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


" returns true iff is NERDTree open/active
function! IsNTOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

"tries to highlight the file in nerdtree
function! NTLookup()
if &modifiable && IsNTOpen() && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
        wincmd w
    endif
endfunction

"autocmd BufEnter * call NTLookup()
autocmd BufReadPre,FileReadPre * call NTLookup()

"general stuff
set encoding=utf-8
set guioptions-=m 

"indentation settings.
noremap <Tab> >>
noremap <S-Tab> <<
vnoremap > >gv 
vnoremap < <gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv


set softtabstop=4

:set textwidth=0
:set wrapmargin=0

"disable beeps
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


let g:airline_theme='tomorrow'
set encoding=utf-8
set guifont=Consolas:h10
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

"keep cursor between buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
