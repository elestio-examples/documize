#set env vars
set -o allexport; source .env; set +o allexport;

sleep 10s;

app_target=$(docker-compose port app 5001)
curl --output /dev/null --header "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" \
 --request POST --data-raw 'dbname=documize&dbhash=61385e89a7&title=Documize&message=Documize+Community+instance+contains+all+our+documentation&allowAnonymousAccess=false&firstname=admin&lastname=admin&email='"$ADMIN_EMAIL"'&password='"$ADMIN_PASSWORD"'&activationKey=&edition=Community' \
 http://$app_target/api/setup

