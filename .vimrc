""""""""""
"My Vimrc

""""""""""

"" General Settings

	syntax on
	set tabstop=4
	set shiftwidth=4
	set dir=/tmp/
	set relativenumber
	set number
	set spell
	set complete+=kspell
	set nocompatible
	filetype plugin on
	syntax on

"Set vimrc shortcut
	
	let mapleader = ","
	nmap <leader>v :tabedit $MYVIMRC<CR>

" Source the vimrc file after saving it
 	if has("autocmd")
 			autocmd bufwritepost .vimrc source $MYVIMRC
 				endif

" Return to the same line you left off at
 	augroup line_return
 		au!
 		au BufReadPost *
 			\ if line("'\"") > 0 && line("'\"") <= line("$") |
 			\	execute 'normal! g`"zvzz' |
 			\ endif
 	augroup END

" File and Window Management
	inoremap <leader>w <Esc>:w<CR>
 	nnoremap <leader>w :w<CR>

 	inoremap <leader>q <ESC>:q<CR>
 	nnoremap <leader>q :q<CR>

 	inoremap <leader>x <ESC>:x<CR>
 	nnoremap <leader>x :x<CR>

 	nnoremap <leader>e :Ex<CR>
 	nnoremap <leader>t :tabnew<CR>:Ex<CR>
 	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
 	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>

"" Plugin Settings

"install vim-plug if it isn't already
	
	if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
			endif

"Plugins
	call plug#begin('~/.vim/plugged')

	Plug 'junegunn/vim-plug'
	Plug 'tpope/vim-fugitive'
	Plug 'vimwiki/vimwiki'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	call plug#end()

"Settings for vim-wiki
 	"use markdown formatting for wiki pages
	let g:vimwiki_list = [{'path': '~/vimwiki/',
	                      \ 'syntax': 'markdown', 'ext': '.md'}]

"Settings for vim-airline
	"always show the top tab bar
	let g:airline#extensions#tabline#enabled = 1


