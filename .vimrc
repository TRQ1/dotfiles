filetype plugin indent on 
set paste

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
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

syntax enable

" no swp, backup file
set noswapfile
set nobackup

" use backspace key
" set bs=indent,eol,start 

" Use mouse in vim
set mouse=a

" Display status bar
set laststatus=2

" ultisnips 설정
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
 let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories = ['UltiSnips']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" vim-go setting
set updatetime=300

" 저장할 때 자동으로 formatting 및 import
"let g:go_fmt_command = "goimports"
"let g:go_list_type = "quickfix"
"let g:go_addtags_transform = "camelcase"
"
"let g:go_autodetect_gopath = 1
"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_generate_tags = 1
"let g:go_highlight_operators = 1
"let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1

" quickfix 이동 및 open/close
"nnoremap <C-n> :cnext<CR>
"nnoremap <C-p> :cprevious<CR>
"nnoremap <LocalLeader>q :call ToggleQuickfixList()<CR>

" 테스트 커버리지 검사 및 색깔 표시 토글
"nnoremap <LocalLeader>c :GoCoverageToggle<CR>

" 자주 쓰는 기능들
"autocmd FileType go nnoremap <Tab>b :GoBuild<CR>
"autocmd FileType go nnoremap <Tab>r :GoRun<CR>
"autocmd FileType go nnoremap <Tab><Tab>r :GoRun %<CR>
" 
"autocmd FileType go nnoremap <Tab>t :GoTest<CR>
"autocmd FileType go nnoremap <Tab><Tab>t :GoTestFunc<CR>
"autocmd FileType go nnoremap <Tab>c :GoCoverageToggle<CR>

" Md file 시간 업데이트 
"function! LastModified()
"    if &modified
"        let save_cursor = getpos(".")
"        let n = min([10, line("$")])
"        keepjumps exe '1,' . n . 's#^\(.\{,10}updated\s*: \).*#\1' .
"              \ strftime('%Y-%m-%d %H:%M:%S +0900') . '#e'
"        call histdel('search', -1)
"        call setpos('.', save_cursor)
"    endif
"endfun
"autocmd BufWritePre *.md call LastModified()
