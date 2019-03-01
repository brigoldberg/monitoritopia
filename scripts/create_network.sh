#!/usr/bin/env bash

docker network create --driver=bridge \
    --ip-range=172.18.0.0/24 \
    --subnet=172.18.0.0/24 \
    --gateway=172.18.0.1 \
    -o "com.docker.network.bridge.host_binding_ipv4"="0.0.0.0" \
    -o "com.docker.network.bridge.enable_ip_masquerade"="true" \
    -o "com.docker.network.bridge.enable_icc"="true" \
    -o "com.docker.network.bridge.name"="monitor_net" \
    -o "com.docker.network.bridge.mtu"="1500" \
    monitor_net
