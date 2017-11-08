#/bin/bash
username=`whoami`
sudo defaults write /Library/Preferences/com.apple.loginwindow autoLoginUser $username
exit 0