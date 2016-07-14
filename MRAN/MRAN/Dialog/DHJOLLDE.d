BEGIN ~DHJOLLDE~

IF ~Global("MRAN_TeleportedToKuldahar","GLOBAL",1)~ THEN
BEGIN MRANCustomization
	// Anurgath told me that he helped you to get here. Are you ready to return to the north?
	SAY @500
		
	IF ~~ THEN
		// Yes. Take us there.
		REPLY @510
		DO ~SetGlobal("Exp_Pause","GLOBAL",0)~
		DO ~SetGlobal("MRAN_TeleportedToKuldahar","GLOBAL",0)~
		DO ~StartCutScene("KUtoBI")~
		EXIT

	IF ~~ THEN
		// We'll be back when we we're ready to go back. Farewell.
		REPLY @520
		EXIT
END