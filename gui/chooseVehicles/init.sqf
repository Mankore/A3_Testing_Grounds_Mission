createDialog "chooseVehicleDialog";

_display = findDisplay 1234;

_targetRedIdc = 1500;
_targetBlueIdc = 1501;
_ctrlTargetRed = _display displayCtrl _targetRedIdc;
_ctrlTargetBlue = _display displayCtrl _targetBlueIdc;

ctrlMap = createHashMapFromArray [["0", _targetRedIdc], ["1", _targetBlueIdc]];
vehicleMap = createHashMapFromArray [["0", RedShop], ["1", BlueShop]];

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

_distanceSlider = _display displayCtrl 1900;
_distanceText = _display displayCtrl 1001;

_ctrlTargetVehicleButton = _display displayCtrl 1600;
_ctrlPlayerVehicleButton = _display displayCtrl 1601;

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

lbSetCurSel [_targetRedIdc, redSelectedIdx];
lbSetCurSel [_targetBlueIdc, blueSelectedIdx];

_ctrlTargetVehicleButton buttonSetAction "[(vehicleMap get str(lastSelectedShop) select (lbCurSel (ctrlMap get str(lastSelectedShop)))) select 0, targetDistance] execVM 'target\createTargets.sqf';
";
_ctrlPlayerVehicleButton buttonSetAction "[(vehicleMap get str(lastSelectedShop) select (lbCurSel (ctrlMap get str(lastSelectedShop)))) select 0] execVM 'player\createPlayerVehicle.sqf';
";

_distanceSlider sliderSetPosition targetDistance;
_distanceText ctrlSetText format ["Distance: %1", targetDistance];