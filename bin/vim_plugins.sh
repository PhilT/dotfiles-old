#!/usr/bin/env bash
source `dirname $0`/config.sh

mkdir -p ~/apps
cd ~/apps
gup fzf junegunn --depth 1
fzf/install

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
gup ag.vim rking --depth 1
gup vim-airline bling --depth 1
gup auto-pairs jiangmiao --depth 1
gup vim-bundler tpope --depth 1
gup vim-dispatch tpope --depth 1
gup vim-fugitive tpope --depth 1
gup fzf.vim junegunn --depth 1
gup vim-git tpope --depth 1
gup vim-gitgutter airblade --depth 1
gup vim-js-indent gavocanov --depth 1
gup vim-markdown tpope --depth 1
gup nerdtree scrooloose --depth 1
gup vim-node moll --depth 1
gup vim-pathogen tpope --depth 1
gup vim-rails tpope --depth 1
gup vim-rake tpope --depth 1
gup vim-ruby vim-ruby --depth 1
gup vim-slim slim-template --depth 1
gup vim-slm slm-lang --depth 1
gup vim-stylus wavded --depth 1
gup snipmate.vim msanders --depth 1
gup syntastic scrooloose --depth 1
gup vim-surround tpope --depth 1
gup vim-test janko-m --depth 1
gup yajs.vim othree --depth 1
gup vim-yaml avakhov --depth 1


mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -s -O https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
curl -s -O https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim
