params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];

if (!isNull (uiNameSpace getVariable "leftTextControl")) then {
	_leftTextControl = uiNameSpace getVariable "leftTextControl";
	// _size = lbSize _leftTextControl; // need some sort of debounce to reduce amount of items in listbox
	// if (_size > 50) then {
	// 	lbClear _leftTextControl;
	// };

	_text = if (_hitpoint != "") then { _hitpoint } else { "TOTAL" };

	_index = _leftTextControl lbAdd format ["%1", _text];

	_leftTextControl lbSetTextRight [_index, str(_damage)];

	_leftTextControl lbSetValue [_index, _index];
	_leftTextControl lbSortBy ["VALUE", true];
};

