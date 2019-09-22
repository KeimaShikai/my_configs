runtime! debian.vim

"################################"
"#########FOR_MY_PLUGINS#########"
"################################"

set nocompatible              " be iMproved, required
filetype off                  " required

" The block to setup the 'vundle'
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added after this line
"#############################"
Plugin 'Valloric/YouCompleteMe'
" Disable global config for YCM
let g:ycm_confirm_extra_conf = 0
" Look for extra configs in current dir
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" Turn off the window with extra info about functions
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
" Buttons to evoke and hide preview
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_invoke_completion = '<C-Space>'
" Bindings for YcmCompleter 
" (also you can bind GoToInclude, GoToDeclaration, GoToDefinition)
" (also you can use smth like :rightbelow vertical YcmCompleter GoTo)
noremap <F3> :tab YcmCompleter GoTo<CR> 
noremap <F4> :YcmCompleter FixIt<CR>

Bundle 'rdnetto/YCM-Generator' 
"To generate config use :YcmGenerateConfig

"Plugin 'francoiscabrol/ranger.vim'
"let g:ranger_map_keys = 0
"noremap <c-f> :Ranger<CR> 
"noremap <c-t> :RangerNewTab<CR>
""let g:NERDTreeHijackNetrw = 0
"let g:ranger_replace_netrw = 1
""let g:ranger_choice_file = "~/.ranger_temp"

Bundle 'Lokaltog/vim-powerline'
set laststatus=2

Plugin 'scrooloose/nerdcommenter'
let mapleader=","
set timeout timeoutlen=1500

Plugin 'scrooloose/nerdtree'
" Automatically start NerdTree when file wasn't specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Automatically start NerdTree when open a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Close vim if the only open window is NerdTree 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Add an ability ti toggle NerdTree
map <C-f> :NERDTreeToggle<CR>
map <C-t> ,t<C-f><CR>
" Show hidden files
let NERDTreeShowHidden=1

"Plugin 'stevearc/vim-arduino'
"au BufRead,BufNewFile *.pde set filetype=arduino
"au BufRead,BufNewFile *.ino set filetype=arduino

"#############################"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate

"################################"
"########FOR_MY_SETTINGS#########"
"################################"

" Enable syntax highlighting by default (for Vim5+)
if has("syntax")
  syntax on
endif

" Added this for using tmux with standart color scheme
set background=dark 

" Make Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Search settings
set ignorecase		" Do case insensitive matching
set incsearch		" Incremental search

" Enable mouse usage 
set mouse=a

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Allow to add to project 'vimrc' file
set exrc
set secure

" Settings for tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
noremap ,t :tabnew<CR>

" Show line numbers
set number
set rnu

" Display Vim command mode autocompletion list 
set wildmenu
set wildmode=longest:full,full 

" Make backspace act properly
:set backspace=indent,eol,start

" Turn off F1 manual openning
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

" Quick save
noremap <F5> :wa<CR>

" Add automatic text wrapping for whole words
set linebreak

" Add an ability to autoread updated files
set autoread

" Add an ability to folding
set foldenable          " Turn on folding
set foldmethod=indent   " Use indentations to fold
set foldcolumn=0        " Hide fold column
set foldlevel=11        " Autoopen 11 levels of foldings when the file is open

" Show tabs and spaces in the end of the line 
set list
set listchars=tab:>-,trail:-

"################################"
"########FOR_MY_FUNCTIONS########"
"################################"

" Shows the limit line on the 80 character
set colorcolumn=400
highlight ColorColumn ctermbg=darkgray

nnoremap <F2> :<C-U>call SummonColumn()<CR>
function SummonColumn()
    let c = &colorcolumn
    if c == 81
        set colorcolumn=400
    else
        set colorcolumn=81
    endif
endfunction

" TODO "
" Make a dirty hack for Ycm, that can help you to use single hotkey 
" to hide/open ycm preview
"let switcher=1

"nnoremap <C-Space> :<C-U>call HideOpenYcmPreview()<CR>
"function HideOpenYcmPreview()
    "let s = &switcher
    "if s == 1
        "" esc+esc+a
        "set switcher=0
    "else
        "" C-y
        "set switcher=1
    "endif
"endfunction
""" bind invoke to (<>) and (<C-Space>)
