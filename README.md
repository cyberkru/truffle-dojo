# Trufflehog-dojo
Trufflehog DefectDojo

# Usage
-Run Docker image
```
docker run -e DOJOKEY='<api_key>' \
-e DOJOURL='<dojo_url>' \
-e PRODNAME='<Product_name>' --rm -v "$(pwd):/proj" cyberkru/trufflehog-dojo
```
