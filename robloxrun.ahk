#NoEnv
#SingleInstance Force

persistentMove := false
persistentSprint := false

/::
if !GetKeyState("w", "P")
    return

persistentMove := true
persistentSprint := GetKeyState("Shift", "P")

Send, {w down}
if (persistentSprint)
    Send, {Shift down}
return

Esc::
$w::
if (persistentMove) {
    Send, {w up}
    persistentMove := false
}
if (persistentSprint) {
    Send, {Shift up}
    persistentSprint := false
}
return