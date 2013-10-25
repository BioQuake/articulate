/*
	Author: Benjamin Pannell

	Description:
	Connects to Articulate and provides an interface between the Articulate_Extension module and the ArmA
	game engine.

	Parameter(s):
		NONE

	Returns:
	STRING
*/

[] spawn {
	if(!isNil "Sierra_Articulate_Active" && Sierra_Articulate_Active == true) exitWith {};

	Sierra_Articulate_Active = true;

	while(Sierra_Articulate_Active) {
		sleep 0.5;
		command = "Articulate" callExtension "read";

		hint command;

		if(leader group player == player) then {
			call compile command;
		};
	};
};

"Articulate" callExtension "start"