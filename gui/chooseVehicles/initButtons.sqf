params ["_display"];

_ctrlTargetVehicleButton = _display displayCtrl 1600;
_ctrlPlayerVehicleButton = _display displayCtrl 1601;

_ctrlTargetVehicleButton buttonSetAction "[(vehicleMap get str(lastSelectedShop) select (lbCurSel (ctrlMap get str(lastSelectedShop)))) select 0, targetDistance] execVM 'target\createTargets.sqf';
";
_ctrlPlayerVehicleButton buttonSetAction "[(vehicleMap get str(lastSelectedShop) select (lbCurSel (ctrlMap get str(lastSelectedShop)))) select 0] execVM 'player\createPlayerVehicle.sqf';
";