#NoEnv
#SingleInstance Force
SendMode Input
SetWorkingDir %A_ScriptDir%

Menu, Tray, Icon, %A_ScriptDir%\icons\holdw.ico


hold := false

; --- SCROLL LOCK (PASSTHROUGH, DO NOT CAPTURE) ---
~ScrollLock::
    if (A_PriorHotkey = "~ScrollLock" && A_TimeSincePriorHotkey < 200)
        return
    hold := !hold
    if (!hold) {
        Send, {w up}
    }
return

; --- W KEY LOGIC ---
~w::
    hold := false
return

~w up::
    if (hold) {
        Sleep, 10
        Send, {w down}
    }
return

; --- CLEAN EXIT ---
ExitScript:
    if (hold) {
        Send, {w up}
    }
    ExitApp
return