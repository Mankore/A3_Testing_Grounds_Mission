params ["_veh"];
_veh addEventHandler ["Killed", {
	_this execVM "target\handleVehicleKilledEvent.sqf";
}];
_veh addEventHandler ["HandleDamage", {
	_this execVM "target\handleDamageEvent.sqf";
	_this select 2;
}];
_veh addEventHandler ["Hit", {
	_this execVM "target\handleHitEvent.sqf";
}];

/*
	_veh addEventHandler ["HitPart", {
		_this execVM "target\handleHitPartEvent.sqf";
	}];
*/ // HandleDamage works better atm