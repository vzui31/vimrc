""vim-plug
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Common
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'tpope/vim-unimpaired'
Plug 'mhinz/vim-signify'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-commentary'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Initialize plugin system
call plug#end()

" ===============================
""leader map
let mapleader=","

""scrooloose/nerdtree
nnoremap <silent> <F3> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 "Show hidden files

""flazz/vim-colorschemes
set termguicolors    "vim can support truecolor
set bg=dark
"colorscheme gruvbox
colorscheme molokai

""vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
"let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#tabs_label = ''

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

""powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

""vim-airline/vim-airline-themes'
let g:airline_theme="bubblegum"
"let g:airline_theme="molokai"

""ctags
set tags=./.tags;,.tags

""gtags
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/opt/softwares/global/share/gtags/gtags.conf'
" debug-gtags-self
let g:gutentags_define_advanced_commands = 1
" :GutentagsToggleTrace 命令打开日志
" :messages 命令列出所有消息记录，即可看到 gtags 的错误输出

""ludovicchabant/vim-gutentags
""skywind3000/gutentags_plus
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

""skywind3000/vim-preview
noremap <c-p> :PreviewScroll -1<cr>
noremap <c-n> :PreviewScroll +1<cr>
inoremap <c-p> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <c-n> <c-\><c-o>:PreviewScroll +1<cr>

autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

noremap <F2> :PreviewSignature!<cr>
inoremap <F2> <c-\><c-o>:PreviewSignature!<cr>

""Yggdroot/LeaderF
let g:Lf_ShortcutF = '<c-f>'
let g:Lf_ShortcutB = '<c-b>'
noremap <leader>m :LeaderfMru<cr>
noremap <leader>f :LeaderfFunction!<cr>

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"tpope/vim-unimpaired

"mhinz/vim-signify

"haya14busa/incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR>
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"tpope/vim-commentary
"autocmd FileType apache setlocal commentstring=#\ %s

" ===============================
"
""Exit when only 1 window
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

""map
nnoremap <silent><leader>v :e ~/.vimrc<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>e :tabe<Space>

nnoremap <silent> <F11> :copen<CR>
nnoremap <silent> <F12> :cclose<CR>

""tag switch
nnoremap <C-j> :tn<CR>
nnoremap <C-k> :tp<CR>

""vim switch tab
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>

""grep switch
nnoremap <F9> :cp<CR>
nnoremap <F10> :cn<CR>

"quick grep
map fw :call Search_Word()<CR>:copen<CR>
function Search_Word()
let w = expand("<cword>")
"execute "vimgrep /" . w . "/g *"
execute "vimgrep /" . w . "/g **"
endfunction

""Style
set nocompatible
set number
set autoindent "设置自动缩进：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
set smartindent
set cindent "以C/C++的模式缩进
set showmatch " 显示括号配对，当键入“]”“)”时，高亮度显示匹配的括号／缺省不高亮
set ruler "打开状态栏标尺
set tabstop=4 "设定 tab 为4个空格
set shiftwidth=4 "设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 "使得按退格键时可以一次删掉 4 个空格,不足 4 个时删掉所有剩下的空格）
set nobackup
set clipboard+=unnamed "与windows共享剪切板 set incsearch "输入字符串就显示匹配点
set incsearch "输入字符串就显示匹配点
set hlsearch
set expandtab "设置TAB键为空格
autocmd FileType make set noexpandtab

" ===============================
"
"" 备忘
" <leader>cg - 查看光标下符号的定义
" <leader>cs - 查看光标下符号的引用
" <leader>cc - 查看有哪些函数调用了该函数
" <leader>cf - 查找光标下的文件
" <leader>ci - 查找哪些文件 include 了本文件

