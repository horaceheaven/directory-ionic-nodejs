CODE=
while true; do
  CODE=$(curl -sL -w "%{http_code}" "http://127.0.0.1:5000/" -o /dev/null)
  if [ $CODE -eq "200" ] 
   then 
   pybot --variable BROWSER:phantomjs robot/test/simple_test_suite.robot
    exit 0
  fi
  sleep 1
done

