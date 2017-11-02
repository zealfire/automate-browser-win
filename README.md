Problem Statment

Write a script which accepts HTTP calls to Start, stop and cleanup browsers. Each of the operations should be different methods. Proxy setttings should be configurable. It should also take url as optional parameter. It should be done in ruby.


Description about arguments accepted by script

1) -u this means URL which need to be opened in browser
2) -h this means host for proxy configuration
3) -p this means port for proxy configuration
4) -b this means browser in which URL needs to opened

You have to tell script what it should do by passing these paramters: start, close, clean
Sample command: ruby browser.rb start -b chrome -u link_to_url, this will open the url in chrome browser