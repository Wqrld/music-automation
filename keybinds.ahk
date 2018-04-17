; also contains other stuff for controlling hue lights, just comment this out if you dont need it

WinHTTP := ComObjCreate("WinHTTP.WinHttpRequest.5.1")
lightsOn := 1
bedroom := [1]
livingroom := [1]
curgroup := bedroom

; toggle all lights
^!l::
    WinHTTP.Open("PUT", "http://hueip/api/J0PDsmqx4GUWqdDlY2L-7we/lights/1/state", 0)
    if lightsOn > 0
        bodytext = {"on" : false}
    else
        bodytext = {"on" : true}
    WinHTTP.Send(bodytext)
    lightsOn := 1 - lightsOn
    return

; control-alt-o : all lights off
^!o::
    WinHTTP.Open("PUT", "http://hueip28/api/mIj2J0PDsmqx4GUWqdDlY2L-7we/lights/1/state", 0)
    bodytext = {"on" : false}
    WinHTTP.Send(bodytext)
    lightsOn := 0
    return

^!1::
    curgroup := livingroom
    return
^!2::
    curgroup := bedroom
    return


setlightct(light, newct, ByRef WinHTTP)
{
    WinHTTP.Open("PUT", "http:/hueip/api/EXBemIj2J0PDsmqx4GUWqdDlY2L-7we/lights/" . light . "/state", 0)
    bodytext = {"ct" : %newct%}
    WinHTTP.Send(bodytext)
}
modifylightct(light, amount, ByRef WinHTTP)
{
    WinHTTP.Open("PUT", "http://hueip/api/mIj2J0PDsmqx4GUWqdDlY2L-7we/lights/" . light . "/state", 0)
    bodytext = {"ct_inc" : %amount%, "transitiontime" : 2}
    WinHTTP.Send(bodytext)
}
modifylightbrightness(light, amount, ByRef WinHTTP)
{
    WinHTTP.Open("PUT", "http://hueip/api/Gj2J0PDsmqx4GUWqdDlY2L-7we/lights/" . light . "/state", 0)
    bodytext = {"bri_inc" : %amount%, "transitiontime" : 2}
    WinHTTP.Send(bodytext)
}

^!Up::
    for _, light in curgroup
        modifylightct(light, 43, WinHTTP)
    return

^!Down::
    for _, light in curgroup
        modifylightct(light, -43, WinHTTP)
    return

^!Left::
    for _, light in curgroup
        modifylightbrightness(light, -32, WinHTTP)
    return

^!Right::
    for _, light in curgroup
	
        modifylightbrightness(light, 32, WinHTTP)
    return

^!Space::Send   {Media_Play_Pause}
^!NumpadAdd::Send   {Media_Next}	
^!NumpadSub::Send  {Media_Prev}
^!e::Send  {Launch_Mail}
^!M::Run   D:\Program Files\newpython\python.exe D:/programmeren/cli.py, , hide
^!9::Run   D:\Program Files\newpython\python.exe D:\programmeren\mopdiyvolume/volume.py up, , hide
^!0::Run   D:\Program Files\newpython\python.exe D:\programmeren\mopdiyvolume/volume.py down, , Hide
^!8::Run   D:\Program Files\newpython\python.exe D:\programmeren\mopdiyvolume/volume.py pause, , Hide
; ^!S::Run   D:\Program Files\newpython\python.exe C:/Users/werel/Desktop/programmeren/ssh.py
^!B::Run   D:\Program Files\Git\git-bash.exe --cd-to-home
; {Run "D:\Program Files\newpython\python.exe" C:/Users/werel/Desktop/programmeren/cli.py}
;XButton2::g
	
