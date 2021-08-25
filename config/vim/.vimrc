syntax on

let mapleader = ","

set clipboard=unnamedplus
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree'
Plug 'lyuts/vim-rtags'
Plug 'neovim/nvim-lspconfig'
Plug 'arcticicestudio/nord-vim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
call plug#end()

let g:coq_settings = { 'auto_start': v:true }

nnoremap <leader>v <cmd>CHADopen<cr>

colorscheme nord

" let g:ale_cpp_ccls_init_options = {
" \   'cache': {
" \       'directory': '/tmp/ccls/cache'
" \   }
" \ }
" 
" let g:ale_completion_enabled = 1
