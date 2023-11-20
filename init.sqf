targetDistance = 300;

blueSelectedIdx = 0;
redSelectedIdx = 0;

lastSelectedShop = 0; // 0 => red shop, 1 => blue shop

RedShop = call compile preprocessFile "shops\red.sqf"; 
BlueShop = call compile preprocessFile "shops\blue.sqf";

allVehicles = RedShop + BlueShop;

player addAction ["<t color='#FF0000'>Chose Vehicles</t>", {
	execVM "dialogs\chooseVehicles.sqf";	
}, nil, 999];

/* Title Rsc, can't set text here for some reason */
player addAction ["Open Rsc", {
	execVM "dialogs\openRsc.sqf";	
}];


// Spawn launcher
/*
[] spawn
{
	waitUntil { !isNull findDisplay 46 };
	
	// Clear previous keydown events
	(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";

	// Set new keydown event
	(findDisplay 46) displayAddEventHandler ["KeyDown", {
		params["_display", "_keyCode", "_shft", "_ctr", "_alt"];

	// https://community.bistudio.com/wiki/DIK_KeyCodes
	// 15 == TAB key
		if (_keyCode == 15) then {
			player removeWeapon (currentWeapon player);
			[player, "rhs_weap_rpg75", 1] call BIS_fnc_addWeapon;
			player selectWeapon "rhs_weap_rpg75";
		};
	}];
};
*/