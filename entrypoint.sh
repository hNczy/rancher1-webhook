#!/bin/sh -l

if [ $# -lt 5 ]; then
    echo "Usage: $0 <host> <projectId> <key> <image> <tag>"
    exit 1
fi

host=$1
projectId=$2
key=$3
image=$4
tag=$5

http_status_code=$(curl \
  --silent \
  --output /dev/null \
  --write-out '%{http_code}' \
  --location "$host/v1-webhooks/endpoint?key=$key&projectId=$projectId" \
  --header 'Content-Type: application/json' \
  --header 'Cookie: PL=rancher' \
  --data '{
    "push_data": {
        "tag": "'"$tag"'"
    },
    "repository": {
        "repo_name": "'"$image"'"
    }
}')

status=$?

if [ $status -eq 0 ]; then
    echo "curl was successful."
    if expr "${http_status_code}" : '[45]..$' 1>/dev/null; then
        echo "Webhook failed with status code ${http_status_code}."
    else
        echo "Webhook was triggered successfully."
    fi
else
    echo "curl failed with status code $status."
fi
