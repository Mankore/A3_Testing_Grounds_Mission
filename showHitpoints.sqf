_null = [] spawn { 
 waitUntil{ 
 
  checkModules = ["hithull","hitengine","hitturret","hitgun","hitltrack","hitrtrack","hitammo","hitammohull","hitfuel","hitfueltank_left","hitfueltank_right","hit_optic_driver","hit_optic_dvea","hit_optic_driver_rear","hit_gps_headmirror","hit_gps_optical","hit_gps_tis","hit_optic_gps","hit_optic_gps_ti","hitturretcom","hitguncom","hit_optic_citv","hitturretloader","hitgunloader","hit_optic_loaderperiscope","hitturretcomm2","hitguncomm2"]; 
 
  _testIndx = -1; 
  _string = ''; 
  _testString = ''; 
  _showAll = false; 
 
 
  hitPoints = getAllHitPointsDamage cursorTarget; 
  if (count hitPoints != 0) then { 
   
   hitNames = hitPoints select 0; 
   hitValues = hitPoints select 2; 
 
   if (_showAll) then { 
    for "_i" from 0 to (count hitNames - 1) do { 
     _string = composeText[_string, hitNames select _i, '    ', str (hitValues select _i), lineBreak]; 
    }; 
    hintSilent _string; 
     
   } else { 
    for "_j" from 0 to (count checkModules - 1) do { 
     _testIndx = hitNames findIf {_x == checkModules select _j}; 
     if (_testIndx != -1) then { 
     _testString = composeText[_testString, hitNames select _testIndx, '    ', str (hitValues select _testIndx), lineBreak]; 
     }; 
    }; 
    hintSilent _testString; 
   }; 
  } else { 
   hintSilent ' '; 
  }; 
  !isHPRunning;
 }; 
};