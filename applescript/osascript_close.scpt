#!/usr/bin/env osascript
on run argv
  set p to item 1 of argv
  tell application p
    quit
  end tell
end run