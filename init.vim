call plug#begin('~/.local/share/nvim/plugged')

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :FZF<CR>

" NERDTree

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
:command NT NERDTreeToggle
:command NTF NERDTreeFind
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '\.__pycache__$']
let NERDTreeShowHidden=1
let loaded_netrw=0  " Turn off netrw

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if (argc() == 0 || argv()[0] == '.') && !exists("s:std_in") | NERDTree | endif  " Open on folder by default


" Ag

Plug 'rking/ag.vim'

" Color scheme
Plug 'joshdick/onedark.vim'
let g:onedark_termcolors=16


" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
let g:deoplete#enable_at_startup = 1

" Figure out the system Python for Neovim.
let g:python_host_prog = '/usr/local/bin/python'
let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog=substitute(system("/usr/bin/env which python3"), "\n", '', 'g')
" Use shift to cycle through completions.
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
let g:deoplete#sources#jedi#show_docstring = 1
" New line when the typed word matches the suggestion exactly and I hit enter.
inoremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup()."\<CR>" : "\<CR>"
" Close preview window upon completion.
autocmd CompleteDone * pclose!


" Python

Plug 'klen/python-mode'
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_motion = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_rope = 0
let g:pymode_rope_completion = 0

Plug 'fisadev/vim-isort'


" Gutentags
Plug 'ludovicchabant/vim-gutentags'
noremap <Leader>c :GutentagsUpdate!<CR>
let g:gutentags_generate_on_empty_buffer = 1


" Git gutter
Plug 'airblade/vim-gitgutter'
highlight clear SignColumn


" Lint
Plug 'neomake/neomake'
autocmd BufWritePost,BufEnter * Neomake

let g:neomake_python_enabled_makers = ['flake8', 'mypy']
let g:neomake_highlight_columns = 0


" Format

Plug 'Chiel92/vim-autoformat'
autocmd BufWrite * Autoformat


" Other languages
Plug 'pangloss/vim-javascript'
Plug 'saltstack/salt-vim'

call plug#end()


set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

colorscheme onedark


" Indentation.
filetype plugin indent on
autocmd Filetype bash setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype sh   setlocal ts=2 sts=2 sw=2
autocmd Filetype vim  setlocal ts=2 sts=2 sw=2
autocmd Filetype xml  setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype zsh  setlocal ts=2 sts=2 sw=2

" Python 79 lines.
" autocmd Filetype python setlocal textwidth=79

" Python 3
set encoding=utf-8


" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Show bad whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

