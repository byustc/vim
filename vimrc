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

"插入模式和普通模式下的保存快捷键
inoremap <leader>s <Esc>:w<cr>
noremap <leader>s :w<cr>

"退出插入模式
inoremap jj <ESC>`^


"windows 分屏快捷键
"水平新增窗口
nnoremap sv <C-w>v
"垂直新增窗口
nnoremap sh <C-w>s
"关闭当前窗口
nnoremap sc <C-w>c
"关闭其他
nnoremap so <C-w>o

"<leader> + hjkl  窗口之间跳转
nnoremap <leader>w <C-w>w
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

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

"insert 模式下，跳到行首行尾
inoremap <C-h> <ESC>I
inoremap <C-l> <ESC>A

" 管理 buffer
"关闭当前 buffer
nnoremap <silent> <C-[> :bd<cr>
"跳转到上一个 buffer
nnoremap <silent> <C-h> :bprevious<CR>
"跳转到下一个 buffer
nnoremap <silent> <C-l> :bnext<CR>

"上下滚动浏览
nnoremap <C-j> 4j
nnoremap <C-k> 4k
"ctrl u / ctrl + d  只移动9行，默认移动半屏
nnoremap <C-u> 10k
nnoremap <C-d> 10j

"在visual 模式里粘贴不要复制
vnoremap p "_dP

"退出
nnoremap q :q<CR>
nnoremap qq :q!<CR>

"取消高亮
nnoremap <leader>nh :nohl<CR>


"================vim-plug===================
call plug#begin()
" List your plugins here
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'
Plug 'tpope/vim-commentary'
Plug 'lfv89/vim-interestingwords'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'bling/vim-bufferline'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'sbdchd/neoformat'
Plug 'dense-analysis/ale'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
call plug#end()

"==================gruvbox===============
set t_Co=256
let g:rehash256 = 1
set background=dark
colorscheme gruvbox


"==================nerdtree===============
"快速跳到当前文件在目录位置
nnoremap <leader>v :NERDTreeFind<cr>
" 开侧边栏目录
nnoremap <leader>g :NERDTreeToggle<cr>
" 开书签
nnoremap <leader>b :NERDTreeFromBookmark<cr>
" 不显示隐藏文件
let NERDTreeHidden=0
" 过滤: 所有指定文件和文件夹不显示
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode','\.DS_Store$ ', '__pycache__']


"==================fzf===============
"AG [PATTERN]模糊搜索字符串
"Files [PATH]模糊搜索目录
let g:fzf_preview_window = ['right:hidden', 'ctrl-/']
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'rounded' } }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
"let g:fzf_action = { 'ctrl-c': ['abort', 'cancel'] }
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

"Rg [PATTERN] 使用rg工具在当前项目中模糊搜索字符串
nnoremap <C-f> :RG<cr>
"Buffers 打开缓冲区
nnoremap <C-b> :Buffers<cr>
"Files [PATH]模糊搜索目录
nnoremap <C-p> :Files<cr>
nnoremap <leader>tt :Tags<cr>


"==================far===============
"Far foo bar **/*.py
"Fardo


"==================vim-commentary===============
"gcc     注释当前行（普通模式）或者取消注释当前行
"gc      可视模式下，注释当前选中的部分，或者取消当前选中部分的注释
"gcu     撤销上一次注释的部分，可以是一行也可以是多行
"gcgc    撤销注释当前行和邻近的上下两行
"为python和shell等添加注释
autocmd FileType python,shell,coffee set commentstring=#\ %s
"修改注释风格
autocmd FileType java,php,go,c,cpp set commentstring=//\ %s


"=================vim-interestwords===============
" Highlight with <Leader>k
" Navigate highlighted words with n and N
" Clear every word highlight with <Leader>K throughout the buffer


" =================easymotion===============
nmap ss <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)


"=================vim-surround===============
" ds (delete a surrounding)  ds "
" cs (change a surrounding)  cs " '  cs ( )
" ys (you add a surrounding) ys iw "


"=================auto-pairs===============
"=================rainbowa==============
" rainbow激活
let g:rainbow_active = 1

"=================tagbar==============
" tagbar 关闭打开快捷键
nnore map <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/opt/homebrew/bin/ctags'
let g:tagbar_width = 30
"光标即在tagbar页面内
let g:tagbar_autofocus = 1
"设置标签不排序，默认排序
let g:tagbar_sort = 0
let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
\ }
" autocmd BufReadPost *.go call tagbar#autoopen()

" <CR>: 回车跳到定义位置
" p: 跳到定义位置，但光标仍然在tagbar原位置
" P: 打开一个预览窗口显示标签内容，如果在标签处回车跳到vim编辑页面内定义处，则预览窗口关闭
" o 在折叠与展开间切换，按o键，折叠标签，再按一次o，则展开标签，如此来回切换

" s: 切换排序，一次s，则让标签按字典排序，再一次s，则按照文件内出现顺序排序
" x: 是否展开tagbar标签栏，x展开，再一次x，则缩小标签栏


"=================vim-go==============
"go to defination:GoDef gd/ctrl-]
"go back:GoDefPopctrl-t
"显示jumpstack:GoDefStack
"清理jumpstack:GoDefStackClear
"

"=================deoplete==============

" Use deoplete.
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
let g:deoplete_go_use_gopls = 1


"=================bufferline==============
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'

