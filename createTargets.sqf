fncKilledHandler = {
	hintSilent "";	
		[_this select 0] spawn {
			params ["_veh"];
			sleep 0.5;
			_name = typeOf _veh;
			_pos = getPosATL _veh;
			_pos = [_pos select 0, _pos select 1, (_pos select 2) + 5];
			_dir = getDir _veh;
			deleteVehicle _veh;

			// delete turret wreck
			_objects = _pos nearEntities 10;
			{ deleteVehicle _x } forEach _objects;

			_veh = createVehicle [_name, _pos, [], 0, "CAN_COLLIDE"];
			_veh setDir _dir; 
			_veh addEventHandler ["Killed", fncKilledHandler];
			_veh addEventHandler ["Hit", {[_this select 0] execVM "showHPListener.sqf"}];
		};
};

fncCreateTargetVehicle = {
	params ["_vehName", "_position", "_rotation", "_playerDir"];
	_vehicle = _vehName createVehicle _position;
	_vehicle setDir _playerDir + _rotation;

	_vehicle addEventHandler ["Killed", fncKilledHandler];
	_vehicle addEventHandler ["Hit", {[_this select 0] execVM "showHPListener.sqf"}]; 
};


params ["_tarName", "_distance"];

_vehiclePlayer = vehicle player;

{ 
	if (_vehiclePlayer != _x) then {
		deleteVehicle _x;
	}
} forEach vehicles;

_playerDir = getDir _vehiclePlayer;

// Distance between targets
_distBetween = 40;
_cos = 1 - (_distBetween^2 / (2*_distance^2));
_degree = acos _cos;

// Calculated spread in degrees between targets
_tarSpread = _degree / 2; 

_sideDistance = 20; 

_relpos = _vehiclePlayer getRelPos [_distance, 0]; 
_relpos1 = _vehiclePlayer getRelPos [_distance, _tarSpread]; 
_relpos2 = _vehiclePlayer getRelPos [_distance, -_tarSpread]; 

[_tarName, _relpos, 0, _playerDir] call fncCreateTargetVehicle;
[_tarName, _relpos1, 90 + _tarSpread, _playerDir] call fncCreateTargetVehicle;
[_tarName, _relpos2, 180 - _tarSpread, _playerDir] call fncCreateTargetVehicle;

// Side targets 

_sideRelpos = _vehiclePlayer getRelPos [_sideDistance, 90]; 

_sideTar = _tarName createVehicle _sideRelpos; 
_sideTar setDir _playerDir; 

