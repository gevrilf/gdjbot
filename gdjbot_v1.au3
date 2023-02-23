HotKeySet("v", "aim")
HotKeySet("q", "KillSwitch")

while 1
	Sleep(50)
WEnd

Func aim()
	while 1
		$hp=PixelSearch(1176, 43, 1386, 49, 0xFF3131, 1)
		if IsArray($hp) Then
			Sleep(100)
		else	
			$PIX = PixelSearch(458, 109, 2361, 1224, 0x441326, 1)
			if IsArray($PIX) Then
				MouseClick("LEFT", $PIX[0], $PIX[1], 1,1)
			EndIf
		EndIf
		
		WEnd
	EndFunc
	
	
Func KillSwitch()
	Exit
EndFunc	
