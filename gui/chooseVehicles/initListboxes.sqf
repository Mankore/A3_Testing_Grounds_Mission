params ["_display", "_targetRedIdc", "_targetBlueIdc"];

_ctrlTargetRed = _display displayCtrl _targetRedIdc;
_ctrlTargetBlue = _display displayCtrl _targetBlueIdc;

fncSetEventHandler = {
	params ["_ctrl"];
	_ctrl ctrlAddEventHandler ["LBSelChanged", {
		if (_this select 0 isEqualTo (displayCtrl 1500)) then {
			redSelectedIdx = _this select 1;
			lastSelectedShop = 0;
		} else {
			blueSelectedIdx = _this select 1;
			lastSelectedShop = 1;
		};

		_data = (_this select 0) lbData (_this select 1);
		[_data] call showVehicleInfo;
	}];
};

fncInitListboxItems = {
	params ["_shop", "_ctrlListbox"];
	{
		_name = (configfile >> "CfgVehicles" >> (_x select 0) >> "displayName") call BIS_fnc_getCfgData;
		if (!isNil "_name") then {
			_idx = _ctrlListbox lbAdd _name;
			_ctrlListbox lbSetTextRight [_idx, str(_x select 1)];
			_ctrlListbox lbSetData [_idx, _x select 0];
		};
	} forEach _shop;
};


[_ctrlTargetRed] call fncSetEventHandler;
[_ctrlTargetBlue] call fncSetEventHandler;

[RedShop, _ctrlTargetRed] call fncInitListboxItems;
[BlueShop, _ctrlTargetBlue] call fncInitListboxItems;

if (lastSelectedShop == 0) then {
	lbSetCurSel [_targetBlueIdc, blueSelectedIdx];
	lbSetCurSel [_targetRedIdc, redSelectedIdx];
} else {
	lbSetCurSel [_targetRedIdc, redSelectedIdx];
	lbSetCurSel [_targetBlueIdc, blueSelectedIdx];
};