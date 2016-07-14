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
		// We need to get to Kuldahar. Can you help us?
		REPLY @220
		GOTO HelpRequested		
	
	IF ~~ THEN
		// We're just passing here. Goodbye.
		REPLY @230
		EXIT
		
END

IF ~~ THEN
BEGIN IntroductionRequested
	// I'm Anurgath. I was sent by Argent to help the strangers.
	SAY @300

	IF ~~ THEN
		// Can we ask you a few questions?
		REPLY @310
		GOTO Introduction
END

IF ~~ THEN
BEGIN HelpRequested
	// I'm able to teleport you there by casting powerful and exhausting spell. It will cost you 2000 gold.
	SAY @400 

	IF ~PartyGoldGT(1999)~ THEN
		// Here is your gold. Take us there.
		REPLY @410		
		DO ~SetGlobal("Exp_Pause","GLOBAL",0)~
		DO ~SetGlobal("MRAN_TeleportedToKuldahar", "GLOBAL", 1)~
		DO ~TakePartyGold(2000)~
		DO ~StartCutScene("BCtoKU")~
		EXIT

	IF ~~ THEN
		// We don't want to go there yet.
		REPLY @420		
		EXIT
END