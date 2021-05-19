syntax on
source $VIMRUNTIME/defaults.vim

set spelllang=en_us
set nohlsearch
set number
set relativenumber
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80
set scrolloff=10
set signcolumn=yes
set nowrap

highlight ColorColumn ctermbg=0 guibg=lightgrey

xnoremap tt :!xclip -f -sel clip<CR>

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'mbbill/undotree'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'

Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-scripts/DrawIt'


call plug#end()


colorscheme gruvbox
set background=dark
let g:airline_powerline_fonts = 1


if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = ","
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

nnoremap <leader>e :edit<SPACE>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>z :terminal<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gu :NERDTree<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>[ :read<SPACE>!figlet<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Wqa wqa

" Build and run the cpp file and the python files
nnoremap <leader>b :!g++ %:p -o CPP_TEMPERARY_OUTPUT_FILE && ./CPP_TEMPERARY_OUTPUT_FILE && rm ./CPP_TEMPERARY_OUTPUT_FILE<CR>
nnoremap <leader>; :w !python3<CR>

" To Remove The whitespaces after the files saved
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup ME
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
