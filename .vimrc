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

"Set vimrc shortcut
	
	let mapleader = ","
	nmap <leader>v :tabedit $MYVIMRC<CR>

	autocmd Filetype html setlocal sw=2 expandtab
	autocmd Filetype javascript setlocal sw=4 expandtab

	set hlsearch
	nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>
	nnoremap <C-c> :set norelativenumber<CR>:set nonumber<CR>:echo "Line numbers turned off."<CR>
	nnoremap <C-n> :set relativenumber<CR>:set number<CR>:echo "Line numbers turned on."<CR>

	nnoremap n nzzzv
	nnoremap N Nzzzv

	nnoremap H 0
	nnoremap L $
	nnoremap J G
	nnoremap K gg

	map <tab> %

	set backspace=indent,eol,start

	nnoremap <Space> za
	nnoremap <leader>z zMzvzz

	nnoremap vv 0v$

	set listchars=tab:\|\
	nnoremap <leader><tab> :set list!<cr>
	set pastetoggle=<F2>
	set mouse=a
	set incsearch

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


	call plug#end()
