syntax on
set nocompatible
source $VIMRUNTIME/vimrc_example.vim

set smartcase
set incsearch
set laststatus=2

set nobackup
set smartcase
set incsearch
set hlsearch

set showmatch
set ignorecase
set showmode
set ru

set fo=tcq2

set expandtab
set tabstop=4
set shiftwidth=4

set backspace=indent,eol,start
set ai


" no compatable mode
set nocp

" backspace can delete indent,eol and start
set backspace=indent,eol,start

set foldmethod=marker

" set coding scheme to support Chinese
" set fileencoding=gb18030
" set fileencodings=utf-8,gb18030,utf-16,big5
" set fileencodings=ucs-bom,utf-8,chinese
" if has("multi_byte")
"     set encoding=utf-8
"     setglobal fileencoding=utf-8
"     set fileencoding=gb2312
"     set bomb
"     set termencoding=gb2312
"     set fileencodings=ucs-bom,gb2312,utf-8,latin1
"     set guifont=-misc-fixed-medium-r-normal-*-18-120-100-100-c-90-iso10646-1
"     set guifontwide=-misc-fixed-medium-r-normal-*-18-120-100-100-c-180-iso10646-1
" else
"     echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
" endif

" show line number
set nu
" show underline for current line
set cul

let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

au BufNewFile,BufRead *[mM]akefile,*.mk,*.mak,*.dsp setf make
au Filetype make set noexpandtab

noremap <F7> <Esc>:NERDTreeToggle<CR>

let Tlist_Ctags_Cmd="/usr/local/Cellar/ctags/5.8/bin/ctags"
let Tlist_Use_Right_Window=1
noremap <F8> <Esc>:TlistToggle<cr>


noremap <F10> <Esc>:TagbarToggle<cr>

set lines=45

" set m file to objective c
let feletype_m='objc'

" update the :make command to tell Xcode to build
" set makeprg=osascript\ -e\ \"tell\ application\ \\\"Xcode\\\"\"\ -e\ \"build\"\ -e\ \"end\ tell\"

function! XcodeClean()
silent execute ':!osascript -e "tell application \"Xcode\"" -e "Clean" -e "end tell"'
endfunction
command! -complete=command XcodeClean call XcodeClean()

function! XcodeDebug()
silent execute ':!osascript -e "tell application \"Xcode\"" -e "Debug" -e "end tell"'
endfunction
command! -complete=command XcodeDebug call XcodeDebug()

" Command-K cleans the project
" noremap <M-k>:XcodeClean
" Command-Return Starts the program in the debugger
" noremap <M-CR>:XcodeDebug

"inoremap <S-CR> <Esc>

"yankring：寄存器可视操作
let mapleader = ";"
noremap <leader>y :YRShow<cr>
"map <leader>yc :YRClear<CR>

"生成一个tags文件
nnoremap <leader>ct :!ctags -R *<CR>
nnoremap <leader>cot :!ctags -R --language-force=ObjC *<CR>
	
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Reset mini buffer explorer
noremap <leader>mb :TMiniBufExplorer<CR>
":TMiniBufExplorer<CR>
" Reset workspace, the ":Project" must be the last command
" map <silent> <M-l>:TMiniBufExplorer<CR>
":TMiniBufExplorer<CR>:Project<CR>

" FufBuffer in fuzzyfinder.vim
" noremap <silent> <A-f>   :FufFile<CR>
command! FF  :FufFile
nnoremap <leader>ff <esc>:<c-u>FufFile<cr>
" noremap <silent> <F10>   :FufFile<CR>
 
" FufBuffer in fuzzyfinder.vim
" noremap <silent> <A-b>   :FufBuffer<CR>
command! FB  :FufBuffer
nnoremap <leader>fb <esc>:<c-u>FufBuffer<cr>

" Find tag in buffer 
nnoremap <leader>ft <esc>:<c-u>FufTag<cr>
nnoremap <leader>fbt <esc>:<c-u>FufBufferTag<cr>
nnoremap <F3> <esc>:<c-u>FufTagWithCursorWord<cr>

nnoremap <F1> <esc>:<c-u>FufHelp<cr> 
inoremap <F1> <esc>:<c-u>FufHelp<cr> 

" ==== End of FuzzyFinder configuration ====

" tagbar
"nmap <silent> <F4> :TagbarToggle<CR>
" let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_ctags_bin="/usr/bin/ctags.brew.old"
let g:tagbar_width = 30

" For Objective C tags
" ctags -R --language-force=ObjC or --langmap,
" ObjC
"     P  protocols
"     i  class interfaces
"     I  class implementations
"     M  instance methods
"     C  implementation methods
"     Z  protocol methods

let tlist_objc_settings = 'ObjC;P:protocols;i:class interfaces;I:class implementations;M:instance methods;C:implementation methods;Z:protocol methods'


" useful mapping
" Learn Vimscript the Hard Way
" http://learnvimscriptthehardway.stevelosh.com/
inoremap <c-u> <ESC>viwUea
"nnoremap <c-u> viwUe

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

iabbrev @@ yeahq.lee@gmail.com
iabbrev ccopy Copyright 2011 Yeqing Li, all rights reserved.

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" vnoremap <leader>' <esc>gv<esc>a'<esc>gvdi'<esc>p
vnoremap <leader>' <esc>gvo<esc>hi'<esc>gvO<esc>a'<esc>

inoremap jk <esc>
inoremap <esc> <nop>

nnoremap <leader>, <esc>:<up><cr>
nnoremap <leader>. <esc>:<up>
inoremap <leader>. <esc>:<up>

augroup filetype_js
    " clear previous definition
    autocmd!
    autocmd FileType javascript :iabbrev <buffer> f function() {<cr><cr>}<up><up><right><right><right><right><right><right><right> 
augroup END

augroup filetype_cpp
    " clear previous definition
    autocmd!
    autocmd FileType cpp :iabbrev <buffer> r return
    autocmd FileType cpp :set foldmethod=syntax
augroup END

augroup filetype_objc
    autocmd!
    autocmd FileType objc :iabbrev <buffer> r return
    autocmd FileType objc :iabbrev <buffer> { {<cr>}<up><end>
augroup END

augroup filetype_markdown
    " clear previous definition
    autocmd!
    " FiyeType markdown - Only process Markdown file
    " :onoremap ih - execute in normal mode define ih in pending mode
    " :<c-u> - clear all previous command mode input
    " execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr> - execute in normal mode
    "        :help execute
    "        :help normal
    "        :help expr_quote
    " normal! - excute command and ignore mapping 
    " ?^==\\+$ - Search for at least two "=" which occupy a line
    " :nohlsearch - no high light on search result
    " k - go up one line
    " v - enter visual mode
    " g_ - Go to the last none blank character (:h motions.txt)
    autocmd FileType markdown :onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType markdown :onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END

" :help statusline
" set statusline+=%L
let &statusline="%f\ -\ L:%l/%L C:%c %p%% %m %r"

" set color scheme
" colorscheme elflord
" colorscheme koehler
" colo peachpuff
colorscheme desert 

nnoremap <leader>gu <esc>:<c-u>!awk -F"\t" -f ~/SourceCode/genuml.awk tags > uml.txt; java -Xms128m -Xmx512m -jar ~/SourceCode/plantuml.jar uml.txt<cr>

nnoremap <leader>eu <esc>:<c-u>vsplit uml.txt<cr>

" with line number
" nnoremap <leader>cu <esc>:<c-u>!ctags --fields=+Sait --excmd=n -uR *<cr>
nnoremap <leader>cu <esc>:<c-u>!ctags --fields=+Sait -uR *<cr>

" =================== zen coding begin ========================

let g:user_zen_settings = {
\  'indentation' : '  ',
\  'perl' : {
\    'aliases' : {
\      'req' : 'require '
\    },
\    'snippets' : {
\      'use' : "use strict\nuse warnings\n\n",
\      'warn' : "warn \"|\";",
\    }
\  }
\}

let g:user_zen_expandabbr_key = '<c-b>'

let g:use_zen_complete_tag = 1

" =================== zen coding end ========================


" buffer move
nnoremap <leader>nn :bnext<cr>
nnoremap <leader>pp :bpre<cr>
nnoremap <leader>ll :ls<cr>

" =================== reStructuredText ========================
augroup filetype_rst
    autocmd FileType rst :nnoremap <F5> <ESC>:w<cr>:!make<cr> 
    autocmd FileType rst :nnoremap <S-F5> <ESC>:w<cr>:!rst2html.py %:t  html/%:t:r.html <cr> 
    autocmd FileType rst :nnoremap <F6> <ESC>:r!date<cr><cr>kkJ 
augroup END

" =================== Vimwiki ========================
augroup filetype_vimwiki
    autocmd!
    " calendar
    autocmd FileType vimwiki :nnoremap <F5> :Calendar<cr> 
    autocmd FileType vimwiki :nnoremap <S-F4> :VimwikiAll2HTML<cr> 
    autocmd FileType vimwiki :nnoremap <F4> :Vimwiki2HTML<cr>

    autocmd FileType vimwiki :nnoremap <leader>o :execute ':!open "' . fnamemodify(g:vimwiki_list[g:vimwiki_current_idx]['path_html'] . '/' . expand('%:t:r') . '.html"', ":p")<cr>

    autocmd BufWriteCmd *.wiki :Vimwiki2HTML
augroup END

" vimwiki:
"     是否在词条文件保存时就输出html  这个会让保存大词条比较慢所以我默认没有启用  有需要的话就把这一行复制到下面去
"     \ 'auto_export': 1,

" let g:vimwiki_list = [{'path': 'E:/path/to/vimwiki-1/vimwiki/',  
"     \ 'path_html': 'E:/My Dropbox/vimwiki_html/'
"         \ 'html_header': 'E:/My Dropbox/Public/vimwiki_template/header.htm',
"     \ 'html_footer': 'E:/My Dropbox/Public/vimwiki_template/footer.htm',
"     \ 'diary_link_count': 5},
"     \{'path': 'Z:/path/to/vimwiki-2/vimwiki/'}]

let g:vimwiki_list = [{'path': '~/NetDisks/YQAtQMail/Dropbox/Document/Wiki',  
            \ 'path_html': '~/NetDisks/YQAtQMail/Dropbox/Document/Wiki_html',
            \ 'diary_link_count': 5},
            \{'path': '~/NetDisks/YQAtQMail/Dropbox/Document/LifeWiki',  
            \ 'path_html': '~/NetDisks/YQAtQMail/Dropbox/Document/LifeWiki_html',
            \ 'diary_link_count': 5},
            \{'path': '~/vimwiki', 
            \'path_html' : '~/vimwiki_html'}]

" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0

" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1

" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''


" 是否开启按语法折叠  会让文件比较慢
":let g:vimwiki_folding = 1

" 加ctags支持，需要设置~/.ctags文件
let tlist_vimwiki_settings = 'wiki;h:Headers'

" 允许HTML的设置
" let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'
let g:vimwiki_valid_html_tags='h1, hr'

" ====================================================
" Python
filetype plugin on
let g:pydiction_location = '/Users/yeqing/.vim/ftplugin/pydiction/complete-dict'
let g:pydiction_menu_height = 20


"
" For openCV code reading
"
function LoadOpenCVTags()
    set tags+=~/SourceCode/cplusplus/OpenCV-2.4.1/tags,
    set tags+=~/.vim/systags,
endfunction

