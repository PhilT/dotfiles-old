call plug#begin('$HOME/.local/share/nvim/plugged')

Plug 'sheerun/vim-polyglot' " Syntax, indent, compilers for various languages
Plug 'rakr/vim-one' " theme

Plug 'airblade/vim-gitgutter'

" Async keyword completion & snippets
"Plug 'roxma/nvim-completion-manager'
Plug 'Shougo/neco-syntax'   " Completions using lang syntax keywords
Plug 'jiangmiao/auto-pairs' " Auto-pair brackets. <M-p> on/off, <M-e> wrap, <M-n>/<M-b> Next/prev pair
Plug 'SirVer/ultisnips'     " Snippet engine
Plug 'honza/vim-snippets'   " Snippets
Plug 'Shougo/echodoc.vim'   " Display docs in echo area - see syntax of methods

" Tools
Plug 'junegunn/fzf'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'metakirby5/codi.vim' " IRB or Node console - :Codi/:Codi! (on/off
Plug 'mtth/scratch.vim' " Scratchpad
Plug 'janko-m/vim-test' " Run tests for a variety of frameworks (Ruby: Minitest, RSpec, Rails, JS: TAP, Jest, Jasmine, etc)
Plug 'kassio/neoterm' " Reuse Neovim :terminal, :T <command>, eg. :T git status
Plug 'tpope/vim-surround'

" Ruby
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'

" JavaScript
Plug 'slm-lang/vim-slm'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'moll/vim-node'
Plug 'elzr/vim-json'

" Git
Plug 'tpope/vim-fugitive' " Gedit, Gblame, Gdiff, Gstatus, Greset, Gcommit, plus loads more

" Formatting
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

""""""" END OF PLUGIN INSTALL

" Logging
let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_NCM_LOG_LEVEL="DEBUG"
let $NVIM_NCM_MULTI_THREAD=0

" Ternjs config
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue'
                \ ] " Add extra filetypes

" General settings

set termguicolors
set background=dark
colorscheme one
hi! EndOfBuffer gui=NONE guifg=#1b202a guibg=NONE

set autoread
set backspace=2
set clipboard=unnamed
set expandtab           " Tabs to spaces
set fillchars+=vert:│   " Set vertical border on split screen
set hidden              " hide buffers instead of closing
set ignorecase
set incsearch           " show matches as you type
set laststatus=2
set noswapfile
set number              " line numbers
set scrolloff=7
set shiftwidth=2
set smartcase
set tabstop=2

" Python providers
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Scratchpad
let g:scratch_persistence_file = '.scratch.vim'
let g:scratch_horizontal = 1
let g:scratch_height = 10
nmap go :Scratch<CR>
nmap gp :ScratchPreview<CR>

" Completion
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"

" Search/Replace
hi Search guibg=#61AFEF
hi WildMenu guifg=#333333 guibg=#61AFEF
nnoremap <silent> <Space> :nohlsearch<CR>

" Fuzzy find
set wildmenu " display files with TAB
set wildignore+=.git/**,tmp/**,coverage/**,log/**,app/assets/fonts/**,app/assets/images/**,db/migrate/**,node_modules/**,bin/**,*.sql,**/*.min.js
set path+=** " recursively search files
nnoremap <C-f> :FZF<CR>
set rtp+=~/apps/fzf

" Find in files
let g:ag_prg = 'ag --column --path-to-ignore ~/.ignore'

" NERDTree
nnoremap <C-b> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " quit vim if NERDTree is last window
let NERDTreeQuitOnOpen=1 "close NERDTree after opening file

" Buffers
nnoremap <C-n> :cn<CR>
nnoremap <C-m> :cp<CR>

" Sensible movement keys
nnoremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal
tnoremap <Esc> <C-\><C-n>| " Exit terminal

" Testing - vim-test
let test#ruby#minitest#file_pattern = '_spec\.rb'
let test#strategy = 'neovim'

" Git Gutter
set signcolumn=yes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leaders mappings
"

nnoremap <silent> <Leader>a :TestSuite<CR>|             " Runs entire suite
nnoremap <silent> <Leader>c :set background=light<CR>|  " Switch to light theme
nnoremap <silent> <Leader>C :set background=dark<CR>|   " Switch to dark theme
nnoremap <silent> <Leader>d :bd<CR>|                    " delete buffer
nnoremap <silent> <Leader>f :!rubocop -a %<CR>|         " Run Rubocop autocorrect on current file
nnoremap <silent> <Leader>g :TestVisit<CR>|             " Runs last test file
nnoremap <silent> <Leader>i :setlocal number!<CR>|      " Toggle line numbers
nnoremap <silent> <Leader>l :TestLast<CR>|              " Runs last test
nnoremap <silent> <Leader>n :bn<CR>|                    " next buffer
nnoremap <silent> <Leader>o :set paste!<CR>|            " Toggle paste formatting
nnoremap <silent> <Leader>p :bp<CR>|                    " previous buffer
nnoremap <silent> <Leader>rr :source ~/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader>t :TestFile<CR>|              " Runs all tests in file
nnoremap <silent> <Leader>T :TestNearest<CR>|           " Runs test nearest to cursor
nnoremap <silent> <Leader>vim :e ~/.config/nvim/init.vim<CR>| " Reload vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""

" Remove trailing whitespace
autocmd BufEnter * EnableStripWhitespaceOnSave

" only highlight current line while in insert mode
augroup CursorLine
  au!
  au InsertEnter * setlocal cursorline
  au InsertLeave * setlocal nocursorline
augroup END

" Spellcheck Markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
nnoremap <F6> :setlocal spell!<CR>

" CTags
" <C-[> jump, g<C-[> list, <C-t> back
" <C-n>, <C-p> - Autocomplete
" <C-x><C-n> - Complete filenames
set tags=./.tags,.tags
command! Tags !ctags -Rf .tags .

" Build, Linting
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>| " ensure Enter is not remapped in Quickfix
let g:neomake_serialize=1
let g:neomake_open_list=0

" Callback for reloading file in buffer when rubocop/eslint has finished
function! s:Neomake_callback(options)
  if (a:options.name ==? 'rubocop' || a:options.name ==? 'eslint') && (a:options.has_next == 0)
    edit
  endif
endfunction

autocmd BufWritePost * Neomake " call neomake#Make(1, [], function('s:Neomake_callback'))
autocmd BufReadPost * Neomake

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

let g:neomake_ruby_rspec_enabled_makers = ['rspec']

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_javascript_eslint_args = ['-c', '.eslintrc', '--fix', '--format', 'compact']
