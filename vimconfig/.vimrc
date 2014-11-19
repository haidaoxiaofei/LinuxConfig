filetype plugin on
filetype on

set scrolloff=3
set smartindent
" F5编译和运行C程序，F6编译和运行C++程序
" 请注意，下述代码在windows下使用会报错
" 需要去掉./这两个字符
" C的编译和运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	exec "!gcc % -o %<"
	exec "! ./%<"
endfunc
" C++的编译和运行
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
	exec "w"
	exec "!g++ % -o %<.exe"
	exec "! ./%<.exe"
endfunc
"添加调试快捷键
map <C-F5> :call Debug()<CR>
func! Debug()
    exec "w"
"C程序
if &filetype == 'c'
    exec "!gcc % -g -o %<.exe"
    exec "!gdb %<.exe"
    elseif &filetype == 'cpp'
    exec "!g++ % -g -o %<.exe"
    exec "!gdb %<.exe"
endif
endfunc
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示
if has("autocmd")
autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby set number
autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o/*<ESC>'>o*/
autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100
"autocmd Filetype html,xml,xsl source $VIMRUNTIME/plugin/closetag.vim
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
endif " has("autocmd")
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI
"将tab键设为4个空格
set softtabstop=4
set tabstop=4
set shiftwidth=4
"自动缩进设置
set cindent
set smartindent
set incsearch
set autoindent
"设置搜索结果高亮
set matchtime=5
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
"remove blanks at end of each line
map <F2> :%s/\s*$//g<cr>
"close vi compatible
set nocompatible
"开启类成员列表
map <F4> :TlistToggle<cr>
"添加tags
map <C-F12> :!ctags -R -I --languages=c++ --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
let OmniCpp_DefaultNamespaces = ["std"]
let OmniCpp_MayCompleteScope = 1
let OmniCpp_SelectFirstItem = 2
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and inclu    ded files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. p    arameters) in popup window 
"--ctags setting--
set tags+=/usr/include/tags "add library tags

:imap jj <Esc>
