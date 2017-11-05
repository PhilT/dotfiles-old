
call plug#begin('$HOME/.local/share/nvim/plugged')


Plug 'sheerun/vim-polyglot' " Syntax, indent, compilers for various languages
Plug 'joshdick/onedark.vim' " theme
Plug 'tpope/vim-obsession' " Save the session so it can be restored by tmux

"Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'

" Async keyword completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
Plug 'carlitux/deoplete-ternjs' " Plugin for Ternjs Javascript tooling: Autocomplete, hints, type info, find def, refactoring
Plug 'Shougo/neco-syntax' " Completions using lang syntax keywords

" Completions, Snippets
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'   " Snippet engine
Plug 'honza/vim-snippets' " Snippets

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
Plug 'marijnh/tern_for_vim', { 'build': 'npm install' }
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'moll/vim-node'
Plug 'elzr/vim-json'

" Git
Plug 'tpope/vim-fugitive' " Gedit, Gblame, Gdiff, Gstatus, Greset, Gcommit, plus loads more

call plug#end()

""""""" END OF PLUGIN INSTALL

" Ternjs config
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue'
                \ ] " Add extra filetypes

" General settings

filetype plugin indent on
syntax enable

set termguicolors
colorscheme onedark
let g:airline_theme='onedark'

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

set autoread
set backspace=2
set clipboard=unnamed
set expandtab
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
"let g:deoplete#enable_at_startup = 1 " Needs fixing
"let g:deoplete#disable_auto_complete = 1
inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()

inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Search/Replace
hi Search guibg=#61AFEF
hi WildMenu guifg=#333333 guibg=#61AFEF
nmap <silent> <Space> :nohlsearch<CR>

" Fuzzy find
set wildmenu " display files with TAB
set wildignore+=.git/**,tmp/**,coverage/**,log/**,app/assets/fonts/**,app/assets/images/**,db/migrate/**,node_modules/**,bin/**,*.sql,**/*.min.js
set path+=** " recursively search files
map <C-p> :FZF<CR>

" Find in files
let g:ag_prg = 'ag --column --path-to-ignore ~/.ignore'

" NERDTree
map <C-b> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " quit vim if NERDTree is last window
let NERDTreeQuitOnOpen=1 "close NERDTree after opening file

" Toggle line numbers and paste formatting
nmap <Leader>i :setlocal number!<CR>
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
tnoremap <C-Esc> <C-\><C-n>| " Exit terminal

" Testing - vim-test
let test#ruby#minitest#file_pattern = '_spec\.rb'
let test#strategy = 'neovim'
nmap <silent> <leader>T :TestNearest<CR>| " Runs test nearest to cursor
nmap <silent> <leader>t :TestFile<CR>| " Runs all tests in file
nmap <silent> <leader>a :TestSuite<CR>| " Runs entire suite
nmap <silent> <leader>l :TestLast<CR>| " Runs last test
nmap <silent> <leader>g :TestVisit<CR>| " Runs last test file

" Git Gutter
set signcolumn=yes

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
nnoremap <leader>f :!rubocop -a %<CR>

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
