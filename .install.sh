#! /bin/sh

###########
#
#    First, download & install XCode Dev Tools — https://developer.apple.com/downloads/
#
###########

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# borrowed from https://github.com/thoughtbot/laptop
append_to_zshrc() {
  local text="$1" zshrc
  local skip_new_line="${2:-0}"

  if [ -w "$HOME/.zshrc.local" ]; then
    zshrc="$HOME/.zshrc.local"
  else
    zshrc="$HOME/.zshrc"
  fi

  if ! grep -Fqs "$text" "$zshrc"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\n" "$text" >> "$zshrc"
    else
      printf "\n%s\n" "$text" >> "$zshrc"
    fi
  fi
}

echo "Checking for Homebrew..."
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Setting brew permissions..."
chown -R $USER /usr/local/include
chown -R $USER /usr/local/lib/pkgconfig

# Inspired by http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac

echo "Updating brew..."
brew update

echo "Installing GNU core utils (those that come with OS X are outdated)..."
brew install coreutils

echo "Installing more recent versions of some OS X tools..."
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# TODO add utils to zsh path

binaries=(
  ack
  autojump
  cairo
  curl
  casperjs
  ffmpeg
  git
  git-extras
  grep
  imagemagick --with-webp
  mackup
  node
  postgresql
  pkg-config
  redis
  rhino
  tree
  tmux
  unrar
  wget
  youtube-dl
  zopfli
  zsh
)

echo "Installing binaries..."
brew install ${binaries[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing Cask..."
brew install caskroom/cask/brew-cask

echo "Adding nightly/beta Cask versions..."
brew tap caskroom/versions

# Apps
apps=(

  # work
  rowanj-gitx
  iterm2
  sublime-text3
  virtualbox

  # productivity, core, runtimes
  caffeine
  quicksilver
  nvalt
  appcleaner
  # osxfuse
  # 1password
  # spectacle
  flash
  quicklook-json
  # macpar-deluxe
  # imageoptim
  grandperspective
  istat-menus
  qlvideo # to display video files in finder and quick look

  # sharing
  # dropbox
  google-drive

  # browsers
  google-chrome
  # firefox-nightly
  # webkit-nightly

  # communication
  slack
  skype

  # entertainment
  vlc
  pandora

  # file sharing
  utorrent # needs further installation
)

echo "Installing apps to /Applications..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask cleanup

echo "Installing neovim"

brew install neovim/neovim/neovim

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Customizing oh-my-zsh..."
wget https://raw.githubusercontent.com/wunderg/dotfiles/master/.zshrc && mv .zshrc ~/

echo "Customizing tmux"
wget https://raw.githubusercontent.com/wunderg/dotfiles/master/.tmux.conf && mv .tmux.conf ~/

echo "Customizing Vim"
wget https://raw.githubusercontent.com/wunderg/dotfiles/master/.vimrc && mv .vimrc ~/

echo "Making autojump work with zsh..."
append_to_zshrc '[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh'

echo "Generating SSH keys (https://help.github.com/articles/generating-ssh-keys)..."
ssh-keygen -t rsa -C "oleg.umarov@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
open https://github.com/settings/ssh

echo "Customizing OSX..."
wget -qO- https://raw.githubusercontent.com/wunderg/dotfiles/master/.install.sh | bash

echo "Installing translit..."
wget http://www.math.tamu.edu/~comech/tools/russian-translit-keyboard-layout-mac-os-x/russian-translit.keylayout && mv russian-translit.keylayout ~/Library/Keyboard\ Layouts/

echo "Installing nvm..."
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash

echo "Installing global node packages..."
node_packages=(
  bower
  browserify
  caniuse-cmd
  grunt
  gulp
  htmlhint
  imageoptim-cli
  mocha
  eslint_d
  jscs
  webpack
  watchify
)
npm install -g ${node_packages[@]}

echo 'Getting Vundle'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo 'Installing plugins'
vim +PluginInstall +qall

echo 'Installing cmake for YCM'
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
