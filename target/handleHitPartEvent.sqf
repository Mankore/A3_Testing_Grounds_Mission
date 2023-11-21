fncAddListboxItem = {
	params ["_string", "_ammo"];
	_index = _leftTextControl lbAdd _string;
	_leftTextControl lbSetTextRight [_index, format ["%1", _ammo select 4]];
	_leftTextControl lbSetValue [_index, _index];
	_leftTextControl lbSortBy ["VALUE", true];
};

fncHandleHitPartArrayEntry = {
	(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];

	if (count _selection != 0) then {
		{
			[format ["%1", _x], _ammo] call fncAddListboxItem;
		} forEach _selection;
	} else {
		[format ["%1", "Main component"], _ammo] call fncAddListboxItem;
	}
};

if (!isNull (uiNameSpace getVariable "leftTextControl")) then {
	_leftTextControl = uiNameSpace getVariable "leftTextControl";
	{
		[_x] call fncHandleHitPartArrayEntry;
	} forEach _this;
};