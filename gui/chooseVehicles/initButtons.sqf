params ["_display"];

_ctrlTargetVehicleButton = _display displayCtrl 1600;
_ctrlPlayerVehicleButton = _display displayCtrl 1601;

_ctrlTargetVehicleButton buttonSetAction "[lbData [ctrlMap get str(lastSelectedShop), lbCurSel (ctrlMap get str(lastSelectedShop))], targetDistance] execVM 'target\createTargets.sqf';
";
_ctrlPlayerVehicleButton buttonSetAction "[lbData [ctrlMap get str(lastSelectedShop), lbCurSel (ctrlMap get str(lastSelectedShop))]] execVM 'player\createPlayerVehicle.sqf';
";