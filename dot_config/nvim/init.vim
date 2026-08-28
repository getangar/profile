" === Base ===
let mapleader = " "
let maplocalleader = ' '
nmap ]q :cnext<CR>
nmap [q :cprevious<CR>
nmap <C-s> :w!<CR>
nmap <ESC> :nohlsearch<CR>
vmap <Leader>P "_dP
nmap <Leader>P "_dP
vmap <leader>y <Plug>OSCYankVisual

set nu
set relativenumber
command! ToggleLineNumbers call ToggleLineNumbersFunc()

function! ToggleLineNumbrersFunc()
if (&number || &relativenumber)
	set nonumber norelativenumber
else
	set number relativenumber
endfunction

nmap <Leader>r :ToggleLineNumbers<CR>
set showmode

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set ignorecase
set smartcase

set list
set listchars=tab:»\ ,trail:·,nbsp:⎵

set cursorline
set hlsearch

set mouse=a
syntax enable

let g:tmux_navigator_no_mapping = 1


set termguicolors
set updatetime=300
set clipboard=unnamedplus
set undofile | silent! call mkdir(expand('~/.vim/undodir'), 'p') | let &undodir='~/.vim/undodir'
set rtp+=/opt/homebrew/opt/fzf

" === Bootstrap vim-plug (installa se manca) ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" === Plugin ===
call plug#begin('~/.vim/plugged')

" Git & utilità
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'ojroques/vim-oscyank'


" Ricerca & file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LSP / completion (scegline uno: coc.nvim è semplice)
Plug 'neovim/nvim-lspconfig'      " innocuo anche su Vim classico (lo userai se passi a Neovim)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Sintassi extra
Plug 'sheerun/vim-polyglot'

" Tema (scegline uno; installiamo entrambi)
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

call plug#end()

" === Colori (fallback sicuro) ===
set background=dark
try
  colorscheme solarized
catch
  try
    colorscheme gruvbox
  catch
    " se fallisce tutto, resta il tema di default
  endtry
endtry

" === Mapping ===
let mapleader="\<Space>"
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>     " usa ripgrep (:Ag richiede silver_searcher)
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" fzf: usa ripgrep per Rg se disponibile
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git"'
endif

set mouse=a
