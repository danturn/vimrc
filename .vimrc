"Autogenerated .vimrc entries

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

set rtp+=~/.fzf
Plug 'elixir-lang/vim-elixir'
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'elmcast/elm-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-mix-format'

call plug#end()

map <F5> :!clear & mix test<CR>
map <F6> :!clear & elixir %<CR>
inoremap jj <ESC>

filetype plugin indent on
syntax on
set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%*
set expandtab
set shiftwidth=2
set softtabstop=2
set autowrite
set autoread
set incsearch
set nocompatible
set number
set ttyfast
set hlsearch
set laststatus=2
set noshowmode

set t_Co=256
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

let g:lightline = { 'colorscheme': 'solarized'}
let g:lightline = {
      \   'component_function': {
      \     'filename': 'LightLineFilename'
      \   },
      \   'colorscheme': 'solarized'
      \ }
function! LightLineFilename()
  return expand('%')
endfunction

filetype plugin on
set omnifunc=syntaxcomplete#Complete
set wildignore+=*/node_modules/*,*/deps/*,*/tmp/*,*.so,*.swp,*.zip
noremap <C-p> :Files<cr>

let $FZF_DEFAULT_COMMAND = 'ack -g ""'

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePost * doautocmd Syntax
autocmd BufReadPost * doautocmd Syntax
autocmd Filetype php setlocal expandtab shiftwidth=4 softtabstop=4

silent !mkdir -p ~/.vim/undo
set undofile
set undodir=~/.vim/undo
let s:undos = split(globpath(&undodir, '*'), "\n")
call filter(s:undos, 'getftime(v:val) < localtime() - (60 * 60 * 24 * 90)')
call map(s:undos, 'delete(v:val)')

let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1
