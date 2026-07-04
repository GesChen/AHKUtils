; https://www.reddit.com/r/AutoHotkey/comments/rog13v/dimming_the_screen_as_a_makeshift_screensaver/hq96cky/       (PART A)
; ##  Autoexecution  ##
#Persistent
#SingleInstance Force
SetBatchLines -1
OnExit EOF
SetTimer tDim,250
vBrt:=128  ;Initial Brightness (Don't change!)

; ####  Play Area  ####
vDur:=5  ;Number of minutes to wait before dimming
vMin:=32    ;Minimum dimness level (0-127) - lower = darker. Windows allows down to around 32 as the minimum brightness.
dRng:=4    ;Dimming frame skip (lower/slower)
dDly:=15   ;Number of ms between dimming frames
uRng:=8    ;Lighting frame skip (lower/slower)
uDly:=15   ;Number of ms between lighting frames (0/Instant)

; ####  Main Code  ####
tDim:
  If (A_TimeIdlePhysical>(vDur*60000)) && !fChk{
    If fU{
      SetTimer tU,Off
      fU:=0
    }
    SetTimer tD,% dDly
    fD:=1,fChk:=1
  }Else If (A_TimeIdlePhysical<200) && fChk{
    If fD{
      SetTimer tD,Off
      fD:=0
    }
    If !uDly
      DisplaySetBrightness(vBrt:=128)
    Else{
      SetTimer tU,% uDly
      fU:=1
    }
    fChk:=0
  }
Return

; #####  Timers  ######
tD:
  vBrt-=dRng
  If (vBrt<=vMin)
    vBrt:=vMin
  DisplaySetBrightness(vBrt)
  If (vBrt=vMin){
    SetTimer tD,Off
    fD:=0
  }
Return

tU:
  vBrt+=uRng
  If (vBrt>=128)
    vBrt:=128
  DisplaySetBrightness(vBrt)
  If (vBrt=128){
    SetTimer tU,Off
    fU:=0
  }
Return

; ####  Exit Code  ####
EOF:
  DisplaySetBrightness(128)
ExitApp

; ##  Dangerous Bit  ##
DisplaySetBrightness(SB:=128){
  Loop % VarSetCapacity(GB,1536)/6
    NumPut((N:=(SB+128)*(A_Index-1))>65535?65535:N,GB,2*(A_Index-1),"UShort")
  DllCall("RtlMoveMemory","Ptr",&GB+ 512,"Ptr",&GB,"Ptr",512)
  DllCall("RtlMoveMemory","Ptr",&GB+1024,"Ptr",&GB,"Ptr",512)
  Return DllCall("gdi32.dll\SetDeviceGammaRamp","Ptr",hDC:=DllCall("user32.dll\GetDC","Ptr",0),"Ptr",&GB),DllCall("user32.dll\ReleaseDC","Ptr",0,"Ptr",hDC)
}