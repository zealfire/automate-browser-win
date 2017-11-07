set username to do shell script "whoami"
set uid to do shell script "id | cut -d' ' -f1  | cut -d'=' -f2 | cut -d'(' -f1"

do shell script "/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow autoLoginUser " & username with administrator privileges
do shell script "/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow autoLoginUserUID " & uid with administrator privileges
display dialog "User " & username & " is now the default Auto Login."