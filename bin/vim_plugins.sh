#!/usr/bin/env bash

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
gup vim-airline bling
gup vim-javascript-syntax jelera
gup rspec.vim Keithbsmiley
gup ctrlp.vim kien
gup ack.vim mileszs
gup vim-node moll
gup snipmate.vim msanders
gup nerdtree scrooloose
gup syntastic scrooloose
gup vim-slim slim-template
gup vim-bundler tpope
gup vim-dispatch tpope
gup vim-fugitive tpope
gup vim-git tpope
gup vim-markdown tpope
gup vim-pathogen tpope
gup vim-rails tpope
gup vim-rake tpope
gup vim-surround tpope
gup vim-ruby vim-ruby
gup JavaScript-Indent vim-scripts
mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -s -O https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
curl -s -O https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim

