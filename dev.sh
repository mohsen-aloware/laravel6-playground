#!/usr/bin/env bash

# Developed by Mohsen Akhlaghi [https://github.com/madagon]

CUR_DIR=$(pwd)

cd docker/dev

if [[ "$1" == 'bash' ]]; then
  if [[ "$2" != '' ]]; then
    {
      docker-compose -p l6_playground exec $2 bash
    } || {
      echo -e "\033[33m$2 doesn't support 'bash'. Trying 'sh' instead...\033[0m"
      docker-compose -p l6_playground exec $2 sh
    }
  else
    docker-compose -p l6_playground exec php bash
  fi

elif [[ "$1" == 'exec' ]]; then
  shift
  docker-compose -p l6_playground exec php $@

elif [[ "$1" == 'up' ]]; then
  shift
  docker-compose -p l6_playground up -d $@

elif [[ "$1" == 'down' ]]; then
  docker-compose -p l6_playground down

elif [[ "$1" == 'ps' ]]; then
  docker-compose -p l6_playground ps

elif [[ "$1" == 'restart' ]]; then
  docker-compose -p l6_playground restart $2

elif [[ "$1" == 'logs' ]]; then
  docker-compose -p l6_playground logs -f --tail=100 $2

fi

cd $CUR_DIR
