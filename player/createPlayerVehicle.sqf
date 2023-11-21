params ["_vehName"];

_playerDir = getDir vehicle player;

// if player in vehicle
if !(isNull objectParent player) then {
	deleteVehicle vehicle player;
};

_actPos = getPos player;
_veh = _vehName createVehicle _actPos;
_veh setDir _playerDir;

if ((!isNull gunner _veh) || (_veh emptyPositions "gunner" > 0)) then {
	// if vehicle has gunner seat
	player moveInGunner _veh;
} else {
	player moveInDriver _veh;
};

_veh addEventHandler ["Fired", {
	_this execVM "player\handleFiredEvent.sqf";
} ];