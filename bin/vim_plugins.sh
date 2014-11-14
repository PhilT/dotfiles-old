CLONE='git clone https://github.com'

clone_or_update () {
  owner=$1
  repo=$2
  if [ -d $repo ]; then
    cd $repo
    git pull
    cd -
  else
    git clone https://github.com/$owner/$repo
  fi
}


mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
clone_or_update bling vim-airline
clone_or_update jelera vim-javascript-syntax
clone_or_update Keithbsmiley rspec.vim
clone_or_update kien ctrlp.vim
clone_or_update mileszs ack.vim
clone_or_update moll vim-node
clone_or_update msanders snipmate.vim
clone_or_update scrooloose nerdtree
clone_or_update scrooloose syntastic
clone_or_update slim-template vim-slim
clone_or_update tpope vim-bundler
clone_or_update tpope vim-dispatch
clone_or_update tpope vim-fugitive
clone_or_update tpope vim-git
clone_or_update tpope vim-markdown
clone_or_update tpope vim-pathogen
clone_or_update tpope vim-rails
clone_or_update tpope vim-rake
clone_or_update tpope vim-surround
clone_or_update vim-ruby vim-ruby
clone_or_update vim-scripts JavaScript-Indent
clone_or_update walm jshint.vim
mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -s -O https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
curl -s -O https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim
