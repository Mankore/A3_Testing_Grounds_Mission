params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];

if (!isNil "listBoxCounter") then {
	listBoxCounter = listBoxCounter + 1;
} else {
	listBoxCounter = 0;
};
_maxItems = 20;

if (!isNull (uiNameSpace getVariable "listboxControl")) then {
	_listboxControl = uiNameSpace getVariable "listboxControl";

	_text = if (_hitpoint != "") then { _hitpoint } else { "TOTAL" };

	_index = _listboxControl lbAdd format ["%1: %2", listBoxCounter,  _text];

	_listboxControl lbSetTextRight [_index, str(_damage)];
	
	_listboxControl lbSetValue [_index, listBoxCounter];
	_listboxControl lbSortBy ["VALUE", true];

	_size = lbSize _listboxControl; // need some sort of debounce to reduce amount of items in listbox
	if (_size > _maxItems) then {
		_listboxControl lbDelete _maxItems;
	};
};

