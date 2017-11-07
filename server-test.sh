#!/bin/bash

function shutdown()
{
  echo `date` " " `whoami` " Received a signal to shutdown"
	whoami >> /tmp/MyLaunchdTest.out

  # INSERT HERE THE COMMAND YOU WANT EXECUTE AT SHUTDOWN
  kill $(ps -ef | grep 8003 | grep -v  grep |awk '{print $2}')

  exit 0
}

function startup()
{
  # Replace path to ruby alias and server.rb as per your environment
  date >> /tmp/MyLaunchdTest.out
  /Users/USERNAME/.rvm/wrappers/test_alias/ruby /Users/USERNAME/Documents/greedy/automate-browser/service.rb

  # INSERT HERE THE COMMAND YOU WANT EXECUTE AT STARTUP

  tail -f /dev/null &
  wait $!
}

trap shutdown SIGTERM
trap shutdown SIGKILL

startup;
