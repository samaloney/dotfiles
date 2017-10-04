#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`
brew install gnu-sed

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

brew install bashdb
brew install git
brew install graphviz
brew install pyenv
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper
brew install sqlite
brew install tree
brew install vim
brew install wget
brew install grep
brew install openssh
brew install netpbm
brew install nmap
brew install socat
brew install xz
brew install p7zip
brew install ack
brew install ssh-copy-id


# Cask to install Applications
brew cask install docker
brew cask install firefox             
brew cask install hammerspoon         
brew cask install mactex              
brew cask install riot                
brew cask install slack               
brew cask install sublime-text        
brew cask install virtualbox
brew cask install cyberduck           
brew cask install dropbox             
brew cask install google-chrome       
brew cask install iterm2              
brew cask install papers              
brew cask install skype               
brew cask install spotify             
brew cask install transmission        
brew cask install vlc

# Remove outdated versions from the cellar.
brew cleanup