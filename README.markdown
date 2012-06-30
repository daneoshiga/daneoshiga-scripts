I have here some small bash scripts that I've made, or changed from others

conky_startup.sh
-

just a wrapper for conky, to delay it's start on boot (which makes it start
above X)

limitador.sh
-

limit the speed of rtorrent and jdownloader when nobody is using the pc,
uses xprintidle to check if there's any user activity

mplayer
-

implements "bookmarks" on mplayer, if any bookmark is set, the video will
continue from that point when played again

playrar.sh
-

plays video files inside rar files.

mashpodder.sh
-

my fork of mashpodder, the shell script podcast downloader, i've added:
speed limit config for wget
made it download always the older podcast first
consider the number of podcasts already on folder in the limit on
mp.conf, not only for the number of new downloads on that execution.
added the other needed files to mashpodder
mashpodder original repository
http://code.google.com/p/mashpodder/

gpodownload.sh
-

an small script to download videos from specific channels on gpodder

ttytter.txt
-

CLI twitter client made in perl [ttytter](http://www.floodgap.com/software/ttytter/)
