#!/bin/bash

##amazon drive??
cat << EOS
 Installing web apps.
EOS

#
# Install web apps.
#
echo " ----- Install web apps ------"
brew cask install alfred

brew cask install cheatsheet
brew cask install dropbox
brew cask install google-chrome
brew cask install iterm2
brew cask install google-japanese-ime
brew cask install visual-studio-code
brew cask install docker
Brew cask install deepl
brew cask install adobe-creative-cloud
brew cask install sourcetree
brew cask install thunderbird

while true; do
  read -p 'Add "need license" apps? [Y/n]' Answer
  case $Answer in
    '' | [Yy]* )
      brew cask install microsoft-office
      break;
      ;;
    [Nn]* )
      echo "Skip install"
      break;
      ;;
    * )
      echo Please answer YES or NO.
  esac
done;

echo " ------------ END ------------"
