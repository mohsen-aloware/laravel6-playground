#!/usr/bin/env bash

cd docker/dev

if [[ "$1" == 'bash' ]]; then
docker-compose -p playground exec php bash

elif [[ "$1" == 'exec' ]]; then
shift;
docker-compose -p playground exec php $@

elif [[ "$1" == 'up' ]]; then
shift;
docker-compose -p playground up -d $@

elif [[ "$1" == 'down' ]]; then
docker-compose -p playground down

elif [[ "$1" == 'ps' ]]; then
docker-compose -p playground ps

elif [[ "$1" == 'restart' ]]; then
docker-compose -p playground restart

elif [[ "$1" == 'logs' ]]; then
docker-compose -p playground logs -f --tail=100 php

fi

cd ../../
