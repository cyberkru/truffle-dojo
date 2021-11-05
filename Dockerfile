FROM alpine:3.14

WORKDIR /proj

RUN apk update && apk add --no-cache git bash curl jq py-pip && pip install gitdb2==3.0.0 trufflehog

COPY scan.sh /home/truffle/

RUN chmod +x /home/truffle/scan.sh

CMD  bash /home/truffle/scan.sh
