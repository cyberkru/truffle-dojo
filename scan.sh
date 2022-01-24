#!/bin/bash

echo "DojoURL: $DOJOURL"

echo "Trufflehog scanning..."
trufflehog --json --regex --entropy=False file:///proj > trufflehog-report.json
printf "\nDone\n"

echo "Sending to Dojo..."
PRODID=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Token ${DOJOKEY}" --url "${DOJOURL}/api/v2/products/?limit=1000" | jq -c '[.results[] | select(.name | contains('\"${PRODNAME}\"'))][0] | .id')
EGID=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Token $DOJOKEY" --url "${DOJOURL}/api/v2/engagements/?limit=1000" | jq -c "[.results[] | select(.product == ${PRODID})][0] | .id")
curl -X POST --header "Content-Type:multipart/form-data" --header "Authorization:Token $DOJOKEY" -F "engagement=${EGID}" -F "close_old_findings=true" -F "scan_type=Trufflehog Scan" -F 'file=@./trufflehog-report.json' --url "${DOJOURL}/api/v2/import-scan/"

printf "\nDone\n"
