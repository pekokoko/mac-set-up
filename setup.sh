#!/bin/bash

################################
# installing Xcode and Homebrew
################################

cat << EOS

    Start set up MacBook.

EOS

# Memorize user pass 
read -sp "Your Password " pass;

function command_exists {
  command -v "$1" > /dev/null;
}

# Install Homebrew
if ! command_exists brew ; then
  echo "----- Homebrew -----"
  xcode-select --install
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  brew update
  brew upgrade --all --cleanup
  brew -v
  brew tap homebrew/cask-cask
fi

# reference
# https://github.com/AkkeyLab/mac-auto-setup/blob/master/setup.sh
# https://qiita.com/suecharo/items/2b0bca00ba2470965d1f

# Install Xcode from Mac App Store using mas
if ! command_exists mas ; then 
  echo "----- Mac App Store apps -----"
  brew install mas 
  mas install 497799835 # Xcode (11.3.1)
  sudo -S xcodebuild -license accept
  echo "----------- END --------------"
fi


###################################
# installing git, zsh, vim and wget
###################################

# Install git
if ! command_exists git ; then
  echo " ------------ git ------------"
  brew install git
  git --version
  echo " ------------ END ------------"
fi

# Install zsh
if ! command_exists zsh ; then
  echo "----- zsh -----"
  brew install zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting colordiff
  which -a zsh
  echo $pass | sudo -S -- sh -c 'echo '/usr/local/bin/zsh' >> /etc/shells'
  chsh -s /usr/local/bin/zsh
  echo " ------------ END ------------"
fi

# Install vim
if ! command_exists vim ; then
  echo " ------------ Vim ------------"
  brew install vim --with-override-system-vi
  echo " ------------ END ------------"
fi


# Install wget
if ! command_exists wget ; then
  echo " ----------- wget ------------"
  brew install wget
  wget --version
  echo " ------------ END ------------"
fi

###################################
# setup dotfiles
###################################

git clone git clone https://github.com/pekokoko/dotfiles.git ~/dotfiles
cp ~/dotfiles/install.sh ~/install.sh
~/install.sh


###################################
# Installing Python
###################################

if ! command_exists pyenv ; then
  echo " ----------- pyenv -----------"
  brew install pyenv
  pyenv install -l
  pyenv install 3.8.2
  pyenv versions
  pyenv grobal 3.8.2
  pyenv rehash
  echo " -------------END ------------"
fi

pip install --upgrade pip setuptools
pip install -r requirements.txt

##################################
# Installing Tex
##################################

if ! command_exists tex ; then
  echo " ------------ TeX ------------"
  brew cask install mactex
  # Tex Live Utility > preference > path -> /Library/TeX/texbin
  version=$(tex -version | grep -oE '2[0-9]{3}' | head -1)
  echo $pass | sudo -S /usr/local/texlive/$version/bin/x86_64-darwin/tlmgr path add
  echo $pass | sudo -S tlmgr update --self --all
  echo $pass | sudo -S tlmgr paper a4
  # JPN Lang settings
  #echo $pass | sudo -S cjk-gs-integrate --link-texmf --force
  #echo $pass | sudo -S mktexlsr
  #echo $pass | sudo -S sudo kanji-config-updmap-sys hiragino-elcapitan-pron
  # Select ==> TeXShop > Preferences > Source > pTeX (ptex2pdf)
  echo " ------------ END ------------"
fi



while true; do
  read -p 'Now install web apps? [Y/n]' Answer
  case $Answer in
    '' | [Yy]* )
      $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/app.sh
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


while true; do
  read -p 'Now install App Store apps? [Y/n]' Answer
  case $Answer in
    '' | [Yy]* )
      $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/appstore.sh
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
