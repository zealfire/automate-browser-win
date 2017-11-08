#!/bin/bash

function shutdown()
{
  echo `date` " " `whoami` " Received a signal to shutdown"
	whoami >> /tmp/MyLaunchdTest.out
  kill $(ps -ef | grep 8003 | grep -v  grep |awk '{print $2}')
  exit 0
}

function startup()
{
  # Replace path to ruby alias as per your environment
  date >> /tmp/MyLaunchdTest.out
  /Users/zealfire/.rvm/wrappers/test_alias/ruby service.rb
  tail -f /dev/null &
  wait $!
}

trap shutdown SIGTERM
trap shutdown SIGKILL

startup;
