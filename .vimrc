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

call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jiangmiao/auto-pairs'
call plug#end()

" Map <leader> from \ to ,
let mapleader=','
set encoding=utf-8
set wrap
set number
syntax on
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
set nowritebackup
set colorcolumn=80
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

" -------CoC configuration------- 

" Remap keys for gotos
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Highlight changes for the floating message boxes
highlight CocFloating ctermbg=darkgrey
highlight CocErrorSign ctermfg=white

" Show documentation of the item under cursor
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
