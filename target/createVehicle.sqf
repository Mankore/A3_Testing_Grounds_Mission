params ["_vehName", "_position", "_rotation", "_playerDir"];
_veh = _vehName createVehicle _position;
_veh setDir _playerDir + _rotation;

[_veh] call compile preprocessFile "target\addVehicleHandlers.sqf";