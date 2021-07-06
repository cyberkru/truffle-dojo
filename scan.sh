#!/bin/bash

echo "DojoIP: $DOJOIP"

echo "Trufflehog scanning..."
trufflehog --json --regex --entropy=False file:///proj > trufflehog-report.json
printf "\nDone\n"

echo "Sending to Dojo..."
curl -X POST --header "Content-Type:multipart/form-data" --header "Authorization:Token $DOJOKEY" -F "engagement=${EGID}" -F "scan_type=Trufflehog Scan" -F 'file=@./trufflehog-report.json' --url "http://${DOJOIP}/api/v2/import-scan/"
printf "\nDone\n"
