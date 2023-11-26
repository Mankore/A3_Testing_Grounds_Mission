_display = uiNameSpace getVariable "DamageSideLog";

if (!isNil "_display") then {
	if (!isNull _display) then {
		"MKR_SideLayer" cutText ["", "PLAIN"];
		if (true) exitWith {};
	} else {
		call initDamageSideLog;
	}
} else {
	call initDamageSideLog;
};