params ["_veh"];
_veh addEventHandler ["Killed", {
	_this call handleVehicleKilled;
}];
_veh addEventHandler ["HandleDamage", {
	_this call handleVehicleDamage;
	_this select 2;
}];
_veh addEventHandler ["Hit", {
	_this call handleVehicleHit;
}];

/*
	_veh addEventHandler ["HitPart", {
		_this execVM "target\handlers\vehicle\handleHitPartEvent.sqf";
	}];
*/ // HandleDamage works better atm