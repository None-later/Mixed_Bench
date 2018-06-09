#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/../configs.sh

THREADS=1
WARMUPREQS=10
MAXREQS=100


kill -9 $(cat server.pid)
rm -f server.pid

LD_LIBRARY_PATH=${TAIL_ROOT}/sphinx/sphinx-install/lib:${LD_LIBRARY_PATH} \
TBENCH_SERVER_PORT=10004 TBENCH_MAXREQS=${MAXREQS} TBENCH_WARMUPREQS=${WARMUPREQS} \
    nohup ${TAIL_ROOT}/sphinx/decoder_server_networked -t $THREADS >server.log 2>&1 &

while [ 1 ]
do
    netstat -nlp | grep 10004
    if [ $? == 0 ]
      then
          echo start ok
          break
      else
          echo -e '#\c'
    fi
done