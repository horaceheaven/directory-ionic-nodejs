CODE=
while true; do
  CODE=$(curl -sL -w "%{http_code}" "http://ec2-54-196-235-6.compute-1.amazonaws.com:5000/" -o /dev/null)
  if [ $CODE -eq "200" ]
   then
   pybot robot/test/simple_test_suite.robot
    exit 0
  fi
  sleep 1
done
