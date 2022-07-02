" ===============================基础配置================================
" 显示行号；取消显示可输入 set nonu
set number

" 开启语法高亮
syntax on

" 基于文件类型的插件和缩进
filetype plugin indent on

" 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

" 设置当行之间交错时使用4个空格
set shiftwidth =4

" 设置替换 tab 键 [缩进]
set expandtab

" 设置 tab 键为4个空格.
set tabstop=4
set softtabstop=4

" 字符集
set encoding=utf-8

" 搜索选项.(比如,键入"/bo",光标自动找到第一个"bo"所在的位置.)
set noincsearch

" 设置搜索高亮 ，取消请使用set nohlsearch
set hlsearch

" 自动缩进
set autoindent

" 复制内容到系统粘贴板
set clipboard=unnamed

" 不突出显示列 (speeds up highlighting)
set nocursorcolumn

" 突出显示当前行
set cursorline

"否则无法使用退格键
set backspace=indent,eol,start

" 去掉讨厌的有关 vim 一致性模式,避免以前版本的一些 bug 和局限.
set nocompatible

" 用空格键来开关代码折叠
set foldenable
" 手动折叠代码
" set foldmethod=manual
" 按缩进自动折叠代码
" set foldmethod=indent
" 按语法高亮折叠代码
" set foldmethod=syntax
" 按标记折叠代码
set foldmethod=marker

" molokai  Colorscheme
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" ===============================快捷键配置================================
" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = "\<space>"
" let mapleader=","

"定义 mm返回最新修改的位置
map mm '.zz

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" ===============================插件配置================================
call plug#begin('~/.vim/plugged')
"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/molokai'
Plug 'tpope/vim-fugitive'
call plug#end()


" vim-commentary
" gcc 快速注释/取消注释光标所在行，
" gc 注释/取消选中区域，

" vim-go
let g:go_fmt_command = 'goimports'
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g 函数搜索
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" fzf  < C-n > < C-p > 上下选择
" 快速搜索项目中的文件
map <leader>f :Files<CR>
"  打开buffer列表快速切换文件
map <leader>b :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }
" 用 leader+ag 搜索当前 cursor 下单词 see: https://github.com/junegunn/fzf.vim/issues/50
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" NERDTree set
" 快速跳到当前文件在目录位置
nnoremap <leader>v :NERDTre feFind<cr>
" 打开侧边栏目录
nnoremap <leader>t :NERDTreeToggle<cr>

" tagbar 
" 打开/关闭右侧 tarbar窗口 
nnoremap <leader>g :TagbarToggle<cr>


" easymotion
" 目标单词的2字母,进行查找
nmap ss <Plug>(easymotion-s2)

" coc.nvim Remap keys for gotos < C-n > < C-p > 上下选
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-z> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gm <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

