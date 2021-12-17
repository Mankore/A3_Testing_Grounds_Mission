glDistance = 300;

glSelIdx = 0;

// Second array entry for custom description
allVehicles = [
	// Reds
	["rhs_tigr_m_vv", "MHQ RED"],
	["rhsgref_ins_uaz_spg9", "SPG"],
	["rhs_btr80_vdv", "RHS BTR 80"],
	["CUP_O_BTR90_RU", "CUP BTR 90"],
	["rhsgref_BRDM2_ATGM_vdv", "RHS BRDM"],
	["rhs_zsu234_aa", "ZSU"],
	["O_APC_Tracked_02_AA_F", "AA"],
	["rhs_bmp1d_msv", "BMP 1D"],
	["rhs_bmp2d_msv", "BMP 2D"],
	["rhs_bmd2m", "BMD 2M"],
	["rhs_sprut_vdv", "2S25 SPRUT"],
	["rhs_t72ba_tv", "T72 BA"],
	["rhs_t72bb_tv", "T72 BB"],
	["rhs_t72bc_tv", "T72 BC"],
	["rhs_t72bd_tv", "T72 BD"],
	["rhs_t80", "T80"],
	["rhs_t80bk", "T80 BK"],
	["rhs_t80bvk", "T80 BVK"],
	["rhs_t80u45m", "T80 U45M"],
	["rhs_t80uk", "T80 UK"],
	["rhs_t80um", "T80 UM"],
	["rhs_t80a", "T80 A"],
	["rhs_t80ue1", "T80 UE 1"],
	["rhs_bmp3_msv", "BMP3"],
	["rhs_bmd4_vdv", "BMD4"],
	["rhs_bmd4m_vdv", "BMD4M"],
	["rhs_bmp3mera_msv", "BMP3 DB"],
	["rhs_t90_tv", "T90"],
	["rhs_t90saa_tv", "T90 SAA"],
	["rhs_t72be_tv", "T72 BE"],
	["rhs_t90sab_tv", "T90 SAB"],
	["rhs_t90am_tv", "T90 AM"],
	["rhs_t90sm_tv", "T90 SM"],
	["rhs_t14_noKAZ", "T14"],
	// Blues
	["rhsusf_m1025_w", "MHQ BLUE"],
	["CUP_B_LAV25M240_USMC", "CUP LAV"],
	["CUP_B_Dingo_CZ_Wdl", "CUP Dingo"],
	["CUP_B_RG31_M2_USA", "CUP RG31"],
	["rhsusf_stryker_m1126_m2_wd", "RHS Stryker M2"],
	["CUP_B_HMMWV_Crows_M2_USA", "CUP HMMWV CROWS M2"],
	["CUP_B_M1128_MGS_Woodland", "CUP M1128 MGS"],
	["rhsusf_stryker_m1134_wd", "RHS Stryker M1134"],
	["CUP_B_M1135_ATGMV_Woodland", "CUP M1135 ATGMV"],
	["CUP_B_M1126_ICV_MK19_Woodland", "CUP M1126 MK19"],
	["CUP_B_M163_USA", "M163"],
	["B_APC_Tracked_01_AA_F", "AA"],
	["RHS_M2A2", "RHS M2A2"],
	["rhsusf_m1a1hc_wd", "M1A1HC"],
	["RHS_M6", "RHS M6"],
	["rhsusf_m1a2sep1wd_usarmy", "M1A2 Sep1"],
	["rhsusf_m1a1aimwd_usarmy", "M1A1 Aim"],
	["rhsusf_m1a1fep_wd", "M1A1 fep"],
	["rhsusf_m1a2sep2wd_usarmy", "M1A2 Sep2"],
	["RHS_M2A3_wd", "RHS M2A3"],
	["RHS_M2A2_BUSKI_WD", "M2A2 BUSK I"],
	["RHS_M2A3_BUSKI", "M2A3 BUSK I"],
	["rhsusf_m1a2sep1tuskiwd_usarmy", "M1A2 Sep1 TUSK I"],
	["rhsusf_m1a1aim_tuski_wd", "M1A1 Aim TUSK I"],
	["rhsusf_m1a2sep1tuskiiwd_usarmy", "M1A2 Sep1 TUSK II"],
	["RHS_M2A3_BUSKIII", "M2A3 BUSK III"],
	// Vanilla
	["B_MBT_01_cannon_F", "Slammer"],
	["B_MBT_01_TUSK_F", "Slammer UP"],
	["O_MBT_02_cannon_F", "Varsuk"],
	["O_MBT_04_cannon_F", "Angara"],
	["O_MBT_04_command_F", "Angara 140K"],
	["I_MBT_03_cannon_F", "Kuma"]
];

player addAction ["<t color='#FF0000'>.A_Open Dialog</t>", {
	execVM "openDialog.sqf";	
}];

/* Title Rsc, can't set text here for some reason */
// player addAction ["Open Rsc", {
// 	execVM "openRsc.sqf";	
// }];


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
			player selectWeapon "rhs_weap_rpg26";
		};
	}];
};
