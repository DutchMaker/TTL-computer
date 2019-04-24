# Memory

_Work in progress..._

ROM/RAM	
Toggle switch to boot from ROM	
	$0000-$3FFF = ROM (16 kB)
	$4000-$FFFF = RAM (48 kB)
	
Switch ROM off	
	$0000-$FFFF = RAM (64 kB)
	
Stack	
	$FF00-$FFFF
	
If ROM boot is enabled:	
	Address bit 14 && 15 == 0 then use ROM
	Else use RAM
