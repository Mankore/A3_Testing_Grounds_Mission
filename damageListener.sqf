params ["_array"];

// cutRsc ["ExampleTitle","PLAIN"];
_display = findDisplay 1235;

_idc = 1100;
_txtCtrl = _display displayCtrl _idc;

// _text = ctrlText _idc;
_text = "";

_projectile = str (_array select 2);
_velocity = str (_array select 4);
_selection = _array select 5;
_ammo = _array select 6;

// _selectionSelect = _selection select 0;
_hit = _ammo select 0;
_indirectHit = _ammo select 1;
_indirectHitRange = _ammo select 2;
_explosive = _ammo select 3;
_ammoName = _ammo select 4;

// _text = composeText[_text, _selection, '    ',  lineBreak];


// ctrlSetText [_idc, str _text];
// ctrlSetText [_idc, "str _text"];
// systemChat format ["name: %1, hit: %2",_ammoName, _hit ];

// if !(isnil "_selection") then {
if ((_selection select 0) != "") then {
	// systemChat format ["%1", _selection];
};
// _txtCtrl ctrlSetStructuredText _text;
_txtCtrl ctrlSetStructuredText (parseText "TEXTETXTEXT");
// _txtCtrl ctrlSetText "Text";