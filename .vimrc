filetype plugin indent on 

" vim-Plug Plugin List
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 유명한 플러그인들
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'

" 편의
Plug 'milkypostman/vim-togglelist'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf 사용시 꼭 설치하고 ~/.fzf 에 들어가서 ./install --all 하자
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

"syntax enable

" no swp, backup file
set noswapfile
set nobackup

" use backspace key
set bs=indent,eol,start 

" Use mouse in vim
set mouse=a

" Display status bar
set laststatus=2

" ultisnips setting
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetDirectories = ['UltiSnips']

" airline setting
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1

" coc setting form https://johngrib.github.io/
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc default setting
let g:coc_node_path = $HOME . "/.nvm/versions/node/v12.11.1/bin/node"
let g:coc_snippet_next = "<tab>"

" vim-go setting
set updatetime=300

" 저장할 때 자동으로 formatting 및 import from https://johngrib.github.io/
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_addtags_transform = "camelcase"

let g:go_autodetect_gopath = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

" quickfix 이동 및 open/close
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>
nnoremap <LocalLeader>q :call ToggleQuickfixList()<CR>

" 테스트 커버리지 검사 및 색깔 표시 토글
nnoremap <LocalLeader>c :GoCoverageToggle<CR>

" 자주 쓰는 기능들
autocmd FileType go nnoremap <Tab>b :GoBuild<CR>
autocmd FileType go nnoremap <Tab>r :GoRun<CR>
autocmd FileType go nnoremap <Tab><Tab>r :GoRun %<CR>
 
autocmd FileType go nnoremap <Tab>t :GoTest<CR>
autocmd FileType go nnoremap <Tab><Tab>t :GoTestFunc<CR>
autocmd FileType go nnoremap <Tab>c :GoCoverageToggle<CR>

" Md file 시간 업데이트 
function! LastModified()
    if &modified
        let save_cursor = getpos(".")
        let n = min([10, line("$")])
        keepjumps exe '1,' . n . 's#^\(.\{,10}updated\s*: \).*#\1' .
              \ strftime('%Y-%m-%d %H:%M:%S +0900') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun
autocmd BufWritePre *.md call LastModified()

" git commit 메세지 글 자수를 제한하라
autocmd FileType gitcommit setlocal textwidth=50

" fzf from https://johngrib.github.io/
let g:fzf_launcher = "In_a_new_term_function %s"
imap <C-x><C-l> <plug>(fzf-complete-line)

nnoremap <f1>f :Files<CR>
nnoremap <f1>g :GitFiles<CR>
nnoremap <f1> <nop>
nnoremap <f1><f1> :Files<CR>
nnoremap <f1>a :Ag<CR>
nnoremap <f1>l :Lines<CR>
nnoremap <f1>` :Marks<CR>
nnoremap <f1>' :Marks<CR>
" nnoremap <f1>o :Locate getcwd()
nnoremap <f1>h :History<CR>
nnoremap <f1>c :History:<CR>
nnoremap <f1>/ :History/<CR>
nnoremap <f1>t :Tags ^<CR>
nnoremap <f1><f2> :Buffers<CR>
nnoremap <f3> :execute ":Tags " . expand('<cword>')<CR>

" nnoremap <f1>d :call fzf#vim#tags('^', {'options': '--exact --select-1 --exit-0 +i'})<CR>
nnoremap <f1>u call fzf#vim#ag('', {'options': '--select-2'})

" gem install coderay
" let g:fzf_files_options = '--preview "(coderay {} || cat {}) 2> /dev/null | head -' .&lines.'"'
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! FzfOmniFiles()
    let is_git = system('git status')
    if v:shell_error
        :Files
    else
        :GitFiles
    endif
endfunc
