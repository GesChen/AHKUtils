#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode "Input"
TraySetIcon(A_ScriptDir "\icons\coolwindow.ico")

margin := 40

#f::
{
    hwnd := WinExist("A")

    Send "#d"
    Sleep 50

    WinRestore("ahk_id " hwnd)
    WinSetStyle("-0x01000000", "ahk_id " hwnd)

    WinActivate("ahk_id " hwnd)
    Sleep 30

    monitor := MonitorGetFromWindow(hwnd)
    MonitorGetWorkArea(monitor, &left, &top, &right, &bottom)

    newX := left + margin
    newY := top + margin
    newW := (right - left) - (margin * 2)
    newH := (bottom - top) - (margin * 2)

    WinMove(newX, newY, newW, newH, "ahk_id " hwnd)
}

MonitorGetFromWindow(hwnd)
{
    WinGetPos(&wx, &wy, &ww, &wh, "ahk_id " hwnd)

    cx := wx + ww / 2
    cy := wy + wh / 2

    count := MonitorGetCount()

    Loop count {
        MonitorGet(A_Index, &l, &t, &r, &b)
        if (cx >= l && cx <= r && cy >= t && cy <= b)
            return A_Index
    }

    return MonitorGetPrimary()
}