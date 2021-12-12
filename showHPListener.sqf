params ["_veh"];
checkModules = ["hithull","hitengine","hitturret","hitgun","hitltrack","hitrtrack","hitammo","hitammohull","hitfuel","hitfueltank_left","hitfueltank_right","hit_optic_driver","hit_optic_dvea","hit_optic_driver_rear","hit_gps_headmirror","hit_gps_optical","hit_gps_tis","hit_optic_gps","hit_optic_gps_ti","hitturretcom","hitguncom","hit_optic_citv","hitturretloader","hitgunloader","hit_optic_loaderperiscope","hitturretcomm2","hitguncomm2"]; 

_string = ''; 
_showAll = false; 

hitPoints = getAllHitPointsDamage _veh;
totalDmg = damage _veh;
_string = composeText[_string, "Total dmg: ", '    ', str totalDmg, lineBreak];

if (count hitPoints != 0) then { 
	hitNames = hitPoints select 0; 
	hitValues = hitPoints select 2; 

	if (_showAll) then { 
		for "_i" from 0 to (count hitNames - 1) do { 
			_string = composeText[_string, hitNames select _i, '    ', str (hitValues select _i), lineBreak]; 
		}; 
		
	} else { 
		for "_j" from 0 to (count checkModules - 1) do { 
			_Indx = hitNames findIf {_x == checkModules select _j}; 
			if (_Indx != -1) then { 
				_name = hitNames select _Indx;
				_hitValue = str (hitValues select _Indx);

				if (_name == "hithull" || _name == "hitammo" || _name == "hitammohull") then {
					_name = parseText format["<t color='#ff0000'>%1</t>", _name];
					_hitValue = parseText format["<t color='#ff0000'>%1</t>", _hitValue]; 
				};

			_string = composeText[_string, _name, '    ', _hitValue, lineBreak]; 
			}; 
		}; 
	}; 
	hintSilent _string; 
} else { 
hintSilent ' '; 
}; 
