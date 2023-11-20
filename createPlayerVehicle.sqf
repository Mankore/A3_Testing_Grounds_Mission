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

_veh addEventHandler ["Fired",
	{
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
		// Endless ammo
		(_this select 0) setVehicleAmmo 1;
		// (_this select 0) setWeaponReloadingTime [_gunner, _muzzle, 0];

		// ammo stats
		_ammoName = (_this select 4);

		_submunition = (configfile >> "CfgAmmo" >> _ammoName >> "submunitionAmmo") call BIS_fnc_getCfgData;

		if (_submunition != "") then {
			_ammoName = _submunition;
		};

		systemChat format ["%1", _ammoName];

		_caliber = (configfile >> "CfgAmmo" >> _ammoName >> "caliber") call BIS_fnc_getCfgData;

		_ts = (configfile >> "CfgAmmo" >> _ammoName >> "typicalSpeed") call BIS_fnc_getCfgData;

		_airFriction = (configfile >> "CfgAmmo" >> _ammoName >> "airFriction") call BIS_fnc_getCfgData;

		_hitValue = (configfile >> "CfgAmmo" >> _ammoName >> "hit") call BIS_fnc_getCfgData;

		_penRHA = _caliber * _ts * 15 / 1000;

		systemChat format ["caliber: %1, typicalSpeed: %2, airFriction: %3, hit: %4", _caliber, _ts, _airFriction, __hitValue];
		systemChat format ["Penetration RHA:%1", _penRHA];
	}
];