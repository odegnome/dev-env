let g:gitparsedbranchname = ' '
function! GitBranch()
    let l:string = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    let g:gitparsedbranchname = strlen(l:string) > 0?'['.l:string.']':''
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

augroup UPDATE_GITBRANCH
    " clear old commands
    autocmd!
    " Update git branch
    autocmd BufWritePre * :call GitBranch()
    autocmd BufReadPost * :call GitBranch()
    autocmd BufEnter * :call GitBranch()
augroup END

set wrap
set number
syntax on
colorscheme desert
set tabstop=4 shiftwidth=4
set autoindent
set expandtab
set softtabstop=4
set nocompatible
set smartindent
filetype on
filetype plugin on
filetype indent on
set hlsearch
set nobackup
set colorcolumn=72
set laststatus=2
"set statusline=%<%f\ %h%m%r%=%-10.(%l,%c%V%)\ %P
" Start a new status line
set statusline=
" Add Git branch
set statusline+=%{g:gitparsedbranchname}
" Add file location
set statusline+=%#LineNr#\ %f
" Add filetype, line number and column number
" m is modified flag, r is readonly flag
set statusline+=%=%m%r\ %y\ %-10.(%l,%c%V%)\ %P
