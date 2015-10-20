
"yes its the mswin config, I like some of what it does for gvim
source $VIMRUNTIME/mswin.vim
behave mswin


""""""""""" Vundle stuff
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
Plugin 'Valloric/YouCompleteMe'
Plugin 'szw/vim-tags'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'gosukiwi/vim-atom-dark'
"Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'StanAngeloff/php.vim'
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""" END Vundle Stuff

"colorshceme settings
set background=dark
colorscheme atom-dark

"general settings
:set nobackup
:set number
:set scrolloff=5
:set guioptions-=T  "remove toolbar"
if has("gui_running")
    set lines=48 columns=115
    let g:airline_theme='tomorrow'
    let g:airline_powerline_fonts = 1
    set guifont=Liberation\ Mono\ for\ Powerline\ 10
endif
:set ignorecase


"tab navigation"
:nnoremap <C-S-tab> :bprevious<CR>:call NTLookup()<CR>
:nnoremap <C-tab>   :bnext<CR>:call NTLookup()<CR>
:nnoremap <C-t>     :set hidden<cr>:enew<cr>:call NTLookup()<CR>
:inoremap <C-S-tab> <Esc>:bprevious<CR>:call NTLookup()<CR>i
:inoremap <C-tab>   <Esc>:bnext<CR>:call NTLookup()<CR>i
:inoremap <C-t>     <Esc>:set hidden<cr>:enew<cr>:call NTLookup()<CR>i
:nnoremap <C-w> :Bclose<CR>:call NTLookup()<cr>
:inoremap <C-w> :Bclose<CR>:call NTLookup()<cr>i

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

"remap ctrld and dd to behave better
:inoremap <c-s> <c-o>:Update<CR><CR>
:noremap dd "_dd
:map <c-d> dd
:imap <c-d> <Esc>ddi


""""""" CTRL+P settings
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
""""" end CTRL+P setigns

"""" YCM and omicomplete stuff
let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
set completeopt-=preview

"Hack so that with YCM, if you hit enter it slects the next item
"and closes the menu
:inoremap <expr> <CR> pumvisible() ? "\<lt>Down><C-y>" : "\<C-g>u\<CR>"

:let g:ycm_add_preview_to_completeopt = 0
:let g:EclimCompletionMethod = 'omnifunc'

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
map <C-n> :NERDTreeToggle %<CR>

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


"kinda buggey so disabling
"map <S-b> :ConqueTermSplit bash --rcfile ~/.vim-bashrc<CR><Esc>:resize 10<CR>i
"let g:Conque"kinda bugget so disablingTerm_CloseOnEnd = 1

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

"indentation settings, still needs work
:vmap <Tab> >
:vmap <S-Tab> <
:map <S-Tab> <<

