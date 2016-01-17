" ================================================
" Basic section
" ================================================
" shell
if $SHELL =~ 'fish'
  set shell=/bin/bash
end

" no vi-keyboard
set nocompatible

" history lins
set history=100

" encoding
set fenc=utf-8
set fencs=utf-8,gb18030,gbk,gb2312,cp936,euc-jp,shift-jis
set enc=utf-8

" share clipboard
set clipboard+=unnamed

" no visual bell
set novisualbell
" no bell(in awesome)
" set vb t_vb=

" slim gui
set guioptions=ai
set mouse=a

" keywords
set iskeyword+=_,$,@,#,-

" auto read
set autoread

" auto dir
set autochdir

" line number
set relativenumber

" syntax colo
syntax on

" set indent
" set autoindent
" set smartindent

" file type check
filetype off

" ================================================ 
" Bundle section
" ================================================ 
" setup vundle
set runtimepath+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/vundle'
" Plugin 'msanders/snipmate.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Plugin 'jtratner/vim-flavored-markdown'
" Plugin 'a.vim'
" Plugin 'drawit'
" Plugin 'majutsushi/tagbar'
" Plugin 'rking/ag.vim'
" Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Lokaltog/vim-powerline'
" Plugin 'tpope/vim-fugitive'
" Plugin 'rizzatti/dash.vim'
" Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-haml'

" reset filetype
call vundle#end()
filetype plugin indent on

" ************************************************ 
" Neocomplete section
" ************************************************ 
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" ************************************************ 
" EasyMotion section
" ************************************************ 
let g:EasyMotion_leader_key='<Leader>'

" ************************************************ 
" Nerdtree section
" ************************************************ 
let g:NERDTreeIgnore=['.o$[[file]]', '.bin$[[file]]', '.img$[[file]]']

" ************************************************ 
" Nerdcomment section
" ************************************************ 
let g:NERDSpaceDelims=1
let g:NERDRemoveExtraSpaces=1

" ************************************************ 
" Markdown section
" ************************************************ 
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

" ************************************************ 
" Tagbar section
" ************************************************ 
let g:tagbar_ctags_bin="ctags"
let g:tagbar_width=30

" ************************************************ 
" Ag section
" ************************************************ 
let g:aghighlight=1

" ************************************************ 
" Indentline section
" ************************************************ 
" Set char
let g:indentLine_char='┆' 
let g:indentLine_faster=1

" ************************************************ 
" Auto-pair section
" ************************************************ 
let g:AutoPairs={'(':')', '[':']', '{':'}', "'":"'", '"':'"'}
let g:AutoPairsMapBS=0

" ************************************************ 
" Powerline section
" ************************************************ 
" Set powerline style
" let g:Powerline_symbols='fancy'

" ************************************************ 
" Snipmate section
" ************************************************ 
let g:snips_author='Justin Jia'

" ================================================ 
" View section
" ================================================ 
" colo schema
if $TERM == 'xterm' || $TERM == 'xterm-256color' || $TERM == 'screen-256color'
  set t_Co=256
  colo desertEx_jj
else
  colo elflord
endif

" no syntax for large file
au BufReadPost * if getfsize(bufname("%")) > 512*1024 |
\ set syntax= |
\ set nowrap |
\ endif

" status bar
set laststatus=2

" cli height
set cmdheight=2


" ================================================ 
" Edit section
" ================================================ 
" set cond comment
set formatoptions=cqrt
" linewrap for latex
au FileType plaintex setlocal formatoptions+=Mm textwidth=80
let g:tex_fast=""

" set filetype
" au BufNewFile,BufRead, *.{md,mkd} setlocal ft=mkd
augroup markdown
  au!
  au BufNewFile,BufRead, *.{md,mkd,markdown} setlocal ft=markdown
augroup end
au BufNewFile,BufRead, *.jade setlocal ft=jade
au BufNewFile,BufRead, *.ejs setlocal ft=html
au BufNewFile,BufRead, *.{asm,inc} setlocal ft=nasm
au BufNewFile,BufRead, *.jbuilder setlocal ft=ruby
au BufNewFile,BufRead, *.bpel setlocal ft=xml

" set tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
"au FileType html,jade setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType make setlocal tabstop=4 shiftwidth=4 noexpandtab
au FileType scheme setlocal cursorcolumn
au FileType ruby setlocal fo-=o

" show bracket match
set showmatch
set matchtime=2

" config backspace act
set backspace=eol,start,indent

" search hint
set incsearch
set hlsearch
" set ignorecase
set smartcase

" use space to folden
set foldmethod=syntax
set foldlevelstart=99
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>
set foldopen-=search
set foldopen-=undo

" ================================================ 
" Moving section
" ================================================ 
" remap 0
map 0 ^

" bracket jump
map <C-i> %

" move as break line
map j gj
map k gk

" smart move windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" scroll down half page
func! Scrolld()
  exec "normal ".(winheight(winnr())/2)."\<C-e>"
endfunc
map <C-d> :call Scrolld()<cr>

" ================================================ 
" Self utilities
" ================================================ 
" compile and run
func! Compile()
  exec "w"
  if &filetype == 'c'
    exec "!gcc-4.8 % -O2 -lm -fno-asm -Wall -std=c11 -o %<.run"
  elseif &filetype == 'cpp'
    exec "!g++-4.8 % -O2 -lm -fno-asm -Wall -std=c++11 -o %<.run"
  endif
endfunc

func! Run()
  exec "w"
  if &filetype == 'c' || &filetype == 'cpp'
    exec "!./%<.run"
  elseif &filetype == 'ruby'
    exec "!ruby -I ../lib:../../lib:../../../lib  %<.rb"
  elseif &filetype == 'python'
    exec "!python3 %<"
  elseif &filetype == 'php'
    exec "!php %<.php"
  elseif &filetype == 'js'
    exec "!node %<"
  endif
endfunc

" tab page switch
if has("mac")
  set macmeta
end
func! TabPos_ActivateBuffer(num)
    let s:count = a:num 
  exe "tabfirst"
  exe "tabnext" s:count  
endfunc

func! TabPos_Initialize()
    for i in range(1, 9) 
      exe "map <M-" . i . "> :call TabPos_ActivateBuffer(" . i . ")<CR>"
    endfor
    exe "map <M-0> :call TabPos_ActivateBuffer(10)<CR>"
endfunc

" toggle tree&buffer view
func! LSidebarToggle()
    let b = bufnr("%")
    " exec "NERDTreeToggle | BuffergatorToggle"
    exec "NERDTreeToggle"
    " exec bufwinnr(b) . "wincmd w"
endfunc

" drawit
func! DrawToggle()
  if exists("b:dodrawit") && b:dodrawit == 1
    " exec DrawIt#DrawItStart()
    DrawIt!
    NeoCompleteEnable
  else
    NeoCompleteDisable
    DrawIt
  endif
endfunc

" ================================================ 
" Shortcut remaps
" ================================================ 
" shortcut for IDE view
silent nmap <F2> :call LSidebarToggle()<cr>
silent imap <F2> <esc>:call LSidebarToggle()<cr>
silent nmap <F3> :A<cr>
silent imap <F3> <esc>:A<cr>

" shortcut for tagbar view
silent map <F4> :TagbarToggle<cr>

" shortcut for compile & run
silent map <F5> :call Compile()<cr>
silent map <F6> :call Run()<cr>

" draw
silent map <F7> :call DrawToggle()<cr>

" clip & paste
vnoremap <C-c> "+y
vnoremap <C-v> "+p

" ================================================ 
" Initialize utilities
" ================================================ 
autocmd VimEnter * call TabPos_Initialize()
