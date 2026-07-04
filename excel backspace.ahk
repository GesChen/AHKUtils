#IfWinActive ahk_class XLMAIN
    ^Backspace::
        Send ^+{Left}{Backspace}
        return
#IfWinActive
