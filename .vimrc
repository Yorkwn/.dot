"============================
"Title: My vim configuration
"Athor: Giorgos Konstantis
"============================

"Section:------------------General------------------

"Global options syntax enable set nocompatible
set nocompatible

"Fix <Esc> key latency, it really does wonders, wow
set ttimeoutlen=50

set mouse=a
set nohlsearch
set ruler
"set tgc
set nowrap
set wrapscan
set nu
set relativenumber
set splitright splitbelow
set incsearch
set noswapfile nobackup tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set ignorecase
set wildmode=longest,list,full
set foldmethod=marker
set history=1000
set textwidth=79
set linebreak

set listchars=trail:*
set list

"Netrw settings
"let g:netrw_liststyle = 3
"let g:netrw_banner = 0
"let g:netrw_altv = 1

"Set up the cursor style in each mode
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[2 q"


"Section:------------------Plugins------------------

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'lervag/vimtex'
Plug 'overcache/NeoSolarized'

call plug#end()

"Section:------------------Keymaps------------------

"Setting leader key
let mapleader = " "
let maplocalleader = " "

"Sensible escape key
inoremap <C-c> <Esc>

"Toggle light theme for gruvbox
nnoremap <leader>ls <cmd> call LightSwitch()<CR>

"Autoclosing parenthesis and stuff
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap { {}<left>

"Saving like a boss
nnoremap <silent> <C-s> :w<CR>
nnoremap <silent> <C-σ> :w<CR>
 
"Setting a tree toggle
nnoremap <silent> <leader>e :Lex<CR>
nnoremap <silent> <leader>ε :Lex<CR>

"Switching between buffers
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>

"vim greek
nnoremap η h
nnoremap ξ j
nnoremap κ k
nnoremap λ l
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

vnoremap η h
vnoremap ξ j
vnoremap κ k
vnoremap λ l
vnoremap Ω V
vnoremap χ x
vnoremap υ y
vnoremap δ d

cnoremap ς w

"Git stuff
nnoremap <silent> <leader>gs :!clear && git status<CR>
nnoremap <silent> <leader>gd :!clear && git diff<CR>
nnoremap <silent> <leader>gi :call GitIt()<CR>

"Moving between buffers
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k

"Rotating buffers
nnoremap <silent> <leader>1 <cmd>b1<CR>
nnoremap <silent> <leader>2 <cmd>b2<CR>
nnoremap <silent> <leader>3 <cmd>b3<CR>
nnoremap <silent> <leader>4 <cmd>b4<CR>
nnoremap <silent> <leader>5 <cmd>b5<CR>
nnoremap <silent> <leader>6 <cmd>b6<CR>
nnoremap <silent> <leader>7 <cmd>b7<CR>
nnoremap <silent> <leader>8 <cmd>b8<CR>
nnoremap <silent> <leader>9 <cmd>b9<CR>
nnoremap <silent> <leader>10 <cmd>b10<CR>

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
nnoremap <silent> <tab> :tabnext<CR>

"Make Y have the same behavior as C and D
nnoremap <silent> <S-y> y$

"Add vimscript comments
nnoremap <silent> <leader>c I"<Esc>


"Section:------------------Colors------------------

"let g:gruvbox_invert_selection=0
"let g:gruvbox_bold=0
"let g:gruvbox_italic=0

"colorscheme NeoSolarized
set background=dark

hi StatusLine gui=none guifg=#073642 guibg=#657b83
hi SpecialKey cterm=none ctermbg=darkgray ctermfg=darkgray
"hi LineNr ctermfg=gray
"hi texOnlyMath gui=none guifg=#fe8019 guibg=#282828
"hi MoreMsg cterm=none ctermfg=gray gui=none guifg=#928374
"hi ModeMsg cterm=none ctermfg=gray gui=none guifg=#928374
"hi Normal term=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE


"Section:------------------Functions------------------

function! RunAsy()
    execute '!asy -V %'
endfunction

" function! StatuslineGitBranch()
"     if exists("g:git_branch")
"         return g:git_branch
"     else
"         return ''
"     endif
" endfunction

" function! GetGitBranch()
"     let l:is_git_dir = system('echo -n $(git rev-parse --is-inside-work-tree)')
"     let g:git_branch = l:is_git_dir == 'true' ?
"         \ system('bash -c "echo -n $(git rev-parse --abbrev-ref HEAD 2>/dev/null)"') : ''
" endfunction

function! GitIt()
    execute "!git add . && git commit"
endfunction

function! LightSwitch()
    if &background=='dark'
        set background=light
    elseif &background=='light'
        set background=dark
    endif
endfunction


" Section:------------------Autocmds------------------

augroup asymptote
    autocmd!
    autocmd BufWritePost *.asy call RunAsy()
augroup END
augroup markdown
    autocmd!
    autocmd BufReadPre *.md set filetype=markdown
augroup END


"Section:------------------Statusline------------------

set laststatus=2
set statusline=\ %=\ %F\ %y\ %l:%c\ %p%%
hi StatusLine cterm=none ctermbg=black ctermfg=gray
