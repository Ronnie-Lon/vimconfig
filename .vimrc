" customise vim configuration for c/c++/python

" let pathogen plugin to manage vim runtime path
"if has("gui_running")
"    ;
"else
   call pathogen#infect()
"endif

" don't be compitable with vi to avoid unexpected result
" set nocompatible " already exists in /etc/vimrc
set t_Co=256

syntax on

set encoding=utf-8

filetype plugin indent on

color molokai

set laststatus=2

set statusline=%F%m%r,%Y%{&fileformat}\ %l,%c\ %p%%\ [\%L]

set showcmd

set number

set hidden

" enable mouse
set mouse=a

" don't be compitable with vi to avoid unexpected result
set nocompatible
 
set tabstop=4
set et	" substitute space for tab
set shiftwidth=4

" show the matched paratheses
set showmatch

" set instant search && ignore case when search
set incsearch
set ignorecase
set smartcase

" enable backspace to delete the <cr> of the last line
" , the indent at the front of line
" and the former input which exists before you get into insert state
" set backspace=indent,eol,start " already exists in /etc/vimrc

" enable moving to last line or next line through ¡û¡ú
set whichwrap=[,]

" set folding
set foldenable
set foldmethod=syntax
set foldcolumn=0
set foldlevel=5
autocmd FileType python set foldmethod=indent
" config taglist
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=0
let Tlist_Auto_Update=1
let Tlist_Highlight_Tag_On_BufEnter=1
let Tlist_Eable_Fold_Column=0
let Tlist_Show_One_File=1
let Tlist_Display_Prototype=0
let Tlist_Compact_Format=0
let Tlist_Use_Right_Window=1
" append the system include file tags by default
" set tags+=~/.vim/tags
set tags+=tags;
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" config winmanager
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout='NERDTree|TagList'

" config NerdTree
let NERDTreeIgnore=['\.out$','cscope.files','tags','\.o$','\~$','\.pyc']
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
let NERDTreeChDirMode=2
nmap wm :if IsWinManagerVisible()<BAR>WMToggle<cr><BAR>else<BAR>WMToggle<cr>:q<cr>endif<cr><cr>

" config omnicppcomplete
" use clang_complete instead
"let OmniCpp_NamespaceSearch=2
"let OmniCpp_DisplayMode=0
"let OmniCpp_ShowPrototypeInAbbr=1
"let OmniCpp_DefaultNamespaces=["std"]
"let OmniCpp_MayCompleteScope=1
"let OmniCpp_SelectFirstItem=2
"let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]
" enable to auto close the preview window after you select a promption
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" config cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
" do <C-_>s by clicking 's' as soon as holding ctrl+shift+- 
" find the symbols
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" find the definition
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" find the functions which calls this function
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" find the specified text
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" find the regex
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" find and open the file
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" find the files which includes this file
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" find the functions which it calls
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
map <C-F11> :call LoadCS()<CR>
cs add cscope.out
function LoadCS()
    set nocsverb
    set cst
    let dir=getcwd()
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.out")
        delete("./"."cscope.out")
    endif
    if(executable('cscope') && has("cscope"))
        silent! execute "!find . -name '*.[ch]' -o -name '*.cpp' -o -name '*.cc' > cscope.files"
        silent! execute "!cscope -bkq -i cscope.files"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
    set csverb
endfunction

" config minibufexplorerq
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowArrows=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplMoreThanOne=0

" config supertab
let g:SuperTabDefaultCompletionType="context"
set ofu=syntaxcomplete#Complete

" config doxygen
let g:DoxygenToolkit_authorName="Ronnie"
let g:DoxygenToolkit_licenseTag="copyright@Ronnie"
let g:DoxygenToolkit_briefTag_pre="@brief"
let g:DoxygenToolkit_parmTag_pre="@param"
let g:DoxygenToolkit_returnTag="@return"
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"

" config make
nmap <C-F5> :!make

" highlight the exceed characters
" match DiffAdd '\%>80v.*'

" config Nerdcommenter
let NERDRemoveExtraSpaces=1
let NERDSpaceDelims=1

" config clang_complete
"let g:clang_snippets=1
"let g:clang_snippets_engine="snipmate"
let g:clang_use_library=1
let g:clang_library_path="/usr/lib/llvm/"
let g:clang_complete_patterns=1
let g:clang_h1_errors=1
let g:clang_complete_copen=1
let g:clang_complete_auto=0
let g:clang_close_preview=1

" javascript indent
let g:html_indent_inctags="html,body,head,tbody"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

" html, css, js beautify
"let g:jsbeautify = {'indent_size': 1, 'indent_char': '\t'}
"let g:htmlbeautify = {'indent_size': 1, 'indent_char': '\t', 'max_char': 78, 'brace_style': 'expand', 'unformatted': ['a', 'sub', 'sup', 'b', 'i', 'u']}
"let g:cssbeautify = {'indent_size': 1, 'indent_char': '\t'}
"let g:jsbeautify_engine="node"
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" forbid vim autocomplete to insert the first match
set completeopt=menu,preview,longest

let g:load_doxygen_syntax=1
