#include <WinAPISys.au3>
HotKeySet("v", "startBot")
HotKeySet("q", "stopBot")
;AdlibRegister("reCenter",  30000)
;AdlibRegister("useDevil",  1920000)
HotKeySet("{ESC}", "KillSwitch")
Global $bot = 0
Global $useRepair = 1
Global $useZerk = 1
Global $reset = 0

while 1
	Sleep(50)
WEnd

Func startBot()
	$bot = 1
	Bot()

EndFunc

Func stopBot()
	$bot = 0

EndFunc

Func Bot()

	while $bot = 1
		$hp=PixelSearch(858, 45, 1064, 47, 0xFF3131, 1)
		if IsArray($hp) Then
			Sleep(100)
		else
			;$PIX = PixelSearch(183, 159, 1632, 813, 0x441326, 1) ;99 mobs
			$PIX = PixelSearch(183, 159, 1632, 813, 0x2A1619, 1) ;100 mobs
			if IsArray($PIX) Then
				Send("8")
				MouseClick("LEFT", $PIX[0], $PIX[1], 1,1)
			EndIf
		EndIf
		if $useRepair = 1 Then
			checkRepair()
		EndIf

		if $useZerk = 1 Then
			zerk()
		EndIf

		if $reset = 1 Then
			Send("1")
			$reset = 0
		EndIf

		WEnd
	EndFunc

Func	checkRepair()
	$repair=PixelSearch(1743,82,1782,164, 0x911013, 1)
	if IsArray($repair) Then
		Send("0")
		Sleep(4000)
		Send("{ENTER}")
		Sleep(2000)
	EndIf
EndFunc

Func	zerk()
	$zerk=PixelSearch(24,7,35,18, 0x3BC1D4, 1)
	if IsArray($zerk) Then
		Send("{TAB}")
		Sleep(200)
	EndIf

	$zerk=PixelSearch(24,7,35,18, 0xFFB8F0, 1)
	if IsArray($zerk) Then
		Send("{TAB}")
		Sleep(200)
	EndIf
EndFunc

Func	reCenter()
	stopBot()
	$reset = 1
	Sleep(8000)
	Send("9")
	Sleep(4000)
	_WinAPI_Keybd_Event(0x11, 0) ; CTRL Down
	Send("6")
	Sleep(500)
	_WinAPI_Keybd_Event(0x11, 2) ; CTRL Up
	Sleep(300)
	Send("x")
	Sleep(2000)
	Send("9")

	AdlibRegister("reCenter",  30000)
	startBot()

EndFunc

Func	useDevil()
	Send("8")
	Sleep(300)
	Send("8")
	Sleep(300)
EndFunc



Func KillSwitch()
	Exit
EndFunc