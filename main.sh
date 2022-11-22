#!/bin/bash

http --auth-type=veracode_hmac GET "https://api.veracode.com/api/authn/v2/users?enabled=true" > get_users.txt
cat response.json | json_xs | grep -i "user_id" | awk '{ print $3  $5 }'
cat response.json | json_xs | grep -i "user_name" | awk '{ print $3  $5 }'
#cat get_users.txt | grep user_id | awk 'BEGIN { print $1"\nline" $2"\nline" $3"\nline" }'
#awk '{ print $0 }'

#http --auth-type=veracode_hmac GET 
#"https://api.veracode.com/api/authn/v2/users/search?saml=true" > teams.txt
http --auth-type=veracode_hmac GET "https://api.veracode.com/api/authn/v2/teams"

cat teams.txt | grep -i "bu_id" | awk '{ print $1 $2 $3 }'
