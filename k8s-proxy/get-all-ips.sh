#!/bin/sh

while true
do
  curl -s "localhost:8001/api/v1/namespaces/default/pods" | jq -c --arg app $APP_NAME '.items | .[] | .status | {containerStatuses,podIP} | {"ip":.podIP, "name":.containerStatuses[].name, "state":.containerStatuses[].state, "ready":.containerStatuses[].ready, "image":.containerStatuses[].image} | select(.name == $app)' | paste -d, -s | awk '{print "{\"items\": ["$0"]}"}' | jq > /html/index.html
  sleep 5
done
