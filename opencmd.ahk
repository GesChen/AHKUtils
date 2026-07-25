#Requires AutoHotkey v2.0

TraySetIcon(A_ScriptDir "\icons\cmd.ico")

^!t::{
    RefreshPath()
    Run '*RunAs "' A_WinDir '\System32\cmd.exe"', A_WinDir "\System32"
}

RefreshPath() {
    machinePath := RegRead(
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment",
        "Path",
        ""
    )

    userPath := RegRead(
        "HKEY_CURRENT_USER\Environment",
        "Path",
        ""
    )

    machinePath := ExpandEnvironmentVariables(machinePath)
    userPath := ExpandEnvironmentVariables(userPath)

    newPath := RTrim(machinePath, ";")

    if userPath != ""
        newPath .= ";" LTrim(userPath, ";")

    EnvSet "Path", newPath
}

ExpandEnvironmentVariables(text) {
    requiredSize := DllCall(
        "ExpandEnvironmentStrings",
        "Str", text,
        "Ptr", 0,
        "UInt", 0,
        "UInt"
    )

    buf := Buffer(requiredSize * 2)

    DllCall(
        "ExpandEnvironmentStrings",
        "Str", text,
        "Ptr", buf,
        "UInt", requiredSize,
        "UInt"
    )

    return StrGet(buf)
}