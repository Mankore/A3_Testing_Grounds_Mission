params ["_unit", "_source", "_damage", "_instigator"];

_showAll = false;
_showOnlyModules = ["hithull", "hitengine", "hitturret", "hitgun", "hitltrack", "hitrtrack", "hitammo", "hitammohull", "hitfuel", "hitfueltank_left", "hitfueltank_right", "hit_optic_driver", "hit_optic_dvea", "hit_optic_driver_rear", "hit_gps_headmirror", "hit_gps_optical", "hit_gps_tis", "hit_optic_gps", "hit_optic_gps_ti", "hitturretcom", "hitguncom", "hit_optic_citv", "hitturretloader", "hitgunloader", "hit_optic_loaderperiscope", "hitturretcomm2", "hitguncomm2"];

_hitPoints = getAllHitPointsDamage _unit;
_totalDmg = damage _unit;
_vehDisplayName = getText (configFile >> "cfgVehicles" >> typeOf vehicle _unit >> "displayName");

_string = composeText[_vehDisplayName, lineBreak, "Total dmg: ", ' ', str _totalDmg, lineBreak];

if (count _hitPoints != 0) then {
	_hitNames = _hitPoints select 0;
	_hitValues = _hitPoints select 2;

	if (_showAll) then {
		for "_i" from 0 to (count _hitNames - 1) do {
			_string = composeText[_string, _hitNames select _i, ' ', str (_hitValues select _i), lineBreak];
		};
	} else {
		for "_j" from 0 to (count _showOnlyModules - 1) do {
			_Indx = _hitNames findIf {
				_x == _showOnlyModules select _j
			};
			if (_Indx != -1) then {
				_name = _hitNames select _Indx;
				_hitValue = str (_hitValues select _Indx);
				_color = [_name] call getHEXColorByHitpoint;
				
				_name = parseText format["<t color='%2'>%1</t>", _name, _color];
				_hitValue = parseText format["<t color='%2'>%1</t>", _hitValue, _color];

				_string = composeText[_string, _name, ' ', _hitValue, lineBreak];
			};
		};
	};
};

[_string] execVM "gui\damageTracker\setText.sqf";