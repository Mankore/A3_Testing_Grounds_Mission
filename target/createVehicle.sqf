params ["_vehName", "_position", "_rotation", "_playerDir"];
_veh = _vehName createVehicle _position;

_veh allowCrewInImmobile true;

[_veh] execVM "target\addVehicleHandlers.sqf";
[_veh] execVM "target\createCrew.sqf";

_veh setDir _playerDir + _rotation;