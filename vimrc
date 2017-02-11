"--------------  Pathogen setup
runtime bundle/vim-pathogen/autoload/pathogen.vim
" Bundle: tpope/vim-pathogen
execute pathogen#infect()

"--------------  Bundles:
"
" Bundle: tpope/vim-sensible
" Bundle: tpope/vim-fugitive
" Bundle: tpope/vim-dispatch
" Bundle: tpope/vim-rails
" Bundle: tpope/vim-bundler
" Bundle: airblade/vim-gitgutter
" Bundle: mattn/emmet-vim
" Bundle: tpope/vim-endwise
" Bundle: vim-syntastic/syntastic
" Bundle: tpope/vim-surround
" Bundle: tpope/vim-commentary
" Bundle: vim-airline/vim-airline
" Bundle: vim-airline/vim-airline-themes
" Bundle: altercation/vim-color-solarized
" Bundle: scrooloose/nerdtree
" Bundle: ctrlpvim/ctrlp.vim
" Bundle: christoomey/vim-tmux-navigator

"-------------- pathogen related setup
syntax on
filetype plugin on
filetype indent on
filetype on

"-------------- misc setup
set t_Co=256
set nocompatible  " set this to turned on vi improved feature
set modelines=0
set encoding=utf-8
set number
set numberwidth=5

set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start

"set undo file
set undofile
set undodir=~/.vim/undo   " where to save undo histories
set undolevels=1000       " how many undo's
set undoreload=10000      " number of lines to save for undo
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

" soft tabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" use one space, not two, after punctuation
set nojoinspaces

" use for search word
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

set wrap
set formatoptions=qrn1
set colorcolumn=85

" improve text display
set textwidth=80
set colorcolumn=+1

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

"-------------- gitgutter setup
set updatetime=250
let g:gitgutter_max_signs = 500

"-------------- syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlags()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

"--------------  vim-airline setup
set laststatus=2
let g:airline_theme='dark'
let g:airline_powerline_fonts=1
set ttimeoutlen=20

if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
let g:airline_symbols.space="\ua0"

" setup look like powerline
let g:airline_section_z=airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

" set airline theme
let g:airline_theme='dark'

"--------------  vim-colors-solarized setup
syntax enable
set background=dark
colorscheme solarized

if has('gui_running')
  set background=light
else
  set background=dark
endif

" for terminal user
let g:solarized_termcolors=256
" optional configuration
let g:solarized_bold=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"

"-------------- Tab completion
" will insert at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

"-------------- NERDTree setup
" open NERDTree automatiocally when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"-------------- CTRLP setup
" when invoked without an explicit starting directory, CTRLP will set its local
" working directory according to this variable:
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_root_markers=['pom.xml', '.p4ignore']

" if the file is already open, open it again in a new pane instead of switching
" to the existing pane
let g:ctrlp_switch_buffer='et'

" exclude files and directories that we don't want in ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip    "MacOSX/Linux
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore={
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" use a custom file listing command
let g:ctrlp_user_command='find %s -type f'

" ignore files in .gitignore
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files -co --exclude-standard']

"-------------- vim-tmux-navigator setup
" quiker window movement. seemlessly navigate between vim/tmux panes
let g:tmux_navigator_no_mappings=1

" this is a hack due to a neovim bug for going left
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" write all buffers before navigating from vim to tmux pane
let g:tmux_navigator_save_on_switch=2

"-------------- Key mapping
" clear hlsearch until next search
nnoremap <F3> :noh<cr>

" toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" NERDTree Navigation -> use the same key mapping in tmux navigation panes
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ctrlp mapping
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

" vim-tmux-navigator mapping
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

"-------------- toggle spell-checking on the local buffer
nnoremap <F4> :setlocal spell! spelllang=en_us<CR>

"-------------- Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

"-------------- autogroup definition to group 'autocmd'
augroup vimrcEx
  autocmd!

  " for all text files set 'textwidth' to 78 characters
  autocmd FileType text setlocal textwidth=78

  " set syntax highlighting for specific filetypes
  autocmd BufRead,BufNewFile Apprailsals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " enable spellchecking for markdown
  autocmd FileType markdown setlocal spell

  " automatically wrap at 80 characters for markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

augroup END

"-------------- ruby specific setup
"let g:syntastic_ruby_checkers=['mri']
"let g:syntastic_enable_highlighting=0

