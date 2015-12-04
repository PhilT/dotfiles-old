#!/usr/bin/env bash

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle

gup ack.vim mileszs
gup vim-airline bling
gup vim-bundler tpope
gup vim-dispatch tpope
gup vim-fugitive tpope
gup fzf.vim junegunn
gup vim-git tpope
gup vim-haml tpope
gup jasmine.vim claco
gup JavaScript-Indent vim-scripts
gup vim-javascript-syntax jelera
gup vim-markdown tpope
gup nerdtree scrooloose
gup vim-node moll
gup vim-pathogen tpope
gup vim-rails tpope
gup vim-rake tpope
gup vim-rspec thoughtbot
gup vim-ruby vim-ruby
gup vim-slim slim-template
gup snipmate.vim msanders
gup syntastic scrooloose
gup vim-surround tpope
gup vim-yaml avakhov
gup ag.vim rking


mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -s -O https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
curl -s -O https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim
