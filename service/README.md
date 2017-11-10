Helps to create a service for start/close server. Follows these steps:

1) Copy service to home directory of project in which server needs to be started
2) Now we need to follow below steps in order to run the batch file(start_server.bat) at run time
	* Create a shortcut to the batch file.
	* Once the shortcut has been created, right-click the file and select Cut.
	* Press the Start button and type Run and press enter.
	* In the Run window, type shell:startup to open the Startup folder.
	* Once the Startup folder has been opened, click the Home tab at the top of the folder and select Paste to paste the shortcut into the folder.
