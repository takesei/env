"-----------------------------------
" Basic Setting
" -----------------------------------
set backspace=indent,eol,start
set notitle
set number
set laststatus=2
set backupdir=~/.config/nvim/tmp
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=2 expandtab shiftwidth=2 softtabstop=2

filetype off
filetype plugin indent off

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable

if (has("termguicolors"))
 set termguicolors
endif
if &term =~ '256color'
  set t_ut=
endif

"-----------------------------------
" Keybind
"-----------------------------------
inoremap <silent> jj <Esc>

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" inoremap [ []<Left>
" inoremap [<Enter> []<Left><CR><ESC><S-o>
" inoremap { {}<Left>
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap ( ()<Left>
" inoremap (<Enter> ()<Left><CR><ESC><S-o>
" inoremap < <><Left>
" inoremap <<Enter> <><Left><CR><ESC><S-o>
" inoremap ' ''<Left>
" inoremap " ""<Left>
" inoremap '''<Enter> '''<Left><CR><ESC><S-o>

nnoremap <silent> <Space>o   :<C-u>for i in range(1, v:count1) 
			\\| call append(line('.'),   '') 
			\\| endfor 
			\\| silent! call repeat#set("<Space>o", v:count1)<CR>
nnoremap <silent> <Space>O   :<C-u>for i in range(1, v:count1) 
			\\| call append(line('.')-1, '') 
			\\| endfor 
			\\| silent! call repeat#set("<Space>O", v:count1)<CR>

"-----------------------------------
" Import Dein
"-----------------------------------
" AutoInstall
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XGD_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir . "," . &runtimepath

" ReadPlugins & MakeCaches
let s:rc_dir = fnamemodify(expand('<sfile>'), ':h') 
let s:toml      = s:rc_dir . '/dein.toml'
let s:lazy_toml = s:rc_dir . '/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

" InstallLuckPackage
if has('vim_starting') 
  if dein#check_install()
    call dein#install()
  endif
endif

filetype plugin indent on

"set background=dark
"let g:hybrid_term_colors = 1
"let g:hybrid_reduced_contrast = 1
colorscheme OceanicNext