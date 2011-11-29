#!/bin/sh

##    Copyright (C) 2011 - Danilo Shiga <daniloshiga@gmail.com>
##    
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <http://www.gnu.org/licenses/>.#
##
##


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
        screen -S torrent -p 0 -X stuff CCSSxx
        curl -s "http://localhost:10025/action/set/download/limit/10" > /dev/null
        FLAG=0
    elif [ $IDLE -gt $LIMIT ] && [ $FLAG = 0 ]
    then
        screen -S torrent -p 0 -X stuff CDss
        curl -s "http://localhost:10025/action/set/download/limit/50" > /dev/null
        FLAG=1
    fi
    sleep 1
done
