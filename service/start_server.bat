REM Set up the environment variables for the script
set PATH_TO_RUBY=C:\Ruby24-x64\bin
set RUBY=%PATH_TO_RUBY%\ruby.exe

REM ** settings for accessing the remaining scripts **
set PATH_TO_SCRIPTS=C:\Users\Administrator\Desktop\automate-browser-win
%RUBY% %PATH_TO_SCRIPTS%\service.rb
