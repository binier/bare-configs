scriptencoding utf-8
execute "set guioptions=M"

let g:phome = '~/.config/nvim/'

function! Source(path)
  exec "source " . g:phome . '/' . a:path
endfunction

" source plugin config file
function! SourcePlugin(fname)
  call Source('plugins/' . a:fname)
endfunction

call Source('plugins.vim')
call SourcePlugin('defx.vim')
call SourcePlugin('airline.vim')
" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "

" Vim Settings: {{{
  map <space> <leader>

  " Disable line numbers
  set nonumber

  " enable mouse
  set mouse=a

  " Don't show last command
  set noshowcmd

  set foldmethod=syntax
  set foldnestmax=2
  " set nofoldenable

  " do incremental searching
  set incsearch

  " extended regular expressions
  set magic

  " Yank and paste with the system clipboard
  set clipboard=unnamed

  " Hides buffers instead of closing them
  set hidden

  " === TAB/Space settings === "
  " Insert spaces when TAB is pressed.
  set expandtab

  " Change number of spaces that a <Tab> counts for during editing ops
  set softtabstop=2

  " Indentation amount for < and > commands.
  set shiftwidth=2

  " Smaller updatetime for CursorHold & CursorHoldI
  set updatetime=200

  " do not wrap long lines by default
  set nowrap

  " don't compare whitespace in vimdiff
  set diffopt+=iwhite

  " use vertical diff
  set diffopt+=vertical

  " Don't highlight current cursor line
  set nocursorline

  " Disable line/column number in status line
  " Shows up in preview window when airline is disabled if not
  set noruler

  " make scrolling faster
  set ttyfast
  set lazyredraw
  set regexpengine=1

  " Only one line for command line
  set cmdheight=1

  " === Completion Settings === "

  " Don't give completion messages like 'match 1 of 2'
  " or 'The only match'
  set shortmess+=c
" }}}

" Move by line
nnoremap j gj
nnoremap k gk

" indent by single click on '>' and '<'
nmap > >>_
xmap > >gv

nmap < <<_
xmap < <gv

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" === Git === "
noremap <leader>gf :Gina fetch<CR>
noremap <leader>gp :Gina pull<CR>
noremap <Leader>gP :Gina push<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
" add/stage current file
noremap <Leader>ga :Gina add %<CR>
" unstage current file
noremap <Leader>gu :Gina reset -q %<CR>
" undo last commit
noremap <Leader>gU :Gina reset --soft HEAD~1<CR>

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<Down>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<C-h>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>af  <Plug>(coc-fix-current)

" Remap for format selected region
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" === NeoSnippet === "
" Map <C-k> as shortcut to activate snippet if available
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Load custom snippets from snippets folder
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" Hide conceal markers
let g:neosnippet#enable_conceal_markers = 0

" === vim-javascript === "
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

" === javascript-libraries-syntax === "
let g:used_javascript_libs = 'underscore,requirejs,chai,jquery'

" === Signify === "
let g:signify_sign_delete = '-'

" ======================================
" FZF + DevIcons
" ======================================

" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = '--preview "rougify {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    " TODO: not working
    let l:cmd = get({
               \ 'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'
               \ }, a:item[0], 'e')
    execute 'silent ' . l:cmd . ' ' . l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m --expect=ctrl-t,ctrl-v,ctrl-x '.
        \            l:fzf_files_options,
        \ 'down':    '40%' })
endfunction

" Custom FZF commands ----------------------------- {{{
fun! s:change_branch(e)
  let l:_ = system('git checkout ' . a:e)
  :e!
  :AirlineRefresh
  echom 'Changed branch to' . a:e
endfun

command! Gbranch call fzf#run(
      \ {
      \ 'source': 'git branch',
      \ 'sink': function('<sid>change_branch'),
      \ 'options': '-m',
      \ 'down': '20%'
      \ })

fun! s:change_remote_branch(e)
  let l:_ = system('git checkout --track ' . a:e)
  :e!
  :AirlineRefresh
  echom 'Changed to remote branch' . a:e
endfun

" --------------------------------------------------}}}

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" Enable true color support
set termguicolors

" Editor theme
set background=dark
try
  colorscheme OceanicNext
catch
  colorscheme slate
endtry

" Vim airline theme
let g:airline_theme='bubblegum'

" Add custom highlights in method that is executed every time a
" colorscheme is sourced
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f for
" details
function! MyHighlights() abort
  " Hightlight trailing whitespace
  highlight Trail ctermbg=red guibg=red
  call matchadd('Trail', '\s\+$', 100)
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call MyHighlights()
augroup END

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
set splitbelow
set splitright

" Don't dispay mode in command line (airilne already shows it)
set noshowmode
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

" Make background transparent for many things
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! LineNr ctermfg=NONE guibg=NONE
hi! SignColumn ctermfg=NONE guibg=NONE
hi! StatusLine guifg=#16252b guibg=#6699CC
hi! StatusLineNC guifg=#16252b guibg=#16252b

" Try to hide vertical spit and end of buffer symbol
hi! VertSplit gui=NONE guifg=#17252c guibg=#17252c
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=#17252c guifg=#17252c

" Customize NERDTree directory
hi! NERDTreeCWD guifg=#99c794

" Make background color transparent for git changes
hi! SignifySignAdd guibg=NONE
hi! SignifySignDelete guibg=NONE
hi! SignifySignChange guibg=NONE

" Highlight git change signs
hi! SignifySignAdd guifg=#99c794
hi! SignifySignDelete guifg=#ec5f67
hi! SignifySignChange guifg=#c594c5

augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of preview window when open
function! Handle_Win_Enter()
  if &previewwindow
    setlocal winhighlight=Normal:MarkdownError
  endif
endfunction

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

" FZF: {{{
  nnoremap <leader>b :Buffers<CR>
  nnoremap <leader>B :Gbranch<CR>
  " git ls-files
  nnoremap <expr> <leader>ff (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"
  " ls all files
  nnoremap <leader>fF :Files<CR>
  " lines for current buffer
  nnoremap <leader>fl :BLines<CR>
  " lines for opened buffers
  nnoremap <leader>fL :Lines<CR>
  nnoremap <leader>fm :Marks<CR>
  " REQUIRES: "fugitive.vim", commits for current buffer
  nnoremap <leader>fc :BCommits<CR>
  " REQUIRES: "fugitive.vim", commits
  nnoremap <leader>fC :Commits<CR>
" }}}

" === File Explorer === "
map <silent> <F1> :Defx<CR>
map <silent> <F2> :Defx `expand('%:p:h')` -search=`expand('%:p')`<CR>
map <F3> :Twiggy<CR>
map <F4> :TagbarToggle<CR>

" === coc.nvim === "
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" === vim-better-whitespace === "
"   <leader>y - Automatically remove trailing whitespace
nmap <leader>y :StripWhitespace<CR>

" === Search shorcuts === "
"   <leader>fr - Find and replace
"   <leader>/ - Claer highlighted search terms while preserving history
map <leader>fr :%s///<left><left>
"" Clean search (highlight)
nmap <silent> <leader>/ :noh<CR>

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" === vim-jsdoc shortcuts ==="
" Generate jsdoc for function under cursor
nmap <leader>z :JsDoc<CR>

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" move line up/down with alt + k/j
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Buffer mappings
map <silent> <leader>x :bd<CR>
map <silent> <leader><space> :bp<CR>
map <silent> <leader>n :bn<CR>

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" === Search === "
" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" Enable line numbers
set number relativenumber

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
" set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
" set backup
set noswapfile

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
