Menu, Tray, Icon, %A_ScriptDir%\icons\funny.ico

~Shift::
    SetCapsLockState, Off
return

^+CapsLock::
    SetCapsLockState, On
return

Capslock::
    if GetKeyState("CapsLock", "T")
        SetCapsLockState, Off
return

^Capslock:: return
!Capslock:: return
+CapsLock:: return