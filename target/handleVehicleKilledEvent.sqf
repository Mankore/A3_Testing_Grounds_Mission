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
	{
		deleteVehicle _x
	} forEach _objects;

	_veh = createVehicle [_name, _pos, [], 0, "CAN_COLLIDE"];
	_veh setDir _dir;

	[_veh] call compile preprocessFile "target\addVehicleHandlers.sqf";
};