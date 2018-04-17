
# -*- coding: utf-8 -*

import sys
updown = sys.argv[1]
from mpd import MPDClient
client = MPDClient()               # create client object
#client.timeout = 10                # network timeout in seconds (floats allowed), default: None
#client.idletimeout = None          # timeout for fetching the result of the idle command is handled seperately, default: None
client.connect("raspberry.local", 6600)  # connect to localhost:6600
#print(client.mpd_version)          # print the MPD version
#print(client.find("any", "house")) # print result of the command "find any house"
#s = client.find("any", "house")
#[x.encode('utf-8') for x in s]
#a = ''.join(s)
if updown == "pause":
  client.pause()
if updown == "up":
 # print(client.status().get("volume"))
 # print(type(client.status().get("volume", "d")))
  client.setvol(str(int(client.status().get("volume")) + 30))
if updown == "down":
  #print(client.status().get("volume"))
 # print(type(client.status().get("volume", "d")))
  client.setvol(str(int(client.status().get("volume")) - 30))  
  
  
client.close()                     # send the close command
client.disconnect()  
