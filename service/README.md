Helps to create a service for start/close server. Follows these steps:

1) Copy com.user.server.plist file to ~/Library/LaunchAgents
2) Create an alias for ruby and use it in server-test.sh script
3) Start the server, in this case this repo already contains description for starting a server re;ated to starting, closing and cleaning the server
4) For testing if script is working try this command launchctl load path/to/com.user.server.plist

