#!/bin/bash

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
