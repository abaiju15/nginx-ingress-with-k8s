FROM alpine:3.10

ADD https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl /usr/local/bin/kubectl
ADD get-all-ips.sh /
ADD startup.sh /

RUN \
  apk update && \
  apk add curl && \
  apk add jq && \
  chmod +x /get-all-ips.sh && \
  chmod +x /usr/local/bin/kubectl && \
  chmod +x /get-all-ips.sh && \
  chmod +x /startup.sh

EXPOSE 8001
ENTRYPOINT ["/usr/local/bin/kubectl", "proxy"]