showVehicleInfo = compile preprocessFile "gui\chooseVehicles\vehicleInfo.sqf";
initDamageSideLog = compile preprocessFile "gui\damageSideLog\init.sqf";
initDamageTracker = compile preprocessFile "gui\damageTracker\init.sqf";
getHEXColorByHitpoint = compile preprocessFile "target\utils\getHEXColorByHitpoint.sqf";
getRGBAColorByHitpoint = compile preprocessFile "target\utils\getRGBAColorByHitpoint.sqf";

handleVehicleKilled = compile preprocessFile "target\handlers\vehicle\handleVehicleKilledEvent.sqf";
handleVehicleDamage = compile preprocessFile "target\handlers\vehicle\handleDamageEvent.sqf";
handleVehicleHit = compile preprocessFile "target\handlers\vehicle\handleHitEvent.sqf";

handleCrewHit = compile preprocessFile "target\handlers\crew\handleHitEvent.sqf";

handlePlayerFired = compile preprocessFile "player\handleFiredEvent.sqf";