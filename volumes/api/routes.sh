#!/bin/sh

API_KEY="edd1c9f034335f136f87ad84b625c8f1"
APISIX_ADMIN="http://apisix:9180"

echo "Registering Supabase routes in APISIX..."

register() {
  curl -s -X PUT "$APISIX_ADMIN/apisix/admin/routes/$1" \
    -H "X-API-KEY: $API_KEY" \
    -d "$2"
}

register "auth-v1" '{
  "uri": "/auth/v1/*",
  "upstream": { "type": "roundrobin", "nodes": { "auth:9999": 1 } }
}'

register "rest-v1" '{
  "uri": "/rest/v1/*",
  "upstream": { "type": "roundrobin", "nodes": { "rest:3000": 1 } }
}'

register "storage-v1" '{
  "uri": "/storage/v1/*",
  "upstream": { "type": "roundrobin", "nodes": { "storage:5000": 1 } }
}'

register "functions-v1" '{
  "uri": "/functions/v1/*",
  "upstream": { "type": "roundrobin", "nodes": { "functions:9000": 1 } }
}'

register "realtime-v1" '{
  "uri": "/realtime/v1/*",
  "upstream": { "type": "roundrobin", "nodes": { "realtime-dev.supabase-realtime:4000": 1 } }
}'

register "studio" '{
  "uri": "/*",
  "upstream": { "type": "roundrobin", "nodes": { "studio:3000": 1 } }
}'

