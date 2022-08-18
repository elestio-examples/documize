#set env vars
set -o allexport; source .env; set +o allexport;

echo "Waiting for Documize ot be ready"
sleep 10s;

META=$(curl -s http://$app_target |  grep -P -i "dbhash" | sed -e 's/^[[:space:]]*//')
DBHASH=$(echo $META | sed 's/<meta property="dbhash" content="//g' | sed "s/\" \/>//g")

app_target=$(docker-compose port app 5001)
curl --output /dev/null --header "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" \
 --request POST --data-raw 'dbname=documize&dbhash='"$DBHASH"'&title=Documize&message=Documize+Community+instance+contains+all+our+documentation&allowAnonymousAccess=false&firstname=admin&lastname=admin&email='"$ADMIN_EMAIL"'&password='"$ADMIN_PASSWORD"'&activationKey=&edition=Community' \
 http://$app_target/api/setup

