params ["_veh"];

civilian createVehicleCrew _veh;
{
	_x disableAI "all";

	_x addEventHandler ["HandleDamage", {
		_this execVM "target\handlers\crew\handleDamageEvent.sqf";
		_this select 2;
	}];
} forEach crew _veh;