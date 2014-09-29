echo "Waiting for application server on $3..."

echo "REMOTE_URL: $4"
echo "DESIRED_CAPABILITIES: '$5'"

CODE=
while true; do
  CODE=$(curl -sL -w "%{http_code}" "$3" -o /dev/null)
  if [ $CODE -eq "200" ]
    then
      echo "Start robot tests"
      pybot -v "$1" -v "$2" -v "$4" -v "$5" "$6"
      echo "Finish robot tests"
    exit 0
  fi
  sleep 1
done
