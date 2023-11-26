_display = uiNameSpace getVariable "DamageTracker";

if (!isNil "_display") then {
	if (!isNull _display) then {
		"MKR_DamageTrackerLayer" cutText ["", "PLAIN"];
		if (true) exitWith {};
	} else {
		call initDamageTracker;
	}
} else {
	call initDamageTracker;
};