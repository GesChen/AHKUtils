THRESHOLD := 10

VarSetCapacity(MEM, 64, 0)
NumPut(64, MEM, 0, "UInt")

DllCall("Kernel32.dll\GlobalMemoryStatusEx", "Ptr", &MEM)

TotalPageFile := NumGet(MEM, 32, "UInt64")
AvailPageFile := NumGet(MEM, 40, "UInt64")

Committed := TotalPageFile - AvailPageFile
Percent := (Committed / TotalPageFile) * 100

if (Percent >= THRESHOLD)
    TrayTip, Commit Memory Warning, Committed memory at %Percent%`%, 10
