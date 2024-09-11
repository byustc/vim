"===============================基础配置================================
" 显示行号；取消显示可输入 set nonu
set relativenumber number

"设置在光标距离窗口顶部或底部一定行数时，开始滚动屏幕内容的行为
set scrolloff=10

" 开启语法高亮
syntax enable

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

" 递增搜索功能：在执行搜索（使用 / 或 ? 命令）时，
"Vim 会在您输入搜索模式的过程中逐步匹配并高亮显示匹配的文本。
set incsearch

" 在搜索时忽略大小写
set ignorecase

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


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300


"==================set key===============
"设置用户快捷键的前置输入为 ,
let mapleader = " "

"定义 mm返回最新修改的位置
map mm '.zz

"退出插入模式
inoremap jj <ESC>`^

"windows 分屏快捷键
"水平新增窗口
nnoremap sv <C-w>v
"垂直新增窗口
nnoremap sh <C-w>s
"关闭当前laga
nnoremap sc <C-w>c
"关闭其他
nnoremap so <C-w>o

"<Ctrl> + hjkl  窗口之间跳转
nnoremap <C-w> <C-w>w
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"左右比例控制
nnoremap <C-Left> :vertical resize -6<CR>
nnoremap <C-Right> :vertical resize +6<CR>
nnoremap <C-Down> :resize +6<CR>
nnoremap <C-Up> :resize -6<CR>
"等比例
nnoremap <C-=> <C-w>=

"visual模式下缩进代码
vnoremap < <gv
vnoremap > >gv
"上下移动选中文本
vnoremap J :move '>+1<CR>gv-gv
vnoremap K :move '<-2<CR>gv-gv


" 管理 buffer
"关闭当前 buffer
nnoremap <silent> <S-[> :bd<cr>
"跳转到上一个 buffer
nnoremap <silent> <S-h> :bprevious<CR>
"跳转到下一个 buffer
nnoremap <silent> <S-l> :bnext<CR>

"================vim-plug===================
call plug#begin()
" List your plugins here
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'bling/vim-bufferline'

call plug#end()


"==================gruvbox===============
set t_Co=256
let g:rehash256 = 1
set background=dark
colorscheme gruvbox


"==================vim-commentary===============
"gcc     注释当前行（普通模式）或者取消注释当前行
"gc      可视模式下，注释当前选中的部分，或者取消当前选中部分的注释
"gcu     撤销上一次注释的部分，可以是一行也可以是多行
"gcgc    撤销注释当前行和邻近的上下两行
"为python和shell等添加注释
autocmd FileType python,shell,coffee set commentstring=#\ %s
"修改注释风格
autocmd FileType java,php,go,c,cpp set commentstring=//\ %s

" =================easymotion===============
let g:EasyMotion_smartcase = 1

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"=================vim-surround===============
" ds (delete a surrounding)  ds "
" cs (change a surrounding)  cs " '  cs ( )
" ys (you add a surrounding) ys iw "


"=================auto-pairs===============
"=================rainbowa==============
" rainbow激活
let g:rainbow_active = 1


"=================bufferline==============
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'

