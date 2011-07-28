#!/bin/bash
BASENAME=`basename "$1"`
SAVEFILE="$HOME/.mplayer/continue/$BASENAME"
LASTPOS=$(tail -n 1 "$SAVEFILE")

if [[ -z $LASTPOS ]]; then
    LASTPOS=0
fi

mplayer "$1" ${*:2} -ss $LASTPOS | \
    grep 'ANS_TIME_POSITION' | \
    cut -d"=" -f2 > "$SAVEFILE"

LASTPOS=$(tail -n 1 "$SAVEFILE")
if [[ -z $LASTPOS ]]; then
    rm "$SAVEFILE" 
fi


