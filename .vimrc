"============================
"Title: My vim configuration
"Athor: Giorgos Konstantis
"============================

"Section: General 

"Global options
syntax on
set nocompatible
set mouse=a
set nohlsearch
set ruler
set wrapscan
set nu
set splitright splitbelow
set incsearch
set noswapfile nobackup tabstop=4 softtabstop=4 shiftwidth=4 expandtab
"set termguicolors
set ignorecase
set wildmode=longest,list,full
set foldmethod=marker

"Netrw settings
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_altv = 1

"Set up the cursor style in each mode
"let &t_SI.="\e[5 q" "let &t_EI.="\e[2 q"


"Section: Plugins

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'dracula/vim'

call plug#end()


"Section: Keymaps

"Setting leader key
let mapleader = " "
let maplocalleader = " "

"Sensible escape key chord
inoremap jj <ESC>
inoremap ξξ <ESC>

"Autoclosing parenthesis and stuff
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left> 
"
"Saving like a boss
inoremap <silent> <C-s> <ESC>:w<CR> 
inoremap <silent> <C-σ> <ESC>:w<CR> 
nnoremap <silent> <C-s> :w<CR> 
nnoremap <silent> <C-σ> :w<CR> 
nnoremap <silent> <leader>w :w<CR>
 
"Moving around in greek
nnoremap η h
nnoremap ξ j
nnoremap κ k
nnoremap λ l

"Setting a tree toggle
nnoremap <silent> <leader>e :Lex 15<CR>
nnoremap <silent> <leader>ε :Lex 15<CR>

"Switching between buffers
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>

"Moving in greek
nnoremap ο o
nnoremap ι i
nnoremap α a
nnoremap ς w
nnoremap β b
nnoremap Ο O
nnoremap Ι I
nnoremap Α A
nnoremap π p
nnoremap χ x
nnoremap υ y
nnoremap ζ z
nnoremap υυ yy
nnoremap δδ dd
nnoremap ψς cw
nnoremap θ u
nnoremap ω v
nnoremap Ω V
nnoremap ΖΖ ZZ
nnoremap Γ G
nnoremap γγ gg

"Git stuff
nnoremap <silent> <leader>gs :!git status<CR>
nnoremap <silent> <leader>gd :!git diff<CR>

"Moving between buffers
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k

"Rotating buffers
nnoremap <silent> <leader>n :bnext<CR>
nnoremap <silent> <leader>p :bprev<CR>

"Faster search and replace
nnoremap <silent> <leader>s :%s///g<left><left><left>

"Plugged business
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>

"No highlighting
nnoremap <silent> <leader>/ :nohl<CR>

"Bring the vimrc in split for a quick edit
nnoremap <silent> <leader>vc :vsplit ~/.vimrc<CR>

"Open splits vscode style
nnoremap <silent> <C-\> :vsplit<CR>

"Tab stuff
nnoremap <silent> <leader>t :tabnew<CR>
nnoremap <silent> <leader>q :tabclose<CR>
nnoremap <silent> <leader><tab> :tabnext<CR>

"Better Macro call
nnoremap <silent> <S-q> @q

"Make Y have the same behavior as C and D
nnoremap <silent> <S-y> y$

"Add vimscript comments
nnoremap <silent> <leader>c I"<Esc>


"Section: Colorscheme

"let g:gruvbox_invert_selection=0
"colorscheme gruvbox
set background=dark
"hi ModeMsg gui=NONE cterm=NONE term=NONE guibg=NONE guifg=#928374
hi LineNr ctermfg=246
hi MoreMsg cterm=none ctermfg=246
hi ModeMsg cterm=none ctermfg=246


" Section: Functions

function! RunAsy()
	execute '!asy -V %' 
endfunction


" Section: Autocommands


augroup build
	autocmd!
	autocmd Filetype python nnoremap <buffer> <silent> <leader>b :!python %<CR>
	autocmd Filetype c nnoremap <buffer> <silent> <leader>b :!gcc % && ./a.out<CR>
	autocmd Filetype cpp nnoremap <buffer> <silent> <leader>b :!g++ % && ./a.out<CR>
augroup END

augroup sourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

augroup asymptote
	autocmd!
	autocmd BufWritePost *.asy call RunAsy()
augroup END

augroup markdown
    autocmd!
    autocmd BufReadPre *.md set filetype=markdown
augroup END

" Section: Snippets

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"


"Section: Statusline

set statusline+=%#ModeMsg#
set laststatus=2
set statusline+=%#ModeMsg#
set statusline+=%=
set statusline+=%#ModeMsg#
set statusline+=%F
set statusline+=\ %y        
set statusline+=\ %l\:%c
set statusline+=\ %p%%\ 
"Section: Vimtex

let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \ 'hyperref',
      \]


