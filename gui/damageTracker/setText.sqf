params ["_text"];

if (!isNull (uiNameSpace getVariable "damageTrackerTextControl")) then {
	_damageTextControl = uiNameSpace getVariable "damageTrackerTextControl";
	_damageTextControl ctrlSetStructuredText _text;
}