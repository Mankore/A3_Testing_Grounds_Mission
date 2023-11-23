_display = uiNameSpace getVariable "DamageSideLog";

if (!isNil "_display") then {
	if (!isNull _display) then {
		"MKR_SideLayer" cutText ["", "PLAIN"];
		if (true) exitWith {};
	} else {
		call compile preprocessFile "gui\damageSideLog\init.sqf";
	}
} else {
	call compile preprocessFile "gui\damageSideLog\init.sqf";
};