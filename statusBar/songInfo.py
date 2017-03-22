import sys

string = sys.argv[1]
album = ""
artist = ""
title = ""

count = 0
cnt = 1
temp = ""

for i in sys.argv:
    if i == "\"xesam:album\"":
        temp = str(sys.argv[count+3])
        while temp[ len(temp) - 1 ] != "\"":
            album = album + temp + " "
            temp = str(sys.argv[count+3+cnt])
            cnt = cnt + 1
        album = album + temp

        cnt = 1
        
    if i == "\"xesam:artist\"":
        temp = str(sys.argv[count+5])
        while temp[ len(temp) - 1 ] != "\"":
            artist = artist + temp + " "
            temp = str(sys.argv[count+5+cnt])
            cnt = cnt + 1
        artist = artist + temp

        cnt = 1

    if i == "\"xesam:title\"":
        temp = str(sys.argv[count+3])
        while temp[ len(temp) - 1 ] != "\"":
            title = title + temp + " "
            temp = str(sys.argv[count+3+cnt])
            cnt = cnt + 1
        title = title + temp

        cnt = 1

    count = count + 1

album = album[1:len(album) - 1]
artist = artist[1:len(artist) - 1]
#title = title[1:len(title) - 1]

if title == "\"\"":
    print ( "Loading Spotify" )
else:
    print ( title + ": " + artist ) #+ ", " + album )
