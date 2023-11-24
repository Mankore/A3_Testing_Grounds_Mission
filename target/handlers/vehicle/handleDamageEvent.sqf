params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];

_text = if (_hitpoint != "") then { _hitpoint } else { "TOTAL" };
_rightText = str(_damage);

[_text, _rightText] execVM "gui\damageSideLog\addListboxItem.sqf";
