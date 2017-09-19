"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'WeiChengLiou/vim_setup'
"git interface
Plugin 'tpope/vim-fugitive'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'dhruvasagar/vim-table-mode'

"html
"Plugin 'isnowfy/python-vim-instant-markdown'
"Plugin 'jtratner/vim-flavored-markdown'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'nelstrom/vim-markdown-preview'
"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Yggdroot/indentLine'

"auto-completion stuff
" Plugin 'klen/python-mode'
"Plugin 'Valloric/YouCompleteMe'
" Plugin 'klen/rope-vim'
" Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
""code folding
Plugin 'tmhedberg/SimpylFold'

"Java/Kotlin
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'airblade/vim-rooter'
Plugin 'udalov/kotlin-vim'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

Plugin 'benmills/vimux'
Plugin 'julienr/vim-cellmode'
" Plugin 'vim-scripts/taglist.vim'
Plugin 'chazy/cscope_maps'

" Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-session'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-dispatch'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'tpope/vim-commentary'
" Plugin 'chrisbra/csv.vim'
Plugin 'gcmt/wildfire.vim'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" task wiki
Plugin 'vimwiki/vimwiki'
Plugin 'tbabej/taskwiki'
Plugin 'mattn/calendar-vim'

call vundle#end()

filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 0

" airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#format = 'CustomBranchName'
function! CustomBranchName(name)
return '[' . a:name . ']'
endfunction
let g:airline#extensions#syntastic#enabled = 0

" My own set up
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
set number
set cindent shiftwidth=4

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = 'python'
let g:ycm_goto_buffer_command = 'new-tab'
let g:ycm_path_to_python_interpreter = '/home/gilbert/anaconda3/python'

" snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"custom keys
let mapleader=" "
"
call togglebg#map("<F5>")
"colorscheme zenburn
"set guifont=Monaco:h14

"I don't like swap files
set noswapfile

"turn on numbering
set nu

"it would be nice to set tag files by the active virtualenv here
set tags=~/mytags "tags for ctags and taglist
nmap <leader>\ :tnext<cr>
nmap <leader>[ :tprev<cr>

"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <leader> za 
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

set clipboard=unnamed,unnamedplus

let g:pydiction_location = '/home/gilbert/.vim/bundle/Pydiction/complete-dict'

" ctags
set tags+=/home/gilbert/anaconda2/lib/python2.7/tags

" hotkey
map <leader>f :echo expand('%:p')<CR>
map <F3> :!ctags-exuberant -R<CR>
map <F9> :SyntasticToggleMode<CR>
map <F2> :silent! NERDTreeTabsToggle<CR>
map <F12> oimport pdb; pdb.set_trace()<Esc>
" map <leader>d  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" vim-cellmode
let g:cellmode_default_mappings=0
let g:cellmode_tmux_panenumber='1'
vmap <leader>x :call RunTmuxPythonChunk()<CR>
noremap <leader>n :call RunTmuxPythonCell(0)<CR>
noremap <leader>g :call RunTmuxPythonCell(1)<CR>
noremap <leader>l :call RunTmuxPythonAllCellsAbove()<CR>

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:nerdtree_tabs_open_on_console_startup=0

" statusline
set laststatus=2

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let b:syntastic_mode = 'passive'

" tagbar
nmap <F8> :TagbarToggle<CR>

" cscope
set nocscopeverbose 

" fugitive
set diffopt+=vertical
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>glg :Glog --graph --full-history --all --color --oneline<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

"  incsearch
set incsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" Easymotion
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
"" 重复上一次操作, 类似repeat插件, 很强大
"map <Leader><leader>. <Plug>(easymotion-repeat)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" vimwiki
au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map di :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map cal :call ToggleCalendar()
let g:calendar_diary=$HOME.'/.vim/diary'

" Unite.vim
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
" nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>e :Unite -quick-match buffer<cr>
nnoremap <leader>/ :Unite grep:.<cr>
" nnoremap <C-p> :Unite file_rec/async<cr>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#custom#source('file_rec/async','sorters','sorter_rank', )
" replacing unite with ctrl-p
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''
endif
nnoremap <silent> <c-p> :Unite -auto-resize file file_mru file_rec<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" indent highlight
" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" wildfire
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}"],
    \ "html,xml" : ["at", "it"],
\ }
nmap <leader>s <Plug>(wildfire-quick-select)

" python-mode
" let g:pymode_rope_goto_definition_bind = "<C-]>"
" let g:pymode_python = 'python3'

"vim-table-mode
let g:table_mode_corner='|'
