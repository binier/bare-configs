" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
" VimPlug: {{{
  let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
  if !filereadable(plugpath)
      if executable('curl')
          let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
          call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
          if v:shell_error
              echom "Error downloading vim-plug. Please install it manually.\n"
              exit
          endif
      else
          echom "vim-plug not installed. Please install it manually or install curl.\n"
          exit
      endif
  endif
" }}}

call plug#begin('~/.config/nvim/plugged')

" Plug '~/projects/neovim-calculator'
Plug '~/projects/neovim-dbman'

" Legacy Vim: {{{
  " Compatibility for legacy vim with neovim's async api
  if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'roxma/nvim-yarp'
  endif
" }}}

" Dependencies: {{{
  " Create custom text objects (required by rubyblock,xmlattr)
  Plug 'kana/vim-textobj-user'
" }}}

" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" comments
Plug 'tpope/vim-commentary'

" allow (non-native) plugins to use the . command
Plug 'tpope/vim-repeat'

" Surround text with closures
Plug 'tpope/vim-surround'

" save vim sessions
Plug 'tpope/vim-obsession'

" Improved motion in Vim
" Plug 'easymotion/vim-easymotion'

" Intellisense Engine
" Plug 'neoclide/coc.nvim', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Searching: {{{
  " highlights all search results and allows tabbing between them
  Plug 'haya14busa/incsearch.vim'

  " Sublime text like search results
  Plug 'dyng/ctrlsf.vim', { 'on': 'CtrlSF' }

  " RipGrep - grep is dead. All hail the new king RipGrep.
  Plug 'jremmen/vim-ripgrep'
" }}}

" Align Code: {{{
  " same as tabular but by Junegunn and way easier
  Plug 'junegunn/vim-easy-align'
" }}}

" TMUX: {{{
  " .tmux.conf syntax highlighting
  Plug 'keith/tmux.vim', { 'for': 'tmux' }

  " tmux config file stuff
  Plug 'tmux-plugins/vim-tmux', { 'on': 'Mux' }

  " vim slime for tmux integration (C-c, C-c to send selction to tmux)
  Plug 'jpalardy/vim-slime', { 'on': 'Mux' }

  " seamless tmux/vim pane navigation
  Plug 'christoomey/vim-tmux-navigator', { 'on': 'Mux' }

  " yet another tmux plugin
  Plug 'benmills/vimux', { 'on': 'Mux' }

  " autocomplete using text from tmux
  Plug 'wellle/tmux-complete.vim', { 'on': 'Mux' }
" }}}

" Git: {{{
  Plug 'tpope/vim-fugitive'
  Plug 'lambdalisue/gina.vim'
  Plug 'mhinz/vim-signify'
  Plug 'junegunn/gv.vim'
  Plug 'sodapopcan/vim-twiggy'
  Plug 'rhysd/git-messenger.vim'
" }}}


" HTML: {{{
  " Emmet: generates html tags, autocomplete css
  Plug 'mattn/emmet-vim'

  " RagTag: Auto-close html tags + mappings for template scripting languages
  Plug 'tpope/vim-ragtag'

  " add text object for HTML attributes - allows dax cix etc
  Plug 'whatyouhide/vim-textobj-xmlattr'
" }}}

" CSS SCSS: {{{
  " up to date CSS3 syntax highlighting
  Plug 'hail2u/vim-css3-syntax'

  " css language server
  Plug 'vscode-langservers/vscode-css-languageserver-bin'
" }}}

" JavaScript: {{{
  " JavaScript support (required by vim-jsx)
  Plug 'pangloss/vim-javascript'

  " Improved syntax highlighting and indentation
  Plug 'othree/yajs.vim'

  " JSON manipulation
  Plug 'tpope/vim-jdaddy', { 'for': 'json' }

  " Generate JSDoc commands based on function signature
  Plug 'heavenshell/vim-jsdoc'

  " Syntax highlighting for javascript libraries
  Plug 'othree/javascript-libraries-syntax.vim'
" }}}

" TypeScript: {{{
  Plug 'leafgarland/typescript-vim'
" }}}

" Dart Flutter: {{
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'
" }}

" VimScript: {{{
  " vim plugin for writing vim plugins
  Plug 'tpope/vim-scriptease'
" }}}

" Docker {{{
  Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
" }}}

" File Explorer: {{{
  Plug 'Shougo/defx.nvim'

  " Plug 'kristijanhusak/defx-git'

  " Plug 'kristijanhusak/defx-icons'
" }}}

" Airline: {{{
  " Customized vim status line
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
" }}}

Plug 'majutsushi/tagbar'
" Indent lines (visual indication)
Plug 'Yggdroot/indentLine'

" resize windows in vim naturally
Plug 'simeji/winresizer', { 'on': 'WinResizerStartResize' }

" Colorscheme
Plug 'mhartington/oceanic-next'

" Icons
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
