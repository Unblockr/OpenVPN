FROM kylemanna/openvpn

RUN apk update
RUN apk add curl jq bash iperf3 vim net-tools iptables