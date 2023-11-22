params ["_vehClassName"];

_display = findDisplay 1234;
_vehInfoIdc = 1100;
_ctrlText = _display displayCtrl _vehInfoIdc;

_turrets = (configFile >> "CfgVehicles" >> _vehClassName >> "Turrets") call BIS_fnc_getCfgSubClasses;

_finalText = composeText [_vehClassName, lineBreak];

// Turrets / Mags / ammo info
_finalText = composeText [_finalText, lineBreak, "Turrets:"];
{
	_magazines = getArray (configFile >> "CfgVehicles" >> _vehClassName >> "Turrets" >> _x >> "magazines");
	_magazinesCount = count _magazines;

	if (_magazinesCount > 0) then {
		_turretText = parseText format ["<t color='#4661fa'>%1</t>", _x];
		_finalText = composeText[_finalText, lineBreak, _turretText];
		_magsMap = createHashMap;
		{
			if (_x in _magsMap) then {
				_currentAmount = _magsMap get _x;
				_magsMap set [_x, _currentAmount + 1];
			} else {
				_magsMap set [_x, 1];
			}
		} forEach _magazines;

		{
			_magazineName = _x;
			_ammoCount = getNumber (configFile >> "CfgMagazines" >> _magazineName >> "count");
			_magInfoText = parseText format ["<t color='#cc0202'>%1</t> - <t color='#baf71e'>%2</t>", _y, _x];
			_ammoCountText = parseText format ["Total: <t color='#cc0202'>%1</t>", str (_y * _ammoCount)];
			_finalText = composeText[_finalText, lineBreak, _magInfoText, lineBreak, _ammoCountText, lineBreak];
		} forEach _magsMap;
	};
} forEach _turrets;

_ctrlText ctrlSetStructuredText _finalText;