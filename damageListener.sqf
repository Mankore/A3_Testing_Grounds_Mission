params ["_array"];

_text = ctrlText leftTextControl;

// _projectile = str (_array select 2);
// _velocity = str (_array select 4);
_selection = _array select 5;
_ammo = _array select 6;

// _selectionSelect = _selection select 0;
_hit = _ammo select 0;
_indirectHit = _ammo select 1;
_indirectHitRange = _ammo select 2;
_explosive = _ammo select 3;
_ammoName = _ammo select 4;

_text = composeText[_text, lineBreak, str _selection, ' Was hit with ', _ammoName, lineBreak];

// if !(isnil "_selection") then {
if ((_selection select 0) != "") then {
	// systemChat format ["%1", _selection];
};

leftTextControl ctrlSetStructuredText _text;
