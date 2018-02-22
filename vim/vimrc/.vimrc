"vimrc
"Author: Chao Hong <teddy.hongchao@gmail.com>

"--------------------------------------------------------------------
" Vundle and Plug-in
"--------------------------------------------------------------------
if filereadable(expand("~/.vim/.vimrc.bundles"))
    source ~/.vim/.vimrc.bundles
endif

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just:PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"--------------------------------------------------------------------
" Base settings
"--------------------------------------------------------------------

" 备份文件存放目录
" exec 'set backupdir='.fnameescape(g:$HOME'/.vim/.vim_backup/')
" swap文件存放目录
" exec 'set directory='.fnameescape(g:vimrc_home.'/.vim_swap/')
" 持久撤销文件存放目录
" exec 'set undodir='.fnameescape(g:vimrc_home.'/.vim_undo/')

"字体
if (has("gui_running"))
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 14
endif

if has('gui_running') && $LANG !~ '\.'
    set encoding=utf-8
endif

" 设置状态行，使其能额外显示文件的编码信息
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

" 启动的时候不显示那个援助乌干达儿童
set shortmess=at

"style
colorscheme molokai

" 用jj代替ESC
inoremap jj <ESC>

"把所有的数字都当成十进制，防止八进制和16进制干扰
set nrformats=

"自动缩进
set ai

" 如果该 Vim 支持鼠标，则启用鼠标支持
" if has('mouse')
"     set mouse=a
" endif

" 判断 Vim 是否包含多字节语言支持
if has('multi_byte') && v:version > 601
    " 如果 Vim 的语言是中文、日文或韩文的话，将模糊宽度的 Unicode 字符的宽, 设为双宽度
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
endif

"自定义补全行为
"bash shell习惯
set wildmode=longest,list
"zsh习惯
"set wildmenu
"set wildmode=full

"让回溯命令历史时的快捷键拥有up和down一样对历史命令进行过滤的优点
" cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

set nomore

"不要图形按钮
set go=

" 用Tab跳转到匹配的括号
map <tab> %

" 自动换行时可在行中移动
nnoremap j gj
nnoremap k gk


"--------------------------------------------------------------------
"  edit model move cursor
"--------------------------------------------------------------------

imap <C-e> <END>
imap <C-a> <HOME>
imap <C-f> <Right>
imap <C-b> <Left>
imap <M-f> <S-Right>
imap <M-b> <S-Left>
imap <M-n> <Down>
imap <M-p> <Up>

"自动补全
imap ( ()<ESC>i
imap ) <c-r>=ClosePair(')')<CR>
imap { {<CR>}<ESC>O
imap } <c-r>=ClosePair('}')<CR>
imap [ []<ESC>i
imap ] <c-r>=ClosePair(']')<CR>
imap " ""<ESC>i
imap ' ''<ESC>i

"--------------------------------------------------------------------
" Leader and LocalLeader
"--------------------------------------------------------------------

"设置leader热键
let mapleader=" "

"<leader>w保存文件
nmap <leader>w :w!<CR>
nmap <leader>q :qa<CR>
nmap <leader>t :!php %<CR>
nmap <leader>f :find<cr>
nmap <leader>= gg=G''<cr>

" 删除所有的行尾的空格
nnoremap <leader>W :%s/\s\+$//<cr>:let @/='’<cr>

" 在buffer间移动
nnoremap <leader>g :bp<cr>
nnoremap <leader>h :bn<cr>

nnoremap <leader>u :call pdv#DocumentWithSnip()<CR>
"php debug
map <leader>e yawoerror_log(print_r(<esc>pa, true), 3, "/tmp/log_".__FUNCTION__.".log");<esc>==:w<esc>
map <leader>v yawovar_dump(<esc>pa);<esc>==:w<CR>
map <leader>r yaworeturn <esc>pa;<esc>==:w<CR>

" php-cs-fixer
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>f :call PhpCsFixerFixFile()<CR>

nnoremap <Leader>n :cn<cr>
nnoremap <Leader>p :cp<cr>

"set font
set guifont=Courier_New:h10:cANSI

"用浅色高亮当前行,离开时消失
autocmd InsertEnter * se cul
autocmd InsertLeave * se nocul

"输入的命令完整的显示出来，看的清楚些
set showcmd

"光标不要闪烁(不管用?)
set novisualbell

"启动显示状态行1,总是显示状态行2
set laststatus=1

"project 插件相关配置
"隐藏目录树
map <c-p> <C-W>l<C-W>\|

"Code coloumn length Prompt
"set colorcolumn=81
set cc=80
"code length prompt colors
highlight CursorLine cterm=NONE ctermbg=blue ctermfg=white

"有6种方式来折叠代码:
"1. manual //手工定义折叠
"2. indent //用缩进表示折叠
"3. expr　 //用表达式来定义折叠
"4. syntax //用语法高亮来定义折叠
"5. diff //对没有更改的文本进行折叠
"6. marker //用标志折叠

"Allow the folding
set foldenable
set foldmethod=indent

set background=dark "背景使用黑色

" 编码
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" 可自动识别的文件类型为带 BOM 字符的 Unicode 文件、UTF-8 编码的文件和 GBK 编码的文件
set fileencodings=ucs-bom,utf-8,cp936,gbk
set fileencoding=utf-8

"窗口分割时,进行切换的按键热键需要连接两次,非常麻烦,现在重映射为<c-k>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Key mappings to ease browsing long lines
noremap  <C-J>       gj
noremap  <C-K>       gk
noremap  <Down>      gj
noremap  <Up>        gk
" inoremap <Down> <C-O>gj
" inoremap <Up>   <C-O>gk

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=php<CR>
nnoremap <leader>2 :set filetype=css<CR>
nnoremap <leader>3 :set filetype=javascript<CR>
nnoremap <leader>4 :set filetype=xhtml<CR>


"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.c,*.cpp,*.sh,*.php exec ":call SetDiffTitle()"

"定义函数SetTitle，自动插入文件头
function! SetDiffTitle()
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "\###############################################################")
        call append(line(".")+1, "\# FileName: ".expand("%"))
        call append(line(".")+2, "\# Author: Chao Hong <teddy.hongchao@gmail.com>")
        call append(line(".")+3, "\# Program: ")
        call append(line(".")+4, "\# History:".strftime("%c"))
        call append(line(".")+5,"\###############################################################")
        call append(line(".")+6,"")
    endif

    if &filetype == 'php'
        call setline(1, "<?php")
        call append(line("."), "\/**********************************************************")
        call append(line(".")+1, "\* File Name: ".expand("%"))
        call append(line(".")+2, "\* Author: Chao Hong <teddy.hongchao@gmail.com>")
        call append(line(".")+3, "\* Program: ")
        call append(line(".")+4, "\* History: ".strftime("%c"))
        call append(line(".")+5, "\**********************************************************/")
        call append(line(".")+6, "")
    endif

    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif

    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif

    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G

endfunction


"映射全选+复制 ctrl+a
"map <C-A> ggVGY
"map! <C-A> <Esc>ggVGY
"map <F12> gg=G

"选中状态下 Ctrl+c 复制
vmap <C-c> "+y

"为方便复制，用<F4>开启/关闭行号显示:
nnoremap <F4> :set nonumber!<CR>:set foldcolumn=0<CR>

"比较文件
nnoremap <C-F2> :vert diffsplit

"新建标签
map <M-F2> :tabnew<CR>

"列出当前目录文件
map <F3> :tabnew .<CR>

"打开树状文件目录
map <C-F3> \be

" F5按文件类型编译运行
map <F5> :call CompileRun()<CR>

map <F6> :nohl<CR>

nmap <F7> :TagbarToggle<CR>

func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'php'
        exec "php %<"
        exec "! ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java%<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc

" Recognize standard C++ headers
au BufEnter /usr/include/c++/*    setf cpp
au BufEnter /usr/include/g++-3/*  setf cpp

" c,c++的调试
map <F8> :call Rungdb()<CR>

func! Rungdb()
    exec "w"
    exec "!g++%-g-o%<"
    exec "!gdb./%<"
endfunc

"设置自动载入,自动保存(文件在Vim之外修改过，自动重新读入)
set autoread
set autowrite

"quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

"代码补全
set completeopt=preview,longest,menu

"共享剪贴板
set clipboard+=unnamed

"粘贴时保持格式
set paste

"make 运行
:set makeprg=g++\ -Wall\ \ %

"打开状态栏标尺(主要是光标行列信息)
set ruler

"正则
set magic

"突出显示当前行
set cursorline

"隐藏工具栏
set guioptions-=T

"隐藏菜单栏
"set guioptions-=m

"设置在状态行显示
set foldcolumn=0
set foldlevel=1


"语法高亮 Mac语法syntax on，Linux语法set syntax ＝ on
syntax on

"去掉输入错误的提示声音
set noeb

"在处理未保存或只读文件的时候，弹出确认
set confirm

"为程序提供自动缩进
set autoindent
set smartindent
set cindent

"Tab键的宽度，统一缩进为4，用空格代替制表符
set tabstop=4

set shiftwidth=4 softtabstop=4 expandtab
"set noexpandtab

"在行和段开始处使用制表符
set smarttab

"显示行号
set number

"历史记录数
set history=200

"不备份文件
set nobackup
set nowb
"禁止生成临时文件
set noswapfile

"搜索忽略大小写,有大写字母时敏感
set ignorecase
set smartcase

"搜索逐字符高亮
set hlsearch
set incsearch

"行内替换
set gdefault

"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

"我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [%Y]\ [POS=%l,%v][%p%%]}

"命令行（在状态行下）的高度，默认为1，可以设成2
set cmdheight=1

"保存全局变量
set viminfo+=!

"带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

"字符间插入的像素行数目
set linespace=0

"增强模式中的命令行自动完成操作
set wildmenu

"使回格键（backspace）正常处理indent, eol, start等
set backspace=2

"允许backspace和光标键跨越行边界(不建议使用)
"set whichwrap+=<,>,h,l

"可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key

"通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

"在被分割的窗口间显示空白，便于阅读
"set fillchars=vert:\ ,stl:\ ,stlnc:\

"高亮显示匹配的括号
set showmatch

" 正确地处理中文字符的折行和拼接
set formatoptions+=mM

"匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1

"光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=15

"高亮显示普通txt文件（需要txt.vim脚本）
"au BufRead,BufNewFile *  setfiletype txt

"--------------------------------------------------------------------
" Function F1~F11
"--------------------------------------------------------------------

"去空行
nnoremap <F2> :NERDTreeToggle<CR>

function! RemoveEndSpaces()
    let auto_striptrail = exists('g:auto_striptrail') ? g:auto_striptrail : "php,c,sh,cpp,js,css,html,yml,ini,html.twig"
    if empty(matchstr(auto_striptrail, &ft))
        return
    endif
    let l:winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(l:winview)
endfunction

autocmd BufWritePre,FileAppendPre,FileWritePre,FilterWritePre * :call RemoveEndSpaces()


function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

"---------------------------------------------------------------------
" CTags Settings
"---------------------------------------------------------------------

"按照名称排序
let Tlist_Sort_Type = "name"

"在右侧显示窗口
let Tlist_Use_Right_Window = 1

"压缩方式
let Tlist_Compart_Format = 1

"如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_Exist_OnlyWindow = 1

"不要关闭其他文件的tags
let Tlist_File_Fold_Auto_Close = 0

"不要显示折叠树
let Tlist_Enable_Fold_Column = 0

autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags

autocmd FileType php set tags+=/home/teddy/git/oms/project/tagSrc
autocmd FileType php set tags+=/home/teddy/git/oms/project/tagVendor

"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File=1

"设置tags
set tags=tags
set autochdir

" set tags+=/home/teddy/git/oms/project/tags

"---------------------------------------------------------------------
" Taglist Settings
"---------------------------------------------------------------------

"默认打开Taglist
let Tlist_Auto_Open=1

"Tag list (ctags)
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File=1

"设置taglist宽度
let Tlist_WinWidth=30

"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1

"在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 1

"minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


"---------------------------------------------------------------------
" YouCompleteMe Settings
"---------------------------------------------------------------------

" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags，这个没有也没关系，只要.ycm_extra_conf.py文件中指定了正确的标准库路径
set tags+=/data/misc/software/misc./vim/stdcpp.tags

let g:ycm_server_python_interpreter='/usr/local/bin/python3'
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第2个键入字符开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<M-;>'
" 设置转到定义处的快捷键为ALT + G，这个功能非常赞
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>


"---------------------------------------------------------------------
" php-cs-fixer
"---------------------------------------------------------------------

" If php-cs-fixer is in $PATH, you don't need to define line below
" define the path to the php-cs-fixer.phar
let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer"
let g:php_cs_fixer_level = "symfony"              " which level ?
let g:php_cs_fixer_config = "default"             " configuration
"let g:php_cs_fixer_config_file = '.php_cs'       " configuration file
let g:php_cs_fixer_php_path = "php"               " Path to PHP
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.

"---------------------------------------------------------------------
" nerdcommenter
"---------------------------------------------------------------------

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_php = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"---------------------------------------------------------------------
" PDV
"---------------------------------------------------------------------

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-o> :call pdv#DocumentWithSnip()<CR>

"---------------------------------------------------------------------
" UltiSnips
"---------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"---------------------------------------------------------------------
" Auto reload vimrc
"---------------------------------------------------------------------

"vimrc文件修改之后自动加载windows/linux
autocmd! bufwritepost _vimrc source %
autocmd! bufwritepost .vimrc source %


