set nocompatible " noop on neovim

set runtimepath+=$WORKSPACE/dotfiles/data/config/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('$WORKSPACE/dotfiles/data/config/nvim/dein')

call dein#add('Shougo/dein.vim')

call dein#add('sheerun/vim-polyglot')
call dein#add('joshdick/onedark.vim') " theme

call dein#add('junegunn/fzf')
call dein#add('neomake/neomake')
call dein#add('jiangmiao/auto-pairs')
call dein#add('bling/vim-airline')
call dein#add('scrooloose/nerdtree')
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive') " Gedit, Gblame, Gdiff, Gstatus, Greset, Gcommit, plus loads more
call dein#add('tpope/vim-markdown')
call dein#add('janko-m/vim-test')

" Ruby
call dein#add('tpope/vim-bundler')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-rake')

" JavaScript
call dein#add('slm-lang/vim-slm')
call dein#add('marijnh/tern_for_vim', { 'build': 'npm install' })
call dein#add('othree/yajs.vim')
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('gavocanov/vim-js-indent')
call dein#add('moll/vim-node')
call dein#add('elzr/vim-json')


call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

set termguicolors
colorscheme onedark
let g:airline_theme='onedark'

set clipboard=unnamed
set autoread
set expandtab
set ignorecase
set incsearch
set smartcase
set noswapfile
set number
set shiftwidth=2
set backspace=2
set tabstop=2
set tags=./tags
set scrolloff=7
set laststatus=2

" Search/Replace
hi Search guibg=#61AFEF
hi WildMenu guifg=#333333 guibg=#61AFEF
nmap <silent> <Space> :nohlsearch<CR>

" Fuzzy find
set wildmenu " display files with TAB
set wildignore+=.git/**,tmp/**,coverage/**,log/**,app/assets/fonts/**,app/assets/images/**,db/migrate/**,node_modules/**,bin/**
set path+=** " recursively search files
map <C-p> :FZF<CR>


" NERDTree
map <C-b> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " quit vim if NERDTree is last window
let NERDTreeQuitOnOpen=1 "close NERDTree after opening file

" Toggle line numbers and paste formatting
nmap <Leader>l :setlocal number!<CR>
nmap <Leader>o :set paste!<CR>

" Buffers
nmap <C-n> :cn<CR>
nmap <C-m> :cp<CR>
map <Leader>p :bp<CR>| " previous buffer
map <Leader>n :bn<CR>| " next buffer
map <Leader>d :bd<CR>| " delete buffer

" Sensible movement keys
nnoremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Build
autocmd! BufWritePost * Neomake

" Testing - vim-test
let test#strategy = 'neovim'
nmap <silent> <leader>T :TestNearest<CR>| " Runs test nearest to cursor
nmap <silent> <leader>t :TestFile<CR>| " Runs all tests in file
nmap <silent> <leader>a :TestSuite<CR>| " Runs entire suite
nmap <silent> <leader>l :TestLast<CR>| " Runs last test
nmap <silent> <leader>g :TestVisit<CR>| " Runs last test file

" Git Gutter
let g:gitgutter_sign_column_always = 1

" Powerline fonts
let g:airline_powerline_fonts = 1

" only highlight current line while in insert mode
augroup CursorLine
  au!
  au InsertEnter * setlocal cursorline
  au InsertLeave * setlocal nocursorline
augroup END

" remove trailing spaces and extra lines at end of file
function TrimTrailingSpacesAndNewLines()
  let cursor_pos = getpos('.')
  :silent! %s/\s\+$//e
  :silent! %s/\($\n\s*\)\+\%$/
  call setpos('.', cursor_pos)
endfunction
autocmd BufWritePre * call TrimTrailingSpacesAndNewLines()

" Spellcheck Markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

" CTags
" <C-[> jump, g<C-[> list, <C-t> back
" <C-n>, <C-p> - Autocomplete
" <C-x><C-n> - Complete filenames
command! Tags !ctags -R .

" Snippets
function PasteSnippet(type)
  let snippets_dir = '$WORKSPACE/dotfiles/data/config/nvim/snippets'
  execute '-1read ' . snippets_dir . '/template.' . a:type
  execute 'normal! /$start'
  execute 'normal! dE'
  execute 'startinsert'
endfunction

nnoremap <Leader>slim :call PasteSnippet('slim')<CR>
nnoremap <Leader>spec :call PasteSnippet('spec')<CR>
