call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'

runtime vimrcs/plugins/nerdtree.vim
runtime vimrcs/plugins/lightline.vim
runtime vimrcs/plugins/fzf.vim
" runtime vimrcs/plugins/coc.nvim
" runtime vimrcs/plugins/languageClient.nvim

let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"" Color
Plug 'rakr/vim-one'
Plug 'tomasr/molokai'
Plug 'rafi/awesome-vim-colorschemes'
"*****************************************************************************
"" Custom bundles
"*****************************************************************************

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs'
Plug 'w0rp/ale'

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

