params ["_vehName"];

_playerDir = getDir vehicle player;

// If player in vehicle
if !(isNull objectParent player) then {
	deleteVehicle vehicle player;
};

_actPos = getPos player;
_atv = _vehName createVehicle _actPos; 
// _atv = createVehicle [_vehName, _actPos, [], 0, "CAN_COLLIDE"];
_atv setDir _playerDir; 
player moveInGunner _atv;

_atv addEventHandler ["Fired",
	{
		// Endless ammo
		(_this select 0) setVehicleAmmo 1;
		
		// Ammo stats
		_ammoName = (_this select 4);

		_submunition = (configfile >> "CfgAmmo" >> _ammoName >> "submunitionAmmo") call BIS_fnc_getCfgData;

		if (_submunition != "") then {
			_ammoName = _submunition;
		};

		systemChat format ["%1", _ammoName];
		
		_caliber = (configfile >> "CfgAmmo" >> _ammoName >> "caliber") call BIS_fnc_getCfgData;

		_ts = (configfile >> "CfgAmmo" >> _ammoName >> "typicalSpeed") call BIS_fnc_getCfgData;
		
		_airFriction = (configfile >> "CfgAmmo" >> _ammoName >> "airFriction") call BIS_fnc_getCfgData;

		_penRHA = _caliber * _ts * 15 / 1000;

		systemChat format ["caliber: %1, typicalSpeed: %2, airFriction: %3", _caliber, _ts, _airFriction]; 
		systemChat format ["Penetration RHA:%1", _penRHA];
	}
];

