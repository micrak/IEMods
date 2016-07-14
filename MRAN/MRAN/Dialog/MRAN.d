BEGIN ~MRAN~

IF ~True()~ THEN
BEGIN Introduction
	// What are you looking for?
	SAY @200
		
	IF ~~ THEN
		// Who are you?
		REPLY @210
		GOTO IntroductionRequested

	IF ~~ THEN
		// I need to get to Kuldahar. Can you help me?
		REPLY @220
		DO ~SetGlobal("Exp_Pause","GLOBAL",1)~
		DO ~StartCutScene("BCtoKU")~
		EXIT
	
	IF ~~ THEN
		// I'm just passing here. Goodbye.
		REPLY @230
		EXIT
		
END

IF ~~ THEN
BEGIN IntroductionRequested
	// I'm Anurgath. I was sent by Argent to help the strangers.
	SAY @300

	IF ~~ THEN
		// Can I ask you a few questions?
		REPLY @310
		GOTO Introduction
END