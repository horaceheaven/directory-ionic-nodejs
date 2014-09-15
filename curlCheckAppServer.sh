echo "Waiting for application server on $1..."

CODE=

while true; do
  CODE=$(curl -sL -w "%{http_code}" "$1" -o /dev/null)
  if [ $CODE -eq "200" ]
    then
      pybot -v $2 -v $3 robot/test/simple_test_suite.robot
    exit 0
  fi
  sleep 1
done
