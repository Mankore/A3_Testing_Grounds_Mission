params ["_text", "_rightText", "_textColor"];

_maxItems = 20;

if (!isNil "listBoxCounter") then {
	listBoxCounter = listBoxCounter + 1;
} else {
	listBoxCounter = 0;
};

if (!isNull (uiNameSpace getVariable "listboxControl")) then {
	_listboxControl = uiNameSpace getVariable "listboxControl";

	_index = _listboxControl lbAdd format ["%1: %2", listBoxCounter,  _text];
	if (!isNil "_textColor") then {
		_listboxControl lbSetColor [_index, _textColor];
	};

	_listboxControl lbSetTextRight [_index, _rightText];
	
	_listboxControl lbSetValue [_index, listBoxCounter];
	_listboxControl lbSortBy ["VALUE", true];

	_size = lbSize _listboxControl; // need some sort of debounce to reduce amount of items in listbox
	if (_size > _maxItems) then {
		_listboxControl lbDelete _maxItems;
	};
};
