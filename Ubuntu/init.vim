" {{{ Plugins
call plug#begin('~/.config/nvim/plugins')
  Plug 'arakashic/nvim-colors-solarized'
  Plug 'Zabanaa/neuromancer.vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'neomake/neomake'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim',
  Plug 'itchyny/lightline.vim',
  Plug 'mgee/lightline-bufferline',
  Plug 'sheerun/vim-polyglot'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }
  Plug 'vim-ruby/vim-ruby'
  Plug 'thoughtbot/vim-rspec'
  Plug 'alexbel/vim-rubygems'
  Plug 'Yggdroot/indentLine'
  " Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-endwise'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'junegunn/vim-easy-align'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'scrooloose/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'majutsushi/tagbar'
  Plug 'mattn/emmet-vim'
  Plug 'wellle/targets.vim'
  Plug 'kassio/neoterm'
  Plug 'vim-scripts/Vim-R-plugin'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'diepm/vim-rest-console'
  Plug 'tpope/vim-fugitive'
  Plug 'jgdavey/tslime.vim'
  Plug 'janko-m/vim-test'
  Plug 'davidhalter/jedi-vim'
  Plug 'mileszs/ack.vim'
  Plug 'KabbAmine/zeavim.vim', {'on': [
                          \       'Zeavim', 'Docset',
                          \       '<Plug>Zeavim',
                          \       '<Plug>ZVVisSelection',
                          \       '<Plug>ZVKeyDocset',
                          \       '<Plug>ZVMotion'
                          \    ]}
  Plug 'gregsexton/gitv'
  Plug 'sunaku/vim-dasht'

  " function! DoRemote(arg)
    " UpdateRemotePlugins
  " endfunction
  " Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
call plug#end()
" }}}

" {{{ colorscheme/style options
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " forces true color
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Changes cursor to a line on insert mode
set termguicolors " Enables truecolor in neovim >= 0.1.5
set number        " Displays line numbers
set novisualbell
set errorbells
set scrolloff=3   " Show 3 extra lines when scrolling up/down
set cursorline    " Highlight the line where the cursor is
set showbreak=↪
colorscheme solarized
" colorscheme neuromancer
" colorscheme PaperColor
set background=dark
set bg=dark
" }}}

" {{{ Neomake options
:highlight NeomakeSign guifg=Yellow guibg=#dc322f gui=bold
let g:neomake_open_list = 2
let g:neomake_warning_sign={'text': '•', 'texthl': 'NeomakeSign'}
let g:neomake_error_sign={'text': '!', 'texthl': 'NeomakeSign'}
" }}}

" {{{ Misc UI settings
set encoding=utf-8
scriptencoding utf-8

" Be a bit faster when executing command-line shell stuff
set noshelltemp

" hide open buffers instead of closing them, when opening a new one with :e
set hidden

" Deactivate the PRESS ENTER OR TYPE COMMAND TO CONTINUE message
set shortmess=atI

" Allows copy-pasting from other apps
set clipboard=unnamed

" Add some space around the cursor when moving it near the borders of the screen
set sidescrolloff=1

" Redraw the screen a bit less (helps when editing ruby files)
set lazyredraw

" }}}


" {{{ indentLine config
let g:indentLine_char = '│'
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
" }}}

" {{{ nerdcommenter options
let g:NERDSpaceDelims = 1
" }}}

"{{{ lightline options
" Makes sure the status line is drawn in all buffers, not only the active one
set laststatus=2
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ],
      \             [ 'neomake' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \   'neomake': 'LightlineNeomake'
      \ },
      \ 'compopent_type': {
      \   'neomake': 'error'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2

function! LightlineModified()
  return &filetype =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "\ue0a2" : ''
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? "\ue0a0".branch : ''
  endif
  return ''
endfunction

function LightlineNeomake()
  if !exists(':Neomake')
    return ''
  endif
  let counts = neomake#statusline#LoclistCounts()
  let warnings = get(counts, 'W', 0)
  let errors = get(counts, 'E', 0)
  if warnings == 0 && errors == 0
    return ''
  else
    let first = ' ['.getloclist(0)[0].lnum.']'
    if errors == 0
      return 'W:'.warnings.first
    else
      return 'E:'.errors.first
    endif
  endif
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ (&ft == 'fzf' ? 'FZF' :
       \  '' != expand('%') ? expand('%') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"}}}


" {{{ vim-closetag options
let g:closetag_filenames = "*.html,*.html.erb"
" }}}

" {{{ Key Settings
" Remap Leader key to <space>
"let g:mapleader = "\<Space>"
let g:mapleader=","              " set the <leader> key to comma

" Map ESC to jk
"imap jk <ESC>
"imap Jk <ESC>
"imap JK <ESC>

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap J gj
nnoremap k gk
nnoremap K gk

" Capslock H and L are just stupid LOL
"nnoremap H h
"nnoremap L l

" Do not exit visual mode when shifting
vnoremap < <gv
vnoremap > >gv

" comma q quits and saves, comma w saves without warnings
nmap <leader>q :q!<CR>
nmap <leader>w :w!<CR>

" shift key fixes
cmap WQ wq
cmap wQ wq

" Split buffer vertically or horizontally: leader v, leader h
nnoremap <leader>v <C-w>v
nnoremap <leader>h <C-w>s
set splitbelow splitright

" Move between splits with leader-direction instead of c-w direction
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Deleting without overriding the default clipboard
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" remap space bar to search
:nnoremap <Space> /\v

" Makes search using regexes require less \s
:nnoremap <leader>s :%s/\v

" deactivate 'Entering Ex mode' prompt
:nnoremap Q <Nop>
" }}}

" {{{ Folding settings
set nofoldenable      " disable folding (folding slows down vim in ruby, go)
set foldlevel=99      " Folds are open by default
set foldlevelstart=99 " Folds are open by default (new way)
" }}}

" {{{ Whitespace settings
set nowrap                          " don't wrap lines
set tabstop=2                       " a tab is two spaces
set shiftwidth=2                    " an autoindent (with <<) is two spaces
set expandtab                       " use spaces, not tabs
set backspace=indent,eol,start      " backspace through everything in insert mode
set list                    " Show invisible characters using listchars
set listchars=""            " Reset the listchars
set listchars=tab:›\        " show tabs as lsaquos
set listchars+=trail:·      " show trailing spaces as dots
set listchars+=nbsp:·       " show trailing non-breaking-spaces as dots
set listchars+=extends:❯    " The character in the last column when the line continues right
set listchars+=precedes:❮   " The character in the first column when the line continues left
" }}}

" {{{ Search settings
set hlsearch    " highlight matches
set incsearch   " incremental searching
set inccommand= " incremental everything
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
set gdefault    " by default, replace globally (you can ommit /g at the end of a search-and-replace
" }}}

" {{{ Wildmenu settings
set wildmenu wildmode=longest:full
set wildignorecase
" Ignore these files when auto-completing with tab (for example when opening with :e)
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem          " general programming
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz                      " compressed files
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/* " vendor and sass
set wildignore+=*/node_modules/*
set wildignore+=*.swp,*~,._*
" }}}

" {{{ Matching closing character settings
set showmatch     " Display matching parent
set matchtime=4   " Time to display matching parent, in tens of second
" }}}

" {{{ Grep settings
if executable("ag")
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif

" The :G command is like :grep, but silent, and opens the quickfix window
" instead of the first matching result
command! -nargs=+ G execute 'silent grep! <args>' | copen 42 | redraw!

" Auto-adjust the quickfix window height
au FileType qf call AdjustWindowHeight(3, 10)
 function! AdjustWindowHeight(minheight, maxheight)
     let l = 1
     let n_lines = 0
     let w_width = winwidth(0)
     while l <= line('$')
         " number to float for division
         let l_len = strlen(getline(l)) + 0.0
         let line_width = l_len/w_width
         let n_lines += float2nr(ceil(line_width))
         let l += 1
     endw
     exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
 endfunction
" }}}

" {{{ Undo settings
set undofile                     " Save undo's after file closes
set undolevels=1000              " How many undos
set undoreload=10000             " number of lines to save for undo
set undodir=~/.config/nvim/_undo         " where to save undo histories
set backupdir=~/.config/nvim/_backup/    " where to put backup files.
set directory=~/.config/nvim/_swap/      " where to put swap files.
" }}}

" {{{ Autocommands
if has("autocmd")
  filetype plugin indent on           " allow for individual indentations per file type

  augroup WhiteSpace
    autocmd!

    " before writing a buffer, remove trailing spaces (respecting cursor position) when saving files
    autocmd BufWritePre * kz|:%s/\s\+$//e|'z
  augroup end

  augroup Cursor
    autocmd!

    " After opening, jump to last known cursor position unless it's invalid or in an event handler
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

    " When entering a window, activate cursorline
    autocmd WinEnter * setlocal cursorline

    " When leaving a window, deactivate cursorline
    autocmd WinLeave * setlocal nocursorline
  augroup end

  augroup Golang
    autocmd!

    " Use tabs, and make them 4-spaces long
    autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
    " reformat the file before each save
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
  augroup end

  augroup Markdown
    autocmd!

    " Enable spell checking for markdown files
    autocmd BufRead *.md setlocal spell
    autocmd BufRead *.markdown setlocal spell
  augroup end

  augroup Mkdir
    autocmd!

    " before writing a buffer, if the current directory does not exist, create it
    autocmd BufWritePre *
      \ if !isdirectory(expand("<afile>:p:h")) |
      \   call mkdir(expand("<afile>:p:h"), "p") |
      \ endif
  augroup end

  augroup Neomake
    autocmd!

    autocmd BufWritePost * Neomake
    autocmd BufReadPost  * Neomake

  augroup end

endif
" }}}

" {{{ Deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 400

" Use tab instead of the default deoplete mapping
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" }}}

" {{{ FZF config
set rtp+=/usr/local/opt/fzf

" Show FZF when pressing ctrl-p
noremap <c-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
" }}}

" {{{ Vim-surround-related stuff

nnoremap <leader>' cs"'
nnoremap <leader>" cs'"

" }}}

" Directory tree config
map <Leader>d :NERDTreeToggle<CR>

" Class, Method, Function tags config
nmap <Leader>t :TagbarToggle<CR>

" Type <Space>o to open a new file
nnoremap <Leader>o :CtrlP<CR>
" Type <Space>w to save file
nnoremap <Leader>w :w<CR>

" Fuzzy search config
map <silent> <Leader>p :CtrlP()<CR>
noremap <Leader>b<space> :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

" GitGutter config
let g:gitgutter_sign_column_always = 0

" EditorConfig config
let g:EditorConfig_exclude_patterns = [ 'fugitive://.*', 'scp://.*' ]
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

" tslime config
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Silver Searcher config
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" {{{ bufferline config
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
" }}}

" {{{ File extension mapping
augroup filetypedetect
  au BufRead,BufNewFile *.nse setfiletype lua
  au BufRead,BufNewFile *.plugin set filetype=perl
augroup END
" }}}

" {{{ Dash config
  " Search docsets for something you type
  nnoremap <Leader>k :Dasht<Space>
  nnoremap <Leader><Leader>k :Dasht!<Space>
  " Search docsets for words under cursor
  nnoremap <silent> <Leader>K :call Dasht([expand('<cword>'), expand('<cWORD>')])<Return>
  nnoremap <silent> <Leader><Leader>K :call Dasht([expand('<cword>'), expand('<cWORD>')], '!')<Return>
  " Search docsets for your selected text
  vnoremap <silent> <Leader>K y:<C-U>call Dasht(getreg(0))<Return>
  vnoremap <silent> <Leader><Leader>K y:<C-U>call Dasht(getreg(0), '!')<Return>
" }}}

" {{{ Dash Docsets config
  " let g:dasht_filetype_docsets['elixir'] = ['erlang']
  " let g:dasht_filetype_docsets['cpp'] = ['^c$', 'boost', 'OpenGL']
  " let g:dasht_filetype_docsets['python'] = ['(num|sci)py', 'pandas']
  " let g:dasht_filetype_docsets['html'] = ['css', 'js', 'bootstrap']
" }}}

" {{{ Ruby programming language config
"let g:rspec_command = "Dispatch rspec {spec}"
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
" }}}

" {{{ R programming language config
let vimrplugin_applescript = 0
let vimrplugin_vsplit = 1
" }}}

" {{{ Python programming language config
let g:neomake_python_enabled_makers = ['flake8']
" E501 is line length of 80 characters
let g:pymode_lint_ignore = "E2,E501"
let g:neomake_python_flake8_maker = { 'args': ['--ignore=E501'], }
" }}}
