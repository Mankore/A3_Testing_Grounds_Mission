_display = uiNameSpace getVariable "DamageTracker";

if (!isNil "_display") then {
	if (!isNull _display) then {
		// "MKR_DamageTrackerLayer" cutText ["", "PLAIN"];
		"MKR_DamageTrackerLayer" cutFadeOut 0.5;
		if (true) exitWith {};
	} else {
		call initDamageTracker;
	}
} else {
	call initDamageTracker;
};