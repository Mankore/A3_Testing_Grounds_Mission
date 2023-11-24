params ["_tarName", "_distance"];

_vehiclePlayer = vehicle player;

{
	if (_vehiclePlayer != _x) then {
		deleteVehicle _x;
	}
} forEach vehicles;

_playerDir = getDir _vehiclePlayer;

// distance between targets
_distBetween = 40;
_cos = 1 - (_distBetween^2 / (2*_distance^2));
_degree = acos _cos;

// Calculated spread in degrees between targets
_tarSpread = _degree / 2;

_relpos = _vehiclePlayer getRelPos [_distance, 0];
_relpos1 = _vehiclePlayer getRelPos [_distance, _tarSpread];
_relpos2 = _vehiclePlayer getRelPos [_distance, -_tarSpread];
_relpos3 = _vehiclePlayer getRelPos [_distance, -_tarSpread*2];

[_tarName, _relpos, 0, _playerDir] execVM "target\createVehicle.sqf";
[_tarName, _relpos1, 90 + _tarSpread, _playerDir] execVM "target\createVehicle.sqf";
[_tarName, _relpos2, 180 - _tarSpread, _playerDir] execVM "target\createVehicle.sqf";
[_tarName, _relpos3, 270 - _tarSpread * 2, _playerDir] execVM "target\createVehicle.sqf";

// side targets 

_sideDistance = 20;

_sideRelpos = _vehiclePlayer getRelPos [_sideDistance, 90];

_sideTar = _tarName createVehicle _sideRelpos;
_sideTar setDir _playerDir;