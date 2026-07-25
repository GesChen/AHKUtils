#Persistent
Menu, Tray, Icon, %A_ScriptDir%\icons\rainmeter.ico

RestartRainmeter()

SetTimer, RestartRainmeter, 600000  ; 10 minutes (600,000 ms)

return

RestartRainmeter() {
    Process, Close, Rainmeter.exe
    Sleep, 2000
    Run, C:\Program Files\Rainmeter\Rainmeter.exe
}