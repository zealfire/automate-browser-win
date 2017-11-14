# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# disabling terminal/file-server access
defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO

# disabling access to main user folder access
chown zealfire ${HOME}/
chmod 700 ${HOME}/

# change permission to preferences folder in test user
chown zealfire /Users/test/Library/Preferences/
chmod 700 /Users/test/Library/Preferences/

# hide dock, may be check if user has admin rights or not
defaults write /Users/test/Library/Preferences/com.apple.dock tilesize -int 1; killall Dock
defaults write /Users/test/Library/Preferences/com.apple.dock autohide-time-modifier -float 20000000000; killall Dock

# finder is disabled
chown zealfire /System/Library/Finder.app/
chmod 700 /System/Library/Finder.app/

# User template is disabled
chown zealfire /System/Library/User\ Template/
chmod 700 /System/Library/User\ Template/

# Menu Extras is disabled
chown zealfire /System/Library/CoreServices/Menu\ Extras/
chmod 700 /System/Library/CoreServices/Menu\ Extras/

# spotlight is hidden
launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

# modifying menu bar
OIFS="$IFS"

menutemp=$(defaults read com.apple.systemuiserver menuExtras)
menutemp2=$(echo $menutemp | sed 's/( //')
menutemp3=$(echo $menutemp2 | sed 's/ )//')

IFS=','
read -a menuitems <<< "$menutemp3"
IFS="$OIFS"

for (( i = 0 ; i < ${#menuitems[@]} ; i++ ))
do
    /usr/libexec/PlistBuddy -c "Delete :menuExtras:$i" /Users/test/Library/Preferences/com.apple.systemuiserver.plist
done

