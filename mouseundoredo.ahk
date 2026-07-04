#NoEnv
#Persistent
#InstallKeybdHook
#UseHook

Menu, Tray, Icon, %A_ScriptDir%\icons\ctrlundo.ico

; Ctrl + Mouse Back → Ctrl+Z
^XButton1::
    Send ^z
    Return

; Ctrl + Mouse Forward → Ctrl+Y
^XButton2::
    Send ^y
    Send ^+z
    Return