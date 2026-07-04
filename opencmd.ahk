#Requires AutoHotkey v2.0

TraySetIcon(A_ScriptDir "\icons\cmd.ico")

^!t::{
    Run '*RunAs "C:\Windows\System32\cmd.exe"'
}