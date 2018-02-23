"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" author:	YoungShook
" version:	1.1
" last update: 2016/06/06
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off                  " required
set rtp+=/Users/YoungShook/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" 快速打开和查询定位文件
Plugin 'ctrlp.vim'
" 符号匹配
Plugin 'AutoClose'
" 快速编写html/css
Plugin 'ZenCoding.vim'
" Quickly format javascript, html and css files
Plugin '_jsbeautify'
" 查看和自动识别文件的编码格式
Plugin 'FencView.vim'
" VIM 文件目录管理
Plugin 'The-NERD-tree'
" 代码自动补全
Plugin 'Match-Bracket-for-Objective-C'
Plugin 'L9'
" 代码片段
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Git in vim'
Plugin 'tpope/vim-fugitive'
" Vim批量注释工具, 可以注释多行和去除多行注释
Plugin 'tpope/vim-commentary'
" 更加美观的显示缩进对齐线
Plugin 'Yggdroot/indentLine'
" 在 Vim 中对齐文本
Plugin 'godlygeek/tabular'
" Markdown
Plugin 'tpope/vim-markdown'
" 用于快速切换括号/引号或者标签
Plugin 'tpope/vim-surround'
" A light and configurable statusline/tabline for Vim
Plugin 'itchyny/lightline.vim'
" VIM Theme
Plugin 'trevordmiller/nova-vim'
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ","
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
nnoremap <C-\[> <C-T>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tag_files = 1

" Use the Molokai theme (originally created for TextMate by Wimer Hazenberg)
" colorscheme inkpot
colorscheme nova
set background=dark
set t_Co=256
syn on
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
syntax enable
" Use UTF-8 without BOM
set encoding=UTF-8 nobomb
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
set ts=4
set shiftwidth=4
set expandtab
set autoindent
set autowrite
set cindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set history=1000
set foldenable
set foldmethod=manual
set helplang=cn
set iskeyword+=_,$,@,%,#,-

syntax on
" Highlight current line
set cursorline
set showmatch
set nohlsearch
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	filetype plugin on
	filetype indent on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    autocmd FileType apache setlocal commentstring=#\ %s
endif


"""""New file""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Create .c,.h,.sh,.java file，auto insert file header
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetFileTitle()"

func SetFileTitle()
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: YoungShook")
        call append(line(".")+2, "\# mail: shook.young@gmail.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: YoungShook")
        call append(line(".")+2, "    > Mail: shook.young@gmail.com ")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
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
    autocmd BufNewFile * normal G
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""