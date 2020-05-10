""""""""""
"My Vimrc

""""""""""

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
   	Plug 'morhetz/gruvbox'
	Plug 'edkolev/tmuxline.vim'
	Plug 'lervag/vimtex'
"	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'airblade/vim-gitgutter'
    Plug 'vim-utils/vim-man'
    Plug 'lingnand/pandoc-preview.vim'
    Plug 'JamshedVesuna/vim-markdown-preview'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'lervag/vimtex'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

	call plug#end()

"Settings for vim-wiki
 	"use markdown formatting for wiki pages
	let g:vimwiki_list = [{'path': '~/vimwiki/',
	                      \ 'syntax': 'markdown', 'ext': '.md'}]

"Settings for vim-airline
	"always show the top tab bar
	let g:airline#extensions#tabline#enabled = 1

	"enable themes
	let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme='gruvbox'

"Settings for pandoc-preview.vim
    let g:pandoc_preview_pdf_cmd = "zathura"
    nnoremap <leader>v :PandocPreview<cr>

"Settings for vim-markdown-preview
    let vim_markdown_preview_pandoc=1
    "let vim_markdown_preview_browser='Firefox'
	nmap <leader>p :PandocPreview<CR>

    "Settings for vim-latex-live-preview
    let g:livepreview_previewer = 'zathura'
   
"" General Settings

	syntax on
    au FileType * try | execute "compiler ".&filetype | catch /./ | endtry
	set tabstop=4 softtabstop=4
	set shiftwidth=4
	set expandtab
	set smartindent
	set smartcase
	set incsearch
	set dir=/tmp/
	set relativenumber
	set number
	set spell
	set complete+=kspell
	set nocompatible
    set wildmode=longest,list,full " Enable autocompletion:
    set ignorecase " search ignoring case
    set cursorline " show me what line im on
	filetype plugin on
	syntax on
	autocmd vimenter * colorscheme gruvbox
	set background=dark

   " set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey

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

