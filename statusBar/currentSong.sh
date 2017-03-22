#!/bin/sh

getSong() {
	SONG_INFO=($(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'))
}

getSong

if [ $? -ne 0 ]; then
	echo -e "Nothing Playing";
else
	python ~/scripts/statusBar/songInfo.py ${SONG_INFO[*]};
fi
