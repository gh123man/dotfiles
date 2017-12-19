"yes its the mswin config, I like some of what it does for gvim
source $VIMRUNTIME/mswin.vim
behave mswin

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'gh123man/vim-atom-dark-modded-256'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'StanAngeloff/php.vim'
Plug 'wellle/targets.vim'
Plug 'scrooloose/syntastic'
Plug 'gregsexton/MatchTag'
Plug 'severin-lemaignan/vim-minimap'
Plug 'vim-scripts/AutoComplPop'
Plug 'haya14busa/incsearch.vim'
Plug 'keith/swift.vim'
Plug 'mbbill/undotree'
Plug 'ajh17/spacegray.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

""""""""""""" END Vundle Stuff
set lazyredraw

"general settings
:set nobackup
:set number
set t_Co=256
colorscheme atom-dark
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1

let g:solarized_termcolors=256
:set ignorecase

:set mouse=a


"tab navigation"
:nnoremap <C-S-tab> <Esc>:set hidden<cr>:bprevious<CR>
:nnoremap <C-tab>   <Esc>:set hidden<cr>:bnext<CR>
:nnoremap <C-t>     <Esc>:set hidden<cr>:enew<cr>
:vnoremap <C-S-tab> <Esc>:set hidden<cr>:bprevious<CR>
:vnoremap <C-tab>   <Esc>:set hidden<cr>:bnext<CR>
:vnoremap <C-t>     <Esc>:set hidden<cr>:enew<cr>
:inoremap <C-S-tab> <Esc>:set hidden<cr>:bprevious<CR>
:inoremap <C-tab>   <Esc>:set hidden<cr>:bnext<CR>
:inoremap <C-t>     <Esc>:set hidden<cr>:enew<cr>
:nnoremap <C-w>     <Esc>:Bclose<CR>
:vnoremap <C-w>     <Esc>:Bclose<CR>

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>
map gt :enew<cr>
map gw :Bclose<cr>
    
" THIS DOES NOT APPEAR TO WORK
"Close buffer w/out saving
":nnoremap <c-s-w>   <Esc>:bw!<CR>
":inoremap <c-s-w>   <Esc>:bw!<CR>
":vnoremap <c-s-w>   <Esc>:bw!<CR>

"line wrap navigation
noremap k gk
noremap j gj

"unamp arrow keys
:inoremap  <Up>     <NOP>
:inoremap  <Down>   <NOP>
:inoremap  <Left>   <NOP>
:inoremap  <Right>  <NOP>
:noremap   <Up>     <NOP>
:noremap   <Down>   <NOP>
:noremap   <Left>   <NOP>
:noremap   <Right>  <NOP>


"Clear search with return key" 
:nnoremap <CR> :noh<CR><CR>

"more general settings
:set tabstop=4 shiftwidth=4 expandtab
:syntax on
:set history=1000
:set hlsearch
:set incsearch


"special bindings"
"quit with :Q"
:command! -bar -bang Q quit<bang>
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

"remap ctrld and dd to behave better
:inoremap <c-s> <c-o>:Update<CR><CR>
:noremap dd "_dd
:noremap <c-d> dd
:inoremap <c-d> <Esc>ddi

""""""" CTRL+P settings
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

nnoremap <c-p> :FZF<cr>

let g:ackprg = 'ag --vimgrep'
let g:fzf_launcher = 'xterm -e bash -ic %s'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
""""" end CTRL+P setigns

"""" omicomplete stuff
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
:inoremap <expr> <tab> pumvisible() ? '<C-n>' : "<tab>"
:inoremap <expr> <S-tab> pumvisible() ? '<C-p>' : "<C-d>"

"refresh vimrc - sorta works?
":map <F5> :so $MYVIMRC<CR>

"autocomplete braces
:inoremap { {}<Esc>i

"shift + enter moves (braces) to correct line and resets cursor between them
:imap <S-Return> <CR><CR><C-o>k<Tab>
    
":map     <C-N>       :!gvim &<CR><CR>
":map     <C-W>       :confirm bdelete<CR>

"Cursor settings
set cursorline
set laststatus=2

"Toggle nerd tree
map <C-n> :NERDTreeToggle<CR>

"opens tag in a new tab (this needs to be fixed to use buffers instead"
function! TagInNewTab()
    let word = expand("<cword>")
    redir => tagsfiles
    silent execute 'set tags'
    redir END
    tabe
    execute 'setlocal' . strpart(tagsfiles, 2)
    execute 'tag ' . word
endfunction

nmap <C-LeftMouse>:call TagInNewTab()<CR>

"Toggle relline numbers
map <F1> :set rnu!<CR>


" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"settings for moving bettwen buffer splits with ctrl+dkeys
"noremap <Tab> <C-w>w
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nmap <leader>h :split<CR>
nmap <leader>v :vsplit<CR>
nmap <leader>q :q<CR>
nmap <leader>bc :Bclose!<CR>


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

autocmd FileType nerdtree noremap <buffer> <C-tab> <nop>
autocmd FileType nerdtree noremap <buffer> <C-S-tab> <nop>
autocmd FileType nerdtree noremap <buffer> <C-t> <nop>

"autocmd BufEnter * call NTLookup()
autocmd BufReadPre,FileReadPre * call NTLookup()

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


"syntactic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set completeopt-=preview "should disable python previewstuff

" Esc exit terminal mode
:tnoremap <Esc> <C-\><C-n>
