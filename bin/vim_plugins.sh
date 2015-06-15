#!/usr/bin/env bash

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle

gup ack.vim mileszs
gup vim-airline bling
gup vim-bundler tpope
gup ctrlp.vim kien
gup vim-dispatch tpope
gup vim-fugitive tpope
gup vim-git tpope
gup vim-haml tpope
gup jasmine.vim claco
gup JavaScript-Indent vim-scripts "sed '/^echo/d' -i indent/html.vim"
gup vim-javascript-syntax jelera
gup vim-markdown tpope
gup nerdtree scrooloose
gup vim-node moll
gup vim-pathogen tpope
gup vim-rails tpope
gup vim-rake tpope
gup rspec.vim Keithbsmiley
gup vim-ruby vim-ruby
gup vim-slim slim-template
gup snipmate.vim msanders
gup syntastic scrooloose
gup vim-surround tpope
gup vim-yaml avakhov



mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -s -O https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
curl -s -O https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim

