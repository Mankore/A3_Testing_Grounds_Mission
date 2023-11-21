createDialog "chooseVehicleDialog";

_targetRedIdc = 1500;
_targetBlueIdc = 1501;
_ctrlTargetRed = (findDisplay 1234) displayCtrl _targetRedIdc;
_ctrlTargetBlue = (findDisplay 1234) displayCtrl _targetBlueIdc;

_distanceSlider = (findDisplay 1234) displayCtrl 1900;
_distanceText = (findDisplay 1234) displayCtrl 1001;

_ctrlTargetVehicleButton = (findDisplay 1234) displayCtrl 1600;
_ctrlPlayerVehicleButton = (findDisplay 1234) displayCtrl 1601;

ctrlMap = createHashMapFromArray [["0", _targetRedIdc], ["1", _targetBlueIdc]];
vehicleMap = createHashMapFromArray [["0", RedShop], ["1", BlueShop]];

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

_ctrlTargetVehicleButton buttonSetAction "[(vehicleMap get str(lastSelectedShop) select (lbCurSel (ctrlMap get str(lastSelectedShop)))) select 0, targetDistance] execVM 'createTargets.sqf';";
_ctrlPlayerVehicleButton buttonSetAction "[(vehicleMap get str(lastSelectedShop) select (lbCurSel (ctrlMap get str(lastSelectedShop)))) select 0] execVM 'createPlayerVehicle.sqf';";

_distanceSlider sliderSetPosition targetDistance;
_distanceText ctrlSetText format ["Distance: %1", targetDistance];