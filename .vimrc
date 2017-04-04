" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hlsearch		" Highlight search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Set color theme
colorscheme pablo
"colorscheme industry

" Remap Leader key to <space>
let mapleader = "\<Space>"

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable Pathogen plugin manager
execute pathogen#infect()

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

" Syntax check config
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Auto complete config
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabMappingTabLiteral = '<Tab>'
