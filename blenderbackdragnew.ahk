#Requires AutoHotkey v1.1+
#SingleInstance Force
#InstallMouseHook

Menu, Tray, Icon, %A_ScriptDir%\icons\drag.ico

; =========================
; Blender
; Back / Forward -> Middle Mouse Hold
; Shift + either -> Shift + Middle Mouse Hold
; =========================
#IfWinActive ahk_exe blender.exe

*XButton1::
    SendInput {Blind}{MButton Down}
return

*XButton1 Up::
    SendInput {Blind}{MButton Up}
return

*XButton2::
    SendInput {Blind}{MButton Down}
return

*XButton2 Up::
    SendInput {Blind}{MButton Up}
return

#IfWinActive


; =========================
; Unity Editor
; Back    -> Alt + Left Drag
; Forward -> Middle Mouse Hold
; Shift + Forward stays Shift + Middle
; =========================
#IfWinActive ahk_exe Unity.exe

*XButton1::
    SendInput {Blind}{Alt Down}{LButton Down}
return

*XButton1 Up::
    SendInput {Blind}{LButton Up}{Alt Up}
return

*XButton2::
    SendInput {Blind}{MButton Down}
return

*XButton2 Up::
    SendInput {Blind}{MButton Up}
return

#IfWinActive