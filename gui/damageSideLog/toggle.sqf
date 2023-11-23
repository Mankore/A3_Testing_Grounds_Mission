_display = uiNameSpace getVariable "DamageSideLog";

if (!isNil "_display") then {
	systemChat "here";
	if (!isNull _display) then {
		systemChat "here2";
		"MKR_SideLayer" cutText ["", "PLAIN"];
		if (true) exitWith {};
	} else {
		systemChat "here3";

		call compile preprocessFile "gui\damageSideLog\init.sqf";
	}
} else {
	call compile preprocessFile "gui\damageSideLog\init.sqf";
};