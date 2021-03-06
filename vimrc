call plug#begin()
  Plug 'airblade/vim-gitgutter'
  Plug 'kien/ctrlp.vim'
  Plug 'kshenoy/vim-signature'
  Plug 'rking/ag.vim'
  Plug 'rafaqz/ranger.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tomasiser/vim-code-dark'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'xolox/vim-session'
  Plug 'xolox/vim-misc'
call plug#end()

colorscheme codedark

" code folding
set foldmethod=manual

syntax on
filetype plugin indent on

" toggle relative number
set number
function! NumberToggle()
  if(&rnu == 1)
    set nornu
  else
    set rnu
  endif
endfunc

nnoremap <silent> <C-l> :call NumberToggle()<cr>

set backspace=2                   " make backspace work like most other apps
set backspace=indent,eol,start
set list listchars=tab:>-,trail:.,precedes:<,extends:>
set expandtab
set sw=2
set ts=2
set softtabstop=2
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1

" vim sessions
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:ag_working_path_mode="r"
let g:showmarks_enable=0

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=100
  highlight ColorColumn ctermbg=235 guibg=lightgrey
endif

" Leader
" set leader key to comma
let mapleader = ","

" custom keys
nnoremap <leader>f :Ag!<space>
nnoremap <leader>q <Esc>:q<CR>
nnoremap <silent> <C-m> :res<CR>:vertical res<CR>
nnoremap <silent> <C-n> <C-w>=
map <leader>r :,$s/

" disables
nnoremap <c-z> <nop>
map <S-k> <Nop>
map Q <Nop>

" copy to clipboard
map <S-Y> "+yy

" ranger
:command Tex RangerTab
:command Ex RangerEdit

" Airline configuration
let g:airline_theme='term'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

set nofixendofline

