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
		GOTO HelpRequested		
	
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

IF ~~ THEN
BEGIN HelpRequested
	// I'm able to teleport you there by casting powerful and exhausting spell. It will cost you 2000 gold.
	SAY @400 

	IF ~PartyGoldGT(1999)~ THEN
		// Here is your gold. Take me there.
		REPLY @410		
		DO ~SetGlobal("Exp_Pause","GLOBAL",0)~
		DO ~ClearAllActions()~
		DO ~StartCutSceneMode()~
		DO ~StartCutScene("MRTOKU")~
		EXIT

	IF ~~ THEN
		// I don't want to go there yet.
		REPLY @420		
		EXIT
END