#!/bin/bash
RARFILE=$1
DIRNAME=`dirname "$1"`
TMPDIR="/tmp/playrar/"
RARFS="/usr/local/bin/rarfs"
if [ ! -d /tmp/playrar ]; then
mkdir -p /tmp/playrar
fi
$RARFS "$RARFILE" "$TMPDIR"
find $TMPDIR -type f -exec mplayer '{}' ${*:2} -sub "$DIRNAME/*.srt" \;
fusermount -u $TMPDIR
