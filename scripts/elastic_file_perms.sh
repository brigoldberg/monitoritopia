#!/usr/bin/env bash

if [ ! -d ../docker_vol/elasticsearch/data ]; then
    mkdir ../docker_vol/elasticsearch/data
fi

chmod 777 ../docker_vol/elasticsearch/data
