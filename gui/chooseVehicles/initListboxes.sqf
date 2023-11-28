params ["_display", "_targetRedIdc", "_targetBlueIdc"];

_ctrlTargetRed = _display displayCtrl _targetRedIdc;
_ctrlTargetBlue = _display displayCtrl _targetBlueIdc;

_ctrlTargetRed ctrlAddEventHandler ["LBSelChanged", {
	redSelectedIdx = _this select 1;
	lastSelectedShop = 0;

	_shopEntry = RedShop select redSelectedIdx;
	[_shopEntry select 0] call showVehicleInfo;
}];

_ctrlTargetBlue ctrlAddEventHandler ["LBSelChanged", {
	blueSelectedIdx = _this select 1;
	lastSelectedShop = 1;

	_shopEntry = BlueShop select blueSelectedIdx;
	[_shopEntry select 0] call showVehicleInfo;
}];

fncInitListboxItems = {
	params ["_shop", "_ctrlListbox"];
	{
		_name = (configfile >> "CfgVehicles" >> (_x select 0) >> "displayName") call BIS_fnc_getCfgData;
		if (!isNil "_name") then {
			_ctrlListbox lbAdd _name;
			_ctrlListbox lbSetTextRight [_forEachIndex, str(_x select 1)];
		}
	} forEach _shop;
};

[RedShop, _ctrlTargetRed] call fncInitListboxItems;
[BlueShop, _ctrlTargetBlue] call fncInitListboxItems;

if (lastSelectedShop == 0) then {
	lbSetCurSel [_targetBlueIdc, blueSelectedIdx];
	lbSetCurSel [_targetRedIdc, redSelectedIdx];
} else {
	lbSetCurSel [_targetRedIdc, redSelectedIdx];
	lbSetCurSel [_targetBlueIdc, blueSelectedIdx];
};