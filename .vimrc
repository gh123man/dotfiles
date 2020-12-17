call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'gh123man/vim-atom-dark-modded-256'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'keith/swift.vim'
Plug 'mbbill/undotree'
Plug 'ajh17/spacegray.vim'
Plug 'rbgrouleff/bclose.vim' 
Plug 'RRethy/vim-illuminate' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1 

call plug#end()

"set shell=/bin/bash
set lazyredraw

"general settings
set nobackup
set number
set splitbelow 

colorscheme atom-dark
set termguicolors
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
if has("gui_running") && !has("nvim")
    set guioptions-=T  "remove toolbar"
    set guifont=Roboto\ Mono\ for\ Powerline:h11
endif

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

":set shell=/usr/local/bin/fish
:tnoremap <Esc> <C-\><C-n>


:set ignorecase

:set mouse=a
set backspace=indent,eol,start

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
":nnoremap <C-w>     <Esc>:Bclose<CR>
":vnoremap <C-w>     <Esc>:Bclose<CR>

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>
map gt :enew<cr>
map gw :Bclose<cr>

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


nnoremap ; :

"special bindings"
"quit with :Q"
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

nnoremap <c-p> :Files<cr>
set ttimeout
set ttimeoutlen=0

"let g:ackprg = 'ag --vimgrep'

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
let g:fzf_layout = { 'down': '40%' }
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

let g:fzf_history_dir = '~/.local/share/fzf-history'

"autocomplete braces
:inoremap { {}<Esc>i

"shift + enter moves (braces) to correct line and resets cursor between them
:imap <S-Return> <CR><CR><C-o>k<Tab>
    
"Cursor settings
set cursorline
set laststatus=2

"Toggle nerd tree
map <C-n> :NERDTreeToggle<CR>

"disable swapping in nerdtree
autocmd FileType nerdtree noremap <buffer> <C-tab> <nop>
autocmd FileType nerdtree noremap <buffer> <C-S-tab> <nop>
autocmd FileType nerdtree noremap <buffer> <C-t> <nop> 

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
"nmap <leader>d :bd!<cr>
nmap <leader>d :GoDef<cr>
nmap // :Rg<cr>
nmap <leader>rc :e ~/.vimrc<cr>

" quick reload 
nmap <leader>= :source ~/.vimrc<cr>  
nmap <leader>o :! code %<cr>   

" Rg serach files but not names
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
    
" returns the current selection
function! Get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction 

" finds all refernces under the cursor with FZF and RG
function! Find_all_Ref()
    :execute "normal! viwv"
    :execute ':Rgf ' . Get_visual_selection()
endfunction 

" Rgf is a custom RG command that accepts an argument to search for
command! -bang -nargs=* Rgf
  \ call fzf#vim#grep('rg --column --no-heading --line-number --color=always '.<q-args>,
  \ 1,
  \ fzf#vim#with_preview(),
  \ <bang>0)


nmap <leader>f :call Find_all_Ref() <CR>
    
" Format json
nmap <leader>j :%!python -m json.tool<CR>

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
"autocmd BufReadPre,FileReadPre * call NTLookup()

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

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


" Remove split bar "|" chars 
set fillchars+=vert:\  

" keep curosr between splits
au BufLeave * let b:winview = winsaveview()
au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

" Functions  

function! Work()
    :cd ~/go/src/github.com/DataDog/datadog-agent/ 
    :NERDTreeCWD
    :pwd 
endfunction 

:command Work :call Work()  

" GO SYNTAX  
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1 


"let g:go_fmt_command = "goimports"   
let g:airline#extensions#ale#enabled = 1
