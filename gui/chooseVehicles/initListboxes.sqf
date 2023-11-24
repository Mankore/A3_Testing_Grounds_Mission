params ["_display", "_targetRedIdc", "_targetBlueIdc"];

_ctrlTargetRed = _display displayCtrl _targetRedIdc;
_ctrlTargetBlue = _display displayCtrl _targetBlueIdc;

_ctrlTargetRed ctrlAddEventHandler ["LBSelChanged", {
	redSelectedIdx = _this select 1;
	lastSelectedShop = 0;

	_shopEntry = RedShop select redSelectedIdx;
	[_shopEntry select 0] call compile preprocessFile "gui\chooseVehicles\vehicleInfo.sqf";
}];

_ctrlTargetBlue ctrlAddEventHandler ["LBSelChanged", {
	blueSelectedIdx = _this select 1;
	lastSelectedShop = 1;

	_shopEntry = BlueShop select blueSelectedIdx;
	[_shopEntry select 0] call compile preprocessFile "gui\chooseVehicles\vehicleInfo.sqf";
}];

{
	_name = (configfile >> "CfgVehicles" >> (_x select 0) >> "displayName") call BIS_fnc_getCfgData;
	_ctrlTargetRed lbAdd _name;
	_ctrlTargetRed lbSetTextRight [_forEachIndex, str(_x select 1)];
} forEach RedShop;

{
	_name = (configfile >> "CfgVehicles" >> (_x select 0) >> "displayName") call BIS_fnc_getCfgData;
	_ctrlTargetBlue lbAdd _name;
	_ctrlTargetBlue lbSetTextRight [_forEachIndex, str(_x select 1)];
} forEach BlueShop;

// lbSetCurSel [_targetRedIdc, redSelectedIdx];
// lbSetCurSel [_targetBlueIdc, blueSelectedIdx];