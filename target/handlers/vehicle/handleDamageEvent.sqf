params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];

if (_hitpoint == "") exitWith{true};

_text = if (_hitpoint != "") then {
	_hitpoint
} else {
	"TOTAL"
};
_rightText = str(_damage);
_color = [_hitPoint] call getRGBAColorByHitpoint;

[_text, _rightText, _color] execVM "gui\damageSideLog\addListboxItem.sqf";