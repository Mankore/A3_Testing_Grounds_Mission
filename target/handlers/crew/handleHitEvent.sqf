params ["_unit", "_source", "_damage", "_instigator"];

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
_textColor = [0.388, 0.353, 1, 1];

[_text, _rightText, _textColor] execVM "gui\damageSideLog\addListboxItem.sqf";