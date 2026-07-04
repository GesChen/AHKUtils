#Requires AutoHotkey v1.1+
#SingleInstance Force
#InstallMouseHook

Menu, Tray, Icon, %A_ScriptDir%\icons\drag.ico

; =========================
; Blender
; Back    -> Middle Mouse Orbit
; Forward -> Shift + Middle Drag Pan
; =========================
#IfWinActive ahk_exe blender.exe

; Back mouse button = orbit
*XButton1::
    SendInput {MButton Down}
return

*XButton1 Up::
    SendInput {MButton Up}
return

; Forward mouse button = pan
*XButton2::
    SendInput {Shift Down}{MButton Down}
return

*XButton2 Up::
    SendInput {MButton Up}{Shift Up}
return

#IfWinActive


; =========================
; Unity Editor
; Back    -> Alt + Left Drag
; Forward -> Middle Mouse Hold
; =========================
#IfWinActive ahk_exe Unity.exe

; Back mouse button = Alt + Left Drag
*XButton1::
    SendInput {Alt Down}{LButton Down}
return

*XButton1 Up::
    SendInput {LButton Up}{Alt Up}
return

; Forward mouse button = Middle Mouse Hold
*XButton2::
    SendInput {MButton Down}
return

*XButton2 Up::
    SendInput {MButton Up}
return

#IfWinActive