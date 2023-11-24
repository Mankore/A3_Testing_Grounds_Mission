params ["_veh"];
_veh addEventHandler ["Killed", {
	_this execVM "target\handlers\vehicle\handleVehicleKilledEvent.sqf";
}];
_veh addEventHandler ["HandleDamage", {
	_this execVM "target\handlers\vehicle\handleDamageEvent.sqf";
	_this select 2;
}];
_veh addEventHandler ["Hit", {
	_this execVM "target\handlers\vehicle\handleHitEvent.sqf";
}];

/*
	_veh addEventHandler ["HitPart", {
		_this execVM "target\handlers\vehicle\handleHitPartEvent.sqf";
	}];
*/ // HandleDamage works better atm