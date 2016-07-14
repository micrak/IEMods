/*
	Thea Brandon Initial Dialog
*/
BEGIN ~MRAN~

IF ~NumTimesTalkedTo(0)~ THEN
BEGIN Introduction
	SAY @200
	
	IF ~ReputationLT([PC], 6)~ THEN
		REPLY ~Certainly, I'm <CHARNAME>. What are you doing here?~
		GOTO IntroductionEvil
		
	IF ~ReputationGT([PC], 5)~ THEN
		REPLY ~Certainly, I'm <CHARNAME>. What are you doing here?~
		GOTO IntroductionGood
	
	IF ~~ THEN
		REPLY ~Bugger off.~
		EXIT
		
END

IF ~~ THEN
BEGIN IntroductionGood
	SAY ~<CHARNAME>? I must join your party!~
	
	IF ~~ THEN
		REPLY ~I'd be happy to have you in my party.~
		DO ~SetGlobal("KickedOut", "LOCALS", 0)~
		DO ~JoinParty()~
		EXIT
		
	IF ~~ THEN
		REPLY ~No, thanks.~
		EXIT
		
END

IF ~~ THEN
BEGIN IntroductionEvil
	SAY ~So *you* are <CHARNAME>? You will fall by my hand!~
	
	IF ~~ THEN
		DO ~Enemy()~
		EXIT
		
END

IF ~NumTimesTalkedToGT(0) ReputationGT([PC], 5)~ THEN
BEGIN IntroductionLater
	SAY ~You're back. Are you ready to apologise?~
	
	IF ~~ THEN
		REPLY ~Yes, I'm sorry. Do you want to join my party?~
		DO ~SetGlobal("KickedOut", "LOCALS", 0)~
		DO ~JoinParty()~
		EXIT
		
	IF ~~ THEN
		REPLY ~Bugger off.~
		EXIT

END

/*
	Thea Brandon Post Party Dialog
*/
BEGIN ~MRANP~

IF ~Global("KickedOut", "LOCALS", 0)~ THEN
BEGIN Kickout
	SAY ~Oh, you don't need me no more?~
	
	IF ~~ THEN
		REPLY ~No, I made a mistake. Please stay.~
		DO ~JoinParty()~
		EXIT
		
	IF ~~ THEN
		REPLY ~Yes, it's time to part ways.~
		GOTO KickoutFinal
	
END

IF ~~ THEN
BEGIN KickoutFinal
	SAY ~Very well. I'll travel back to the Friendly Arms Inn.~
	
	IF ~~ THEN
		DO ~SetGlobal("KickedOut", "LOCALS", 1)~
		DO ~EscapeAreaMove("AR2100", 2702, 1673, 14)~
		EXIT

END

IF ~Global("KickedOut", "LOCALS", 1)~ THEN
BEGIN Rejoin
	SAY ~You want me back in the party?~
	
	IF ~~ THEN
		REPLY ~Yes, I need your services.~
		DO ~SetGlobal("KickedOut", "LOCALS", 0)~
		DO ~JoinParty()~
		EXIT
		
	IF ~~ THEN
		REPLY ~I don't think so.~
		EXIT
END

