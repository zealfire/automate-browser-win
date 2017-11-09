#/bin/bash
username=$(whoami)
# we need to create this file before actually running this script
# To create this file follow these steps:
# * Enable automate login from UI
# * The above step creates kcpassword file in /etc location
# * copy the above created file to a location of your choice, this location you have to use in file_name variable
file_name='/Users/zealfire/Documents/kcpassword'
if [ -e "$file_name" ]
then
    sudo cp -r $file_name /etc/
	sudo defaults write /Library/Preferences/com.apple.loginwindow autoLoginUser $username
fi
exit 0