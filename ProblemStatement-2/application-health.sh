#!/bin/bash

URL="http://example.com"
STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)

if [ "$STATUS_CODE" -eq 200 ]; then
  echo "Application is UP (HTTP $STATUS_CODE)"
else
  echo "Application is DOWN (HTTP $STATUS_CODE)"
fi
