Problem Statment

Write a script which accepts HTTP calls to Start, stop and cleanup browsers. Each of the operations should be different methods. Proxy setttings should be configurable. It should also take url as optional parameter. It should be done in ruby.

Above functionality have been exposed as an API, please find below description about these APIs:

1) /start - helps to start a browser, accepts these query params:
			browser -  accepts these browsers: chrome, firefox, safari
			url: url to opened in browser
			hostname: means hostname for proxy configuration
			port: means port for proxy configuration

2) /close - helps to close a specific browser, accepts these query params:
			browser -  accepts these browsers: chrome, firefox, safari

3) /clean - helps to clean the browser, accepts these query params:
			browser -  accepts these browsers: chrome, firefox, safari


Execute rackup -p port_number from the home directory of project for running the server
