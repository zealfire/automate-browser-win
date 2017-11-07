#!/usr/bin/env osascript
on run argv
  set p to item 1 of argv
  if p is "safari"
	  tell application "Safari"
	    set miniaturized of every window to true
	  end tell
  else if p is "firefox"
  	tell application "Firefox"
	    set miniaturized of every window to true
	end tell
  else if p is "chrome"
  	tell application "Google Chrome"
	    set minimized of every window to true
	end tell
  else if p is "opera"
  	tell application "Opera"
	    set miniaturized of every window to true
	end tell
  end if
end run