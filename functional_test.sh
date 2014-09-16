echo "Waiting for application server on $1..."

echo "REMOTE_URL: $1"
echo "DESIRED_CAPABILITIES: $2"

CODE=
while true; do
  CODE=$(curl -sL -w "%{http_code}" "$1" -o /dev/null)
  if [ $CODE -eq "200" ]
    then
      echo "Start robot tests"
      pybot -v $1 -v $2 $3
      echo "Finish robot tests"
    exit 0
  fi
  sleep 1
done
