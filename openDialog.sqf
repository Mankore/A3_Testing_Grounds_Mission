createDialog "dialogTest1";

_ctrlTarget = (findDisplay 1234) displayCtrl 1500;
_distanceSlider = (findDisplay 1234) displayCtrl 1900;
_distanceText = (findDisplay 1234) displayCtrl 1001;

{
	_name = (configfile >> "CfgVehicles" >> (_x select 0) >> "displayName") call BIS_fnc_getCfgData;
	_ctrlTarget lbAdd _name;
	
} forEach allVehicles;

lbSetCurSel [1500, glSelIdx];

_distanceSlider sliderSetPosition glDistance;
_distanceText ctrlSetText format ["Distance: %1", glDistance];