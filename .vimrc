autocmd BufWritePost $MYVIMRC source $MYVIMRC
"Nerdtree自动开启/关闭
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 记住上次打开位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

function! AutoSwapLine(key)
    if col(".") == 1 && a:key == "h"
        execute "normal k$"
    elseif col(".") == (col("$")-1) && a:key == "l"
        execute "normal j0"
    elseif col("$") == 1 && a:key == "l"
        execute "normal j0"
    else
        if a:key == "h"
            execute "normal gotoh"
        else
            execute "normal gotol"
        endif
    endif
endfunction
nnoremap gotoh h
nnoremap gotol l
nnoremap h :call AutoSwapLine("h")<CR>
nnoremap l :call AutoSwapLine("l")<CR>

function! _compile()
    if expand('%:e') == "py"
        execute "w"
        execute "!python %"
    elseif expand('%:e') == "cpp" || expand('%:e') == "cc"
        execute "w"
        execute "!g++ % -o %< && ./%<"
    elseif expand('%:e') == "c"
        execute "w"
        execute "!gcc % -o %< && ./%<"
    elseif expand('%:e') == "cu"
        execute "w"
        execute "!nvcc % -o %< && ./%<"
    endif
endfunction
nnoremap <F9> :call _compile()<CR>

function! _tatt()
    if 1 == 2 || 1 == 1
        echo "Hi"
    endif
endfunction
nnoremap <F8> : call _tatt()<CR>


filetype off
call plug#begin('~/.vim/plugged')
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'myusuf3/numbers.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'yggdroot/indentline'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()
filetype plugin indent on



"backspace可删行
set backspace=indent,eol,start
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" 禁止折行
set nowrap
" 静音
set vb t_vb=
" 竖向分屏
set splitright
" 可用鼠标
set mouse=a  
set mousehide
" lightline可用
set laststatus=2
set background=dark
set nobackup
set noswapfile

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on



let mapleader=" "
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 注释加一空格
let g:NERDSpaceDelims = 1



" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nnoremap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nnoremap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nnoremap <Leader>w :w<CR>
" 不做任何保存，直接退出 vim
nnoremap <Leader>Q :qa!<CR>

map <C-n> :NERDTreeToggle<CR>
" 依次遍历子窗口
nnoremap <Tab> <C-W><C-W>
" 跳转至右方的窗口
nnoremap <S-l> <C-W>l
" 跳转至左方的窗口
nnoremap <S-h> <C-W>h
" 跳转至上方的子窗口
nnoremap <S-k> <C-W>k
" 跳转至下方的子窗口
nnoremap <S-j> <C-W>j

noremap j gj
noremap k gk

" 快速注释
nnoremap <Leader>c <Leader>ci
