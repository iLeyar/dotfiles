filetype off                  " required
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'jdevera/vim-cs-explorer'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'altercation/vim-colors-solarized'

" Plugin 'junegunn/limelight.vim'
" Plugin 'junegunn/seoul256.vim'
" Plugin 'junegunn/goyo.vim'
" Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"Used as $x^2$, $$x^2$$, escapable as \$x\$ and \$\$x\$\$.

let g:vim_markdown_folding_disabled = 1
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_no_default_key_mappings=1

"nnoremap <Leader>w :Goyo<CR>
" map <silent> <F12> :Goyo<CR>
" autocmd User GoyoEnter Limelight
" autocmd User GoyoLeave Limelight!
" let g:goyo_width = 90
" let g:goyo_margin_top = 4
" let g:goyo_margin_bottom = 4
" let g:goyo_linenr = 0

" Color name (:help cterm-colors) or ANSI code
" let g:limelight_conceal_ctermfg = 'gray'
" let g:limelight_conceal_ctermfg = 240
" 
" " Color name (:help gui-colors) or RGB color
" let g:limelight_conceal_guifg = 'DarkGray'
" let g:limelight_conceal_guifg = '#777778'
" 
" " Default: 0.5
" let g:limelight_default_coefficient = 0.7
"
" seoul256 (dark):
" Range:   234 (darkest) ~ 239 (lightest)
" Default: 237
" colo seoul257
" let g:seol256_background = 233

map <leader>d :ColorSchemeExplorer<CR>

" let g:solarized_termcolors=256
colorscheme solarized
set background=dark "light "dark
"if has('gui_running')
"		set background=light
"else
"		set background=dark
"endif

" emmet
"let g:user_emmet_expandabbr_key = '<Tab>'
let g:user_emmet_install_global = 1
let g:emmet_html5=1
let g:user_emmet_complete_tag=1

set backspace=indent,eol,start
set autoindent
set nu!
syntax enable
"syntax on
set ai!
set showmatch
set incsearch
set tabstop=4
set softtabstop=4

set ruler
"set smartindent
set laststatus=2
set cursorline 
set foldmethod=manual
"set mouse=a

" Display incomplete commands
set showcmd
set hlsearch
set nocompatible
set fileencodings=utf-8,gb18030,gbk,big5
set whichwrap=b,s,h,l,<,>,[,]

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" The NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <C-n> :NERDTreeToggle<CR>

"Tabular
let mapleader=','
if exists(":Tabularize")
 nmap <Leader>a= :Tabularize /=<CR>
 vmap <Leader>a= :Tabularize /=<CR>
 nmap <Leader>a: :Tabularize /:\zs<CR>
 vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
 let p = '^\s*|\s.*\s|\s*$'
 if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
  let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
  let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
  Tabularize/|/l1
  normal! 0
  call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
 endif
endfunction

" airline
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_iminsert=0
let g:airline_inactive_collapse=1

" YouCompleteMe
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f' 

if executable('ag')
	  " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
	  "     " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	    " Ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
 endif
	 


