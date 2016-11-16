if &compatible
  set nocompatible
endif

set runtimepath+=/mnt/c/Users/Phil/ws/dotfiles/data/config/nvim/dien/repos/github.com/Shougo/dein.vim

call dein#begin('/mnt/c/Users/Phil/ws/dotfiles/data/config/nvim/dien')

call dein#add('Shougo/dein.vim')

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('sheerun/vim-polyglot')
call dein#add('joshdick/onedark.vim') # theme

call dein#add('rking/ag.vim')
call dein#add('bling/vim-airline')
call dein#add('junegunn/fzf.vim')
call dein#add('airblade/gitgutter')
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
