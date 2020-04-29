#!/bin/bash
cat << EOS
 Download apps from App Store
EOS

#
# Mac App Store apps install
#
echo " ---- Mac App Store apps -----"
brew install mas
mas install 409183694  # Keynote (6.6.2)
mas install 409201541  # Pages (5.6.2)
mas install 409203825  # Numbers (3.6.2)
mas install 1024640650 # CotEditor (3.1.2)
mas install 1333542190 # 1Password 7 (7.2.2)
mas install 975974524  # RapidCopy (291.3.0)
echo " ------------ END ------------"