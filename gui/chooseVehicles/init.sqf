createDialog "chooseVehicleDialog";

_display = findDisplay 1234;

_targetRedIdc = 1500;
_targetBlueIdc = 1501;

[_display, _targetRedIdc, _targetBlueIdc] execVM "gui\chooseVehicles\initListboxes.sqf";
[_display] execVM "gui\chooseVehicles\initButtons.sqf";
[_display] execVM "gui\chooseVehicles\initSlider.sqf";

ctrlMap = createHashMapFromArray [["0", _targetRedIdc], ["1", _targetBlueIdc]];
vehicleMap = createHashMapFromArray [["0", RedShop], ["1", BlueShop]];
