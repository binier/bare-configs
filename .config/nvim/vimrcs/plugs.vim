call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'

runtime vimrcs/plugins/nerdtree.vim
runtime vimrcs/plugins/lightline.vim
runtime vimrcs/plugins/fzf.vim

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
" Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

if v:version >= 703
  Plug 'Shougo/vimshell.vim'
endif

if v:version >= 704
  "" Snippets
  Plug 'SirVer/ultisnips'
endif

Plug 'honza/vim-snippets'

"" Color
Plug 'rakr/vim-one'
Plug 'tomasr/molokai'
Plug 'rafi/awesome-vim-colorschemes'
"*****************************************************************************
"" Custom bundles
"*****************************************************************************
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'w0rp/ale'

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'


" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'


" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'

" Rust.vim
Plug 'rust-lang/rust.vim'

" Needs to be last!
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Required:
filetype plugin indent on


