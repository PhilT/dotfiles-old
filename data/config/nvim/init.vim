
call plug#begin('$HOME/.local/share/nvim/plugged')

Plug 'sheerun/vim-polyglot' " Syntax, indent, compilers for various languages
Plug 'joshdick/onedark.vim' " theme
Plug 'tpope/vim-obsession' " Save the session so it can be restored by tmux

Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'

" Completions, Snippets
Plug 'jiangmiao/auto-pairs'
" Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Tools
Plug 'junegunn/fzf'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'metakirby5/codi.vim' " Interactive dev scratchpad - :Codi/:Codi! (on/off
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm' " Reuse Neovim :terminal, :T <command>, eg. :T git status

" FSharp
" Not working due to https://github.com/Microsoft/BashOnWindows/issues/1265
" NameResolutionFailure when running ~/.local/share/nvim/plugged/vim-fsharp/install.sh
" Plug 'vim-syntastic/syntastic'
" Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'make fsautocomplete', }

" Ruby
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'

" JavaScript
Plug 'slm-lang/vim-slm'
Plug 'marijnh/tern_for_vim', { 'build': 'npm install' }
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'moll/vim-node'
Plug 'elzr/vim-json'

" Elm
Plug 'lambdatoast/elm.vim'

" Git
Plug 'tpope/vim-fugitive' " Gedit, Gblame, Gdiff, Gstatus, Greset, Gcommit, plus loads more

call plug#end()

filetype plugin indent on
syntax enable

set termguicolors
colorscheme onedark
let g:airline_theme='onedark'

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

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
set scrolloff=7
set laststatus=2

" Python providers
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'


""" Completion
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#disable_auto_complete = 1
inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()

inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Search/Replace
hi Search guibg=#61AFEF
hi WildMenu guifg=#333333 guibg=#61AFEF
nmap <silent> <Space> :nohlsearch<CR>

" Fuzzy find
set wildmenu " display files with TAB
set wildignore+=.git/**,tmp/**,coverage/**,log/**,app/assets/fonts/**,app/assets/images/**,db/migrate/**,node_modules/**,bin/**,*.sql
set path+=** " recursively search files
map <C-p> :FZF<CR>

" Find in files
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" NERDTree
map <C-b> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " quit vim if NERDTree is last window
let NERDTreeQuitOnOpen=1 "close NERDTree after opening file

" Toggle line numbers and paste formatting
nmap <Leader>l :setlocal number!<CR>
nmap <Leader>o :set paste!<CR>

" Map F1 to del key to fix terminfo problem when using st (simple terminal)
" https://github.com/neovim/neovim/issues/3211
map <F1> <del>
map! <F1> <del>

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

" Terminal
hi Normal guibg=#121417| " Match background color of terminal in editor
" tnoremap <Esc> <C-\><C-n> - conflicts with exiting FZF

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
function! TrimTrailingSpacesAndNewLines()
  let cursor_pos = getpos('.')
  :silent! %s/\s\+$//e
  :silent! %s/\($\n\s*\)\+\%$/
  call setpos('.', cursor_pos)
endfunction
autocmd BufWritePre * call TrimTrailingSpacesAndNewLines()

" Spellcheck Markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
nnoremap <F6> :setlocal spell!<CR>

" CTags
" <C-[> jump, g<C-[> list, <C-t> back
" <C-n>, <C-p> - Autocomplete
" <C-x><C-n> - Complete filenames
set tags=./.tags,.tags
command! Tags !ctags -Rf .tags .

nnoremap <leader>vim :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>rr :source ~/.config/nvim/init.vim<CR>

" Build, Linting
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>| " ensure Enter is not remapped in Quickfix
let g:neomake_serialize=1
let g:neomake_open_list=2


" Callback for reloading file in buffer when rubocop has finished
function! s:Neomake_callback(options)
  if (a:options.name ==? 'rubocop' || a:options.name ==? 'eslint') && (a:options.has_next == 0)
    edit
  endif
endfunction

let g:neomake_ruby_rubocop_args = ['--format', 'emacs', '-a', '-c', '/home/phil/.rubocop.yml']
autocmd BufWritePost * call neomake#Make(1, [], function('s:Neomake_callback'))

" from /home/phil/ws/tests/test_spec.rb:2:in `<top (required)>'
" /.../kernel_require.rb:55:in `require': no file -- my_class (LoadError)
" 1) MyClass#initialize does something
"    Failure/Error: expect(subject).to eq 'something crazy and wierd'
"      (compared using ==)
"      Diff:
"      @@ -1,2 +1,2 @@
"      -"something crazy and wierd"
"      +#<MyClass:0x0055759c127070>
"    RuntimeError:
"      expected #<MyClass:123> to be a kind of AnotherClass
"      expected: 'something crazy and wierd'
"           got: #<MyClass:0x0055759c127070>
"    # ./test_spec.rb:16:in `block (3 levels) in <top (required)>'
"    # ./test_spec.rb:23:in `block (3 levels) in <top (required)>'
"
"       this is a long error message that should show up in quickfix
"
let g:neomake_ruby_rspec_maker = { 'exe': 'rspec', 'errorformat': '
  \%.%#from %f:%l:in%.%#,
  \%\%%(/%\)%\@=%f:%l:in %m,
  \%E%.%#%n)%.%#,
  \%C%.%#Failure/Error%.%#,
  \%C%.%#(compared using%.%#,
  \%C       Diff:%.%#,
  \%C       @@ %.%# @@,
  \%C       -%.%#,
  \%C       +%.%#,
  \%C       %\%%(.+Error: %\)%\@=%m,
  \%C%.%#%\%%(expected %\)%\@=%m,
  \%C%.%#%\%%(expected: %\)%\@=%m,
  \%C%.%#%\%%(got: %\)%\@=%m,
  \%Z%.%## %f:%l:in %.%#,
  \%.%## %f:%l:in %m,
  \%C,
  \%C%m,
  \' }

let g:neomake_ruby_rspec_enabled_makers = ['rubocop', 'rspec']

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_args = ['--fix']
