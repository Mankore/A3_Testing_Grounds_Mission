params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];

_veh = vehicle _unit;

if (_veh isEqualTo _unit) exitWith {
	true
};

_seat = "";

switch (_unit) do
{
	case (driver _veh): {
		_seat = "Driver";
	};
	case (gunner _veh): {
		_seat = "Gunner";
	};
	case (commander _veh): {
		_seat = "Commander";
	};
	default {
		_seat = "Crew"
	};
};

_text = format ["%1", _seat];
_rightText = str(_damage);

[_text, _rightText] execVM "gui\damageSideLog\addListboxItem.sqf";