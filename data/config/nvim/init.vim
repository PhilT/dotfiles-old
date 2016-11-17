set nocompatible " noop on neovim

set runtimepath+=$WORKSPACE/dotfiles/data/config/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('$WORKSPACE/dotfiles/data/config/nvim/dein')

call dein#add('Shougo/dein.vim')

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('sheerun/vim-polyglot')
call dein#add('joshdick/onedark.vim') " theme

call dein#add('bling/vim-airline')
call dein#add('airblade/vim-gitgutter')
call dein#add('scrooloose/nerdtree')
call dein#add('slim-template/vim-slim')
call dein#add('vim-ruby/vim-ruby')
call dein#add('slm-lang/vim-slm')
call dein#add('wavded/vim-stylus')
call dein#add('avakhov/vim-yaml')

call dein#add('tpope/vim-bundler')
call dein#add('tpope/vim-dispatch')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-git')
call dein#add('tpope/vim-markdown')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-rake')

call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

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

" Fuzzy find
set wildignore+=.git/**,tmp/**,coverage/**,log/**,app/assets/fonts/**,app/assets/images/**,db/migrate/**,node_modules/**,bin/**,fca-frontend/**,frontend/**
set path+=** " recursively search files
set wildmenu " display files with TAB
map <C-p> :find<SPACE>


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
noremap j gj
noremap k gk
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Testing
let test#strategy = 'dispatch'
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>g :TestVisit<CR>
let g:rspec_command = 'call VimuxRunCommand("bundle exec spring rspec --format progress --require ~/apps/rspec_support/quickfix_formatter.rb --format QuickfixFormatter --out quickfix.out {spec}\n")'


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
