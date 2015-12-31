" Copyright (c) 2015 Leon Li<lilei.leon@gmail.com>
"
" MIT License
"
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be
" included in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
" NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
" LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
" OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
" WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" 
"
" "Requirement"
" Vim 7+ version with Lua installed. 
" To verify this, you have to run `vim --version` to check with the vim
" version. And running `:echo has('lua')` to verify that if `1` will be
" returned.
"
" "Usage"
" By using this .vimrc file, you'd install a few external tools:
" 1). Tools for Gotag => `go get -u github.com/jstemmer/gotags`
" 2). Install CTags => `brew install ctags`
" 3). Run vim command => `:PlugIntall`
" 4). Run command for go-vim plugin => `:GoInstallBinaries`
" 5). Install & commpile the command-t plugin, run `:he command-t-compile` for
" more detail for compling command-t plugin
" 6). TernJS installation: see -> `:he tern-install`
"
" Then you should good to go. Have Fun! ;)
" For more detail, please read the source of this .vimrc file, as it
" should be commented below.

" General Settings
set nu
set ruler 
set title
set sb " splitbelow
set spr " splitright
set mouse=a
set cursorline
set scrolloff=3
" Setup the cursor shape on different mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" For programmer
filetype indent on
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
" Useful keybinding
nnoremap <space> zz
noremap @ "*
vnoremap y "*y
noremap , ^
noremap . $
" split naviagation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Apply the color scheme
syntax on
colorscheme molokai 
let g:molokai_original = 1
" Setup the Plug for plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree',{'on': 'NERDTreeToggle'}
Plug 'tpope/vim-sensible'
Plug 'bling/vim-airline'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'Shougo/neocomplete.vim'
Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'wincent/Command-T'
Plug 'ternjs/tern_for_vim'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/DrawIt'
call plug#end()

" NERDTree settings 
let NERDTreeShowLineNumbers = 1

" Command-T setings
let g:CommandTCancelMap='<Esc>'

" Vim JSX settings
let g:jsx_ext_required = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_close_preview = 1
set completeopt-=preview

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Tagbar keybinding
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
" Tagbar settings
let g:tagbar_autoclose = 0
let g:tagbar_show_linenumbers = -1 

" Tagbar config for gotag 
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

" Setup the bind key for NERDTree
map <C-n> :NERDTreeToggle<CR>

" Map binding key for TernJS for def
map td :TernDef<CR>

" Config vim-go
" ##########################################################
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>s <Plug>(go-implements)

" au FileType go nmap <Leader>i <Plug>(go-info)

let g:go_auto_type_info = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

let g:go_metalinter_autosave = 1
" ##########################################################
