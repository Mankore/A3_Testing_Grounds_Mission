params ["_vehName", "_position", "_rotation", "_playerDir"];
_veh = _vehName createVehicle _position;

_veh allowCrewInImmobile true;

[_veh] call compile preprocessFile "target\addVehicleHandlers.sqf";
[_veh] call compile preprocessFile "target\createCrew.sqf";

_veh setDir _playerDir + _rotation;