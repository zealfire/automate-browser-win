If WinExists("[CLASS:MozillaWindowClass]") Then
    WinActivate("[CLASS:MozillaWindowClass]")
ElseIf WinExists("[CLASS:IEFrame]") Then
    WinActivate("[CLASS:IEFrame]")
EndIf
Sleep(100)
send ("!d")
send ("^c")
$link = ClipGet()

MsgBox(0, "", $link)
