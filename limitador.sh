#!/bin/sh
sleep 20
if pidof -x $(basename $0) > /dev/null; then
    for p in $(pidof -x $(basename $0)); do
        if [ $p -ne $$ ]; then
            exit
        fi
    done
fi

while [ -z "$(pidof rtorrent)" ];
do
   sleep 1
done

FLAG=1
LIMIT=200000
while [ 1 ];
do
    IDLE=$(xprintidle)
    if [ $IDLE -lt $LIMIT ] && [ $FLAG = 1 ]
    then
        screen -S torrent -X stuff CCSSxx
        curl -s "http://localhost:10025/action/set/download/limit/10" > /dev/null
        FLAG=0
    elif [ $IDLE -gt $LIMIT ] && [ $FLAG = 0 ]
    then
        screen -S torrent -X stuff CDss
        curl -s "http://localhost:10025/action/set/download/limit/50" > /dev/null
        FLAG=1
    fi
    sleep 1
done
