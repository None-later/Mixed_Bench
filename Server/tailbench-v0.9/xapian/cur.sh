#!/bin/bash

#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source /home/fanfanda/tailbench-v0.9/configs.sh

NSERVERS=1
QPS=500
WARMUPREQS=1000
REQUESTS=3000
TBENCH_SERVER_PORT=10000 \
TBENCH_SERVER=hw114 TBENCH_RANDSEED=${RANDOM} TBENCH_MAXREQS=${REQUESTS} TBENCH_WARMUPREQS=${WARMUPREQS} \
    chrt -r 99 ./xapian_networked_server -n ${NSERVERS} -d ${DATA_ROOT}/xapian/wiki \
    -r 1000000000 &
echo $! > server.pid

