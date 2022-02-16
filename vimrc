set nocompatible

filetype on	        "开启文件类型侦测
filetype indent on	"适应不同语言的缩进
syntax enable	    "开启语法高亮功能
syntax on 	        "允许使用用户配色

set laststatus=2        	"总是显示状态栏
set ruler               	"显示光标位置
set number              	"显示行号

set cursorline          	"高亮显示当前行
hi cursorline guibg=#00ff00
hi CursorColumn guibg=#00ff00

"set cursorcolumn            "高亮显示当前列
set hlsearch                "高亮搜索结果
exec "nohlsearch"
set incsearch               "边输边高亮
set ignorecase              "搜索时忽略大小写
set smartcase

set relativenumber          "其他行显示相对行号
"set scrolloff=5            "垂直滚动时光标距底部位置

set fileencodings=utf-8,gb2312,gbk,gb18030,cp936    " 检测文件编码,将fileencoding设置为最终编码
set fileencoding=utf-8                              " 保存时的文件编码
set termencoding=utf-8                              " 终端的输出字符编码
set encoding=utf-8                                  " VIM打开文件使用的内部编码


set softtabstop=4	"将连续数量的空格视为一个制表符
set shiftwidth=4	"自动缩进所使用的空格数
"set textwidth=79	"编辑器每行字符数
set wrap            "设置自动折行
set linebreak       "防止单词内部折行
set wrapmargin=5      "指定折行处与右边缘空格数
set autoindent  	"打开自动缩进
set wildmenu    	"vim命令自动补全

"当文件在外部被修改时，自动更新该文件"
set autoread

"激活鼠标的使用"
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"带有如下符号的单词不要被换行分割"
set iskeyword+=_,$,@,%,#,-

"被分割的窗口间显示空白，便于阅读"
set fillchars=vert:\ ,stl:\ ,stlnc:\


"设置颜色"
set background=dark
colorscheme hybrid

"显示标尺"
set ruler

"高亮显示匹配的括号([{和}])"
set showmatch

"用浅色高亮显示当前行"
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

"输入的命令显示出来，看的清楚"
set showcmd

"开启新行时使智能自动缩进"
set smartindent
set cin
set showmatch

"共享剪切板"
set clipboard+=unnamed

"从不备份"
set nobackup
set noswapfile

"自动保存"
set autowrite


" vim tab，使用 ;1 ;2跳tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

let mapleader=','
let g:mapleader=','


" 使用jj进入normal模式
inoremap jj <ESC>`^
"leader + w 直接保存
inoremap <leader>w <ESC>:w<cr>
noremap <leader>w :w<cr>

"leader + q 直接退出
inoremap <leader>q <ESC>:wq<cr>
noremap <leader>q :wq<cr>



call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
Plug 'w0ng/vim-hybrid'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" ug 'valloric/youcompleteme'
Plug 'majutsushi/tagbar'
Plug 'vasconcelloslf/vim-interestingwords'
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

" 文件树设置 {{{
" 关闭NERDTree快捷键
nnoremap <leader>v :NERDTreeFind<CR>
nnoremap <leader>g :NERDTreeToggle<CR>
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
"let NERDTreeWinPos="right"
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1

let NERDTreeAutoCenter=1
" 显示行号
let NERDTreeShowLineNumbers=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=25
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let g:NERDTreeGitStatusIndicatorMapCustom={
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" }}}

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"easymotion
nmap ss <Plug>(easymotion-s2)


"vim-surround

"fzf
command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --column --numbers --noheading --color --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


"tagbar
nnoremap <leader>t :TagbarToggle<CR>


