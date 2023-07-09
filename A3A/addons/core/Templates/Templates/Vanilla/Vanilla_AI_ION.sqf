//////////////////////////
//   Side Information   //
//////////////////////////

["name", "ION"] call _fnc_saveToTemplate;
["spawnMarkerName", "ION Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\flag_ion_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_ION"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_T_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["B_T_LSV_01_unarmed_F","B_CTRG_LSV_01_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["B_T_MRAP_01_hmg_F","B_T_LSV_01_armed_F","B_T_LSV_01_AT_F"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["B_T_Truck_01_transport_F", "B_T_Truck_01_covered_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["B_T_Truck_01_flatbed_F", "B_T_Truck_01_cargo_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["B_T_Truck_01_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["B_T_Truck_01_Repair_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["B_T_Truck_01_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["B_T_Truck_01_medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
private _APCs = ["B_T_APC_Wheeled_01_cannon_F", "B_T_APC_Tracked_01_rcws_F"];           // CRV has no cargo: "B_T_APC_Tracked_01_CRV_F"
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["B_T_MBT_01_TUSK_F", "B_T_MBT_01_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesAA", ["B_T_APC_Tracked_01_AA_F"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_T_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_T_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["B_T_APC_Wheeled_01_cannon_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["B_Plane_CAS_01_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["B_Plane_Fighter_01_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["B_T_VTOL_01_infantry_F"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["B_Heli_Light_01_F"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["B_Heli_Transport_03_F", "B_Heli_Transport_01_camo_F","B_CTRG_Heli_Transport_01_sand_F","B_CTRG_Heli_Transport_01_tropic_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["B_Heli_Light_01_armed_F"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["B_Heli_Attack_01_F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["B_T_MBT_01_arty_F"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["B_T_MBT_01_arty_F", ["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_F", "B_T_UAV_03_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["B_T_LSV_01_armed_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["B_T_Truck_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["B_T_LSV_01_unarmed_F"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["I_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["B_T_Static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["B_T_Static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["B_T_Mortar_01_F"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
//Not Magazine type would be: ["APERSBoundingMine", "APERSMine", "ATMine"],
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

//If Western Sahara DLC
if (allowDLCWS) then {
    _APCs append ["B_T_APC_Wheeled_01_atgm_lxWS", "B_T_APC_Wheeled_01_command_lxWS"];
};
["vehiclesAPCs", _APCs] call _fnc_saveToTemplate;

#include "Vanilla_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", [
"Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE",
"Male01ENGFRE","Male02ENGFRE",
"Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG",
"Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB", "Male05ENGB"
]] call _fnc_saveToTemplate;
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;
["sfVoices", ["Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB", "Male05ENGB"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
"launch_RPG7_F"
]];
_loadoutData set ["ATLaunchers", [
["launch_MRAWS_olive_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""]]];
_loadoutData set ["missileATLaunchers", [
["launch_I_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""],
["launch_O_Vorona_green_F", "", "acc_pointer_IR", "", ["Vorona_HEAT","Vorona_HE"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_B_Titan_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_tna_F"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Watchcap_blk"]];
_loadoutData set ["sniHats", ["H_Booniehat_khk_hs"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["U_I_G_resistanceLeader_F", "U_I_G_Story_Protagonist_F"]];
_sfLoadoutData set ["vests", ["V_TacVestIR_blk","V_PlateCarrier1_blk","V_PlateCarrier2_blk"]];
_sfLoadoutData set ["Hvests", ["V_PlateCarrierSpec_blk"]];
_sfLoadoutData set ["glVests", ["V_PlateCarrierGL_blk"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_blk", "B_CivilianBackpack_01_Everyday_Black_F", "B_Carryall_blk"]];
_sfLoadoutData set ["helmets", ["H_HelmetB_black", "H_HelmetSpecB_blk", "H_HelmetSpecB"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator_03"]];

_sfLoadoutData set ["ATLaunchers", ["launch_NLAW_F",
["launch_O_Vorona_green_F", "", "acc_pointer_IR", "", ["Vorona_HE"], [], ""]
]];
_sfLoadoutData set ["lightATLaunchers", [
["launch_MRAWS_olive_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""]]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
["arifle_AK12_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_SPAR_01_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_Tracer_Green"], [], ""],
["arifle_SPAR_01_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_Tracer_Green"], [], ""],
["arifle_SPAR_01_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_Tracer_Green"], [], ""],
["arifle_SPAR_01_GL_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_Tracer_Green"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_Tracer_Green"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_Tracer_Green"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
["arifle_SPAR_01_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_Tracer_Green"], [], ""],
["arifle_SPAR_02_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_Tracer_Green"], [], ""],
["arifle_AK12_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["arifle_SPAR_01_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_Tracer_Green"], [], ""],
["arifle_AK12U_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_AK12_GL_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_Tracer_Green"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_Tracer_Green"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_Tracer_Green"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand_Tracer_Green"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
["arifle_AK12U_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Aco", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_F", "muzzle_snds_B", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["arifle_RPK12_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", ["75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_RPK12_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Hamr", ["75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_RPK12_F", "muzzle_snds_B", "acc_pointer_IR", "optic_MRCO", ["75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_Holosight_blk_F", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Green_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_Hamr", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Green_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_MRCO", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Green_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_01_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_Holosight_blk_F", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Green_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_01_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_Hamr", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Green_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_01_khk_F", "muzzle_snds_m_blk_F", "acc_pointer_IR", "optic_MRCO", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Green_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["LMG_03_F", "muzzle_snds_H_MG_blk_F", "acc_pointer_IR", "optic_Holosight_blk_F", ["200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Tracer_Red_F"], [], ""],
["LMG_03_F", "muzzle_snds_H_MG_blk_F", "acc_pointer_IR", "optic_Hamr", ["200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Tracer_Red_F"], [], ""],
["LMG_03_F", "muzzle_snds_H_MG_blk_F", "acc_pointer_IR", "optic_MRCO", ["200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Tracer_Red_F"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["arifle_SPAR_03_khk_F", "muzzle_snds_B_blk_F", "acc_pointer_IR", "optic_SOS_blk_F", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_khk_F", "muzzle_snds_B_blk_F", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_khk_F", "muzzle_snds_B_blk_F", "acc_pointer_IR", "optic_ERCO_blk_F", [], [], "bipod_01_F_blk"],
["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"],
["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_ERCO_blk_F", [], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_DMR_02_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["srifle_DMR_02_F", "muzzle_snds_338_sand", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["sidearms", [
["hgun_Pistol_heavy_01_green_F", "muzzle_snds_acp", "acc_flashlight_pistol", "optic_MRD_black", [], [], ""],
["hgun_P07_blk_F", "muzzle_snds_L", "", "", [], [], ""],
["hgun_ACPC2_F", "muzzle_snds_acp", "acc_flashlight_pistol", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////
private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["U_BG_Guerilla2_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_3", "U_B_GEN_Soldier_F"]];
_militaryLoadoutData set ["vests", ["V_TacVestIR_blk","V_PlateCarrier1_blk","V_PlateCarrier2_blk"]];
_militaryLoadoutData set ["Hvests", ["V_PlateCarrierSpec_blk"]];
_militaryLoadoutData set ["glVests", ["V_PlateCarrierGL_blk"]];
_militaryLoadoutData set ["backpacks", ["B_AssaultPack_blk", "B_CivilianBackpack_01_Everyday_Black_F", "B_Carryall_blk"]];
_militaryLoadoutData set ["helmets", ["H_PASGT_basic_black_F", "H_HelmetB_light_black", "H_HelmetB_black"]];
_militaryLoadoutData set ["binoculars", ["Laserdesignator_03"]];

_militaryLoadoutData set ["slRifles", [
["arifle_AK12U_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_01_GL_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["rifles", [
["arifle_AK12_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["arifle_AK12U_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_F", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_AK12_GL_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["SMG_01_F", "", "", "optic_Holosight", [], [], ""],
["SMG_01_F", "", "", "optic_Aco_smg", [], [], ""],
["SMG_05_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["SMG_05_F", "", "acc_pointer_IR", "optic_Yorris", [], [], ""],
["SMG_05_F", "", "acc_pointer_IR", "optic_Aco_smg", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Aco_smg", [], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["arifle_SPAR_02_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_blk_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], [], "bipod_01_F_blk"],
["arifle_RPK12_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_RPK12_F", "", "acc_pointer_IR", "optic_Hamr", ["75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_RPK12_F", "", "acc_pointer_IR", "optic_MRCO", ["75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["LMG_03_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_F", "", "acc_pointer_IR", "optic_Hamr", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_F", "", "acc_pointer_IR", "optic_MRCO", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["arifle_SPAR_03_blk_F", "", "acc_pointer_IR", "optic_SOS_blk_F", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
["arifle_SPAR_03_blk_F", "", "acc_pointer_IR", "optic_KHS_blk", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
["arifle_SPAR_03_blk_F", "", "acc_pointer_IR", "optic_Hamr", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
["srifle_DMR_03_F", "", "acc_pointer_IR", "optic_KHS_blk", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
["srifle_DMR_03_F", "", "acc_pointer_IR", "optic_DMS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
["srifle_EBR_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["srifle_EBR_F", "", "acc_pointer_IR", "optic_KHS_blk", [], [], "bipod_01_F_blk"],
["srifle_EBR_F", "", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
["srifle_DMR_03_F", "", "acc_pointer_IR", "optic_KHS_blk", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
["srifle_DMR_03_F", "", "acc_pointer_IR", "optic_LRPS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
["srifle_GM6_F", "", "", "optic_KHS_blk", ["5Rnd_127x108_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["hgun_Pistol_heavy_01_green_F", "", "acc_flashlight_pistol", "", [], [], ""],
["hgun_P07_blk_F", "", "", "", [], [], ""],
["hgun_ACPC2_F", "", "acc_flashlight_pistol", "", [], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];

_policeLoadoutData set ["SMGs", [
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Holosight", [], [], ""],
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Aco_smg", [], [], ""],
["SMG_03C_TR_black", "", "acc_flashlight", "optic_Holosight_blk_F", [], [], ""],
["SMG_03C_TR_black", "", "acc_flashlight", "optic_Aco_smg", [], [], ""],
["SMG_05_F", "", "acc_flashlight", "optic_Holosight_blk_F", [], [], ""],
["SMG_05_F", "", "acc_flashlight", "optic_Yorris", [], [], ""],
["SMG_05_F", "", "acc_flashlight", "optic_Aco_smg", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Holosight_blk_F", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Aco_smg", [], [], ""]
]];
_policeLoadoutData set ["sidearms", ["hgun_Rook40_F"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["U_I_L_Uniform_01_deserter_F", "U_C_IDAP_Man_cargo_F", "U_Competitor"]];;
_militiaLoadoutData set ["vests", ["V_TacVest_oli","V_TacVest_blk","V_Pocketed_black_F","V_TacVestIR_blk"]];
_militiaLoadoutData set ["Hvests", ["V_PlateCarrier1_blk","V_TacVestIR_blk"]];
_militiaLoadoutData set ["helmets", ["H_Cap_oli_hs","H_Cap_usblack","H_Cap_blk_ION","H_Cap_blk","H_Cap_headphones","H_HeadSet_black_F"]];
_militiaLoadoutData set ["backpacks", ["B_AssaultPack_blk", "B_CivilianBackpack_01_Everyday_Black_F", "B_Carryall_blk"]];

_militiaLoadoutData set ["ATLaunchers", ["launch_RPG7_F"]];
_militiaLoadoutData set ["missileATLaunchers", ["launch_RPG7_F"]];

_militiaLoadoutData set ["rifles", [
["arifle_AKM_F", "", "", "", ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_F"], [], ""],
["arifle_AKM_F", "", "", "", ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_F"], [], ""],
"srifle_DMR_06_olive_F"
]];
_militiaLoadoutData set ["carbines", [
["arifle_AKS_F", "", "", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["arifle_AK12_GL_F", "", "acc_flashlight", "", ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["SMG_05_F", "", "acc_flashlight", "", [], [], ""],
["hgun_PDW2000_F", "", "", "optic_Aco_smg", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["arifle_RPK12_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_F"], [], ""],
["arifle_AKM_F", "", "", "", ["75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_Tracer_F"], [], ""],
["LMG_03_F", "", "acc_flashlight", "", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["arifle_SPAR_02_blk_F", "", "", "optic_SOS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["srifle_DMR_06_olive_F", "", "", "optic_KHS_blk", [], [], "bipod_01_F_blk"]
]];
_militiaLoadoutData set ["sidearms", ["hgun_P07_blk_F"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_B_T_Soldier_SL_F"]];
_crewLoadoutData set ["vests", ["V_BandollierB_rgr"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_B"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_B_HeliPilotCoveralls"]];
_pilotLoadoutData set ["vests", ["V_TacVest_blk"]];
_pilotLoadoutData set ["helmets", ["H_CrewHelmetHeli_B", "H_PilotHelmetHeli_B"]];


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
      [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_medic"] call _fnc_addItemSet;
    ["items_medic_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;


    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate= {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 7] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
    call _unarmedTemplate;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
    params ["_name", "_loadoutTemplate"];
    private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
    private _finalName = _prefix + _name;
    [_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
    ["SquadLeader", _policeTemplate],
    ["Standard", _policeTemplate]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;