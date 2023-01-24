FROM kylemanna/openvpn


RUN apk add -X https://dl-cdn.alpinelinux.org/alpine/v3.16/main -u alpine-keys
RUN apk update
RUN apk add curl jq bash iperf3 vim net-tools iptables