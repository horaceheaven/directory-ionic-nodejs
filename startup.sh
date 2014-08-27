#! /usr/bin/env bash
cd /src
forever start server.js
CODE=
while true; do
  CODE=$(curl -sL -w "%{http_code}" "http://127.0.0.1:5000" -o /dev/null)
  if [ $CODE -eq 200 ]
   then
   pybot --variable BROWSER:phantomjs /src/robot/test/simple_test_suite.robot
   echo $CODE 
   exit 0
  fi
  echo $CODE
  sleep 1
done

