set nocompatible

set langmenu=en_US
let $LANG= 'en_US'


source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
set tags=tags
set autochdir

set nu!
colorscheme desert
syntax enable
syntax on
set guifont=courier_new:h12
set shiftwidth=4
set sts=4
set tabstop=4
set expandtab
set nobackup
set fileencodings=ucs-bom,utf-8,gb2312,gbk,cp936,gb18030,big5,euc-jp,euc-kr,latin1,shift-jis
set encoding=utf-8
set termencoding=cp936
language messages zh_CN.UTF-8

syn match cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunction gui=NONE guifg=#B5A1FF


filetype off

set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#rc('$VIM/vimfiles/bundle/')
Bundle 'VundleVim/Vundle.vim'


filetype plugin indent on

Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'

Bundle 'scrooloose/nerdtree'
Bundle 'terryma/vim-multiple-cursors'

Bundle 'majutsushi/tagbar'

filetype plugin indent on

let g:ycm_python_binary_path = 'C:/Python27'
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_invoke_completion = '<M-;>'
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>


"powerline
set laststatus=2
set noshowmode
set t_Co=256


let g:NERDTree_title='[NERD Tree]'
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
autocmd BufRead *  25vsp  ./

let g:tagbar_ctags_bin='C:\vim\vimfiles\bundle\ctags58\ctags.exe'
let g:Tagbar_title = "[Tagbar]"
function! Tagbar_Start()
    exe 'Tagbar'
endfunction
function! Tagbar_IsValid()
    return 1
endfunction
let g:tagbar_right = 1 
map <silent> ss :Tagbar<cr>

"设置vim-multiple-cursors
