set nocompatible              " be iMproved, required"
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
set rtp+=$HOME/.vim/UltiSnips

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"    Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"    Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'scrooloose/nerdcommenter'


Plugin 'iamcco/markdown-preview.nvim'
Plugin 'mxw/vim-jsx'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'SirVer/ultisnips'
"    Plugin 'lervag/vimtex'
"    vimtex makes vim super slow with tex files!

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" source .vimrc from dir where vim is run (for project specific config)
set exrc
" dont allow security vulns introduced by above line
set secure

"inoremap { {}<Left>

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
set t_Co=256
syntax on
set background=dark
colorscheme evening

hi clear SpellBad
hi SpellBad cterm=underline

" Figure out how to make this much darker
" highlight CursorLine cterm=NONE ctermbg=darkgrey ctermfg=NONE
"set cursorline

" high-light anything over 80 chars on a line
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

" let g:UltiSnipsSnippetsDir = "~/.ulti-snippets" " does not work...
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsUsePythonVersion = 3
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

set autoread
set antialias
set backspace=2  " Backspace for dummies
set linespace=0  " No extra spaces between rows
set tabstop=2
set shiftwidth=2
set expandtab
"set smarttab

"set scrolloff=999               " Minimum lines to keep above and below cursor
set list
"set listchars=tab:›\ ,eol:¬,trail:⋅ "Set the characters for the invisibles
set listchars=tab:⋅\ ,trail:⋅ "Set the characters for the invisibles
set splitbelow
set splitright
set undolevels=1000 " Never can be too careful when it comes to undoing
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=100 " Increase history from 20 default to 1000
set laststatus=2 " Always show status line
set noerrorbells " Disable error bells.
set nostartofline
set ruler " Show the cursor position
set title " Show the filename in the window titlebar.
scriptencoding utf-8

:command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'

" define text objects for LaTeX
vnoremap a$ :<C-U>silent! normal! F$vf$<CR>
vnoremap i$ :<C-U>silent! normal! T$vt$<CR>
omap i$ :normal vi$<CR>
omap a$ :normal va$<CR>

let mapleader = "\\"

" hide swp files in file browser
let g:netrw_list_hide= '.*\.swp$,\~$,\.orig$'

augroup txt_file_settings " {
  autocmd FileType text setlocal spell
augroup END }"

augroup README_settings " {
  autocmd FileType md setlocal spell
augroup END }"

augroup latex_settings " {
  autocmd FileType tex setlocal spell
  autocmd FileType tex noremap <leader>d :w<CR> <bar> :Silent $(tmux send-keys -t bottom 'pdflatex -interaction=nonstopmode %' C-m)<CR>
augroup END }"

augroup python_settings " {
  autocmd FileType python noremap <leader>d :w<CR> <bar> :Silent $(tmux send-keys -t bottom 'python %' C-m)<CR>
augroup END }"


" disable Ex mode
map q: <Nop>
noremap Q <Nop>

" disable F1 into help (remap to esc)
map <F1> <Esc>
imap <F1> <Esc>

" Enable copying to clipboard using `CTRL + c`
map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>
