# Trufflehog-dojo
Trufflehog DefectDojo

# Usage
-Run Docker image
```
docker run -e DOJOKEY='<api_key>' \
-e DOJOIP='<ip:port>' \
-e EGID='<Engagement_ID>' --rm -v "$(pwd):/proj" cyberkru/trufflehog-dojo
```
