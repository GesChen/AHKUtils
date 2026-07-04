#Persistent

Menu, Tray, Icon, %A_ScriptDir%\icons\10.ico

Gosub, Notify          
SetTimer, Notify, 600000  ; 10 minutes

return

Notify:
TrayTip, Reminder, 10 minutes passed, 5, 1
return