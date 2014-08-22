CODE=
while true; do
  CODE=$(curl -sL -w "%{http_code}" "http://localhost:5000/" -o /dev/null)
  if [ $CODE -eq "200" ]
    then exit 0
  fi
  sleep 1
done
