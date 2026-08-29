# Web Imports
import requests
from bs4 import BeautifulSoup

# Functional Imports
import json


PLAYLIST_CONTENT_START = "<script type=\"application/json\" id=\"serialized-server-data\">"
PLAYLIST_CONTENT_END = "</script>"

songs = []
art = ()


# Script Functions

def getSongData(dataList):
    for song in dataList:
        songTitle = song["title"]
        songArtist = song["artistName"]
        songAlbum = song["tertiaryLinks"][0]["title"]
        songDuration = song["duration"]
        songData = {"title":songTitle, "artist":songArtist, "album":songAlbum, "duration":songDuration}
        
        artURL = song["artwork"]["dictionary"]["url"]
        
        songs.append(songData)

def printSongData():
    for song in songs:
        durSec = int(song["duration"]) // 1000 # 1000ms/sec
        mins = durSec // 60
        secs = durSec % 60
        
        print(f"Title: {song["title"]}\n   Artist: {song["artist"]}\n   Album: {song["album"]}\n   Duration: {mins}:{secs:02}\n")


url = input("Enter Apple Music Playlist URL: ")
response = requests.get(url)

if response.status_code == 200:
    #resContent = response.text

    #soupObj = BeautifulSoup(response.content, 'html.parser')
    
    #beautifiedText = soupObj.get_text("\n", True)
    
    #print(beautifiedText)
    
    jsonData = (response.text).split(PLAYLIST_CONTENT_START)[1].split(PLAYLIST_CONTENT_END)[0]
    # with open("playlistDat.json", "w", encoding="utf-8") as f:
        # f.write(jsonData)
        
    dat = json.loads(jsonData)
    
    songDataList = dat["data"][0]["data"]["sections"][1]["items"]
    getSongData(songDataList)
    
    # for song in songs:
    #     print(song, sep='\n')
    
    printSongData()
else:
    print(f"failed to get content with error: {response.status_code}")