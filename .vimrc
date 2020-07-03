"" Plugin Settings

"install vim-plug if it isn't already

	if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

"Plugins
	call plug#begin('~/.vim/plugged')

	Plug 'junegunn/vim-plug'
	Plug 'tpope/vim-fugitive'
	Plug 'vimwiki/vimwiki'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'edkolev/tmuxline.vim'
    Plug 'morhetz/gruvbox'
	Plug 'lervag/vimtex'
	Plug 'airblade/vim-gitgutter'
    Plug 'vim-utils/vim-man'
    Plug 'lingnand/pandoc-preview.vim'
    Plug 'JamshedVesuna/vim-markdown-preview'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'roggan87/vim-bible'
    Plug 'mbbill/undotree'
    Plug 'jremmen/vim-ripgrep'
    Plug 'leafgarland/typescript-vim'
    Plug 'lyuts/vim-rtags'
    Plug 'git@github.com:ctrlpvim/ctrlp.vim.git'

	call plug#end()

 " General Settings

	syntax on
   	set nocompatible
	set tabstop=4 softtabstop=4
	set shiftwidth=4
	set expandtab
	set smartindent
	set smartcase
	set incsearch
    set noswapfile
	set dir=/tmp/
	set relativenumber
	set number
	set spell
	set complete+=kspell
    set wildmode=longest,list,full " Enable autocompletion:
    set ignorecase " search ignoring case
    set cursorline " show me what line im on
	filetype plugin on
	colorscheme gruvbox
	set background=dark
    set nowrap
    set undodir=~/.vim/undodir
    set undofile
    set nobackup
    "au FileType * try | execute "compiler ".&filetype | catch /./ | endtry

    set colorcolumn=80
    highlight ColorColumn ctermbg=0 guibg=lightgrey

"set listchars=eol:$,nbsp:_,tab:>-,trail:~,extends:>,precedes:<


"Settings for vim-wiki
    "use markdown formatting for wiki pages
    let g:vimwiki_list = [{'path': '~/vimwiki/',
                           \ 'syntax': 'markdown', 'ext': '.md'}]

"Settings for vim-airline
	"always show the top tab bar
	let g:airline#extensions#tabline#enabled = 1

	"enable themes
	let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme='base16_gruvbox_dark_hard'

"Settings for pandoc-preview.vim
    let g:pandoc_preview_pdf_cmd = "zathura"
 "nnoremap <leader>v :PandocPreview<cr>

"Settings for vim-markdown-preview
    let vim_markdown_preview_pandoc = 1
    "let vim_markdown_preview_browser='Firefox'
	nmap <leader>p :PandocPreview<CR>

"Settings for vim-bible
    let g:BibleTranslation = "KJV"
    let g:BibleOmitModuleName = 0
    let g:BibleDelimiter = " "
    let g:BibleLocale = "en"

    nnoremap <leader>b y :call Bible()<CR>
    vnoremap <leader>b y :call Bible(@*)<CR> "Use selection as query

"Set vimrc shortcut
	let mapleader = " "
	nmap <leader>v :tabedit $MYVIMRC<CR>

" Source the vimrc file after saving it
	if has("autocmd")
        autocmd bufwritepost .vimrc source $MYVIMRC
    endif

    " Uncomment the following to have Vim jump to the last position when                                                       
    " reopening a file
    if has("autocmd")
          au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
              \| exe "normal! g'\"" | endif
      endif

" UndoTree
nnoremap <F5> :UndotreeToggle<cr>
nnoremap <leader>u :UndotreeShow<CR>

if executable('rg')
        let g:rg_derive_root='true'
    endif

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
