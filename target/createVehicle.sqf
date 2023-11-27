params ["_vehName", "_position", "_vehDir"];
_veh = createVehicle [_vehName, _position, [], 0, "CAN_COLLIDE"];

_veh allowCrewInImmobile true;

[_veh] execVM "target\addVehicleHandlers.sqf";
[_veh] execVM "target\createCrew.sqf";

_veh setDir _vehDir;