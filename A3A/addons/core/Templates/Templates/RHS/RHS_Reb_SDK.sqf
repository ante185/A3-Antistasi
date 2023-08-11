///////////////////////////
//   Rebel Information   //
///////////////////////////

//Combination RHS & 3CB tanoan rebel faction

["name", "SDK"] call _fnc_saveToTemplate;

["flag", "Flag_Syndikat_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F_exp\Flags\Flag_Synd_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Syndicat"] call _fnc_saveToTemplate;

private _vehiclesBasic = ["I_G_Quadbike_01_F"];
private _vehiclesLightUnarmed = ["I_C_Offroad_02_unarmed_F", "rhsgref_tla_g_offroad"];
private _vehiclesLightArmed = ["rhsgref_tla_g_offroad_armed"];
private _vehiclesTruck = ["rhs_gaz66_msv","rhs_gaz66o_msv"];
private _vehiclesAT = ["rhsgref_tla_g_offroad_at"];
private _vehiclesAA = ["rhs_gaz66_zu23_msv"];

private _vehiclesBoat = ["I_C_Boat_Transport_02_F"];

private _vehiclesPlane = [];
private _vehiclesCivPlane = ["C_Plane_Civil_01_F"];
private _vehiclesMedical = ["rhs_gaz66_ap2_msv"];

private _vehiclesCivCar = ["C_Offroad_01_F", "C_Offroad_02_unarmed_F"];
private _vehiclesCivTruck = ["RHS_Ural_Open_Civ_02","C_Van_01_transport_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F"];
private _vehiclesCivHeli = ["RHS_Mi8t_civilian"];
private _vehiclesCivBoat = ["C_Boat_Civil_01_F", "C_Rubberboat"];

private _staticMGs = ["rhsgref_tla_g_DSHKM",  "rhsgref_tla_g_DSHKM_Mini_TriPod", "rhsgref_hidf_m2_static_minitripod"];
private _staticAT = ["rhsgref_tla_g_SPG9"];
private _staticAA = ["rhsgref_tla_g_ZU23"];
["staticMortars", ["rhsgref_cdf_reg_M252"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "rhs_mag_mine_ptm1"] call _fnc_saveToTemplate;
["mineAPERS", "rhs_mine_ozm72_b_mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["rhs_ec75_mag", 2], ["rhs_ec75_sand_mag", 2], ["rhs_ec200_mag", 1], ["rhs_ec200_sand_mag", 1], ["rhsusf_m112_mag", 1], ["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["rhs_ec75_mag", 4], ["rhs_ec75_sand_mag", 4], ["rhs_ec200_mag", 2], ["rhs_ec200_sand_mag", 2], ["rhs_ec400_mag", 1], ["rhs_ec400_sand_mag", 1],["DemoCharge_Remote_Mag", 2], ["rhsusf_m112_mag", 2], ["rhsusf_m112x4_mag", 1], ["rhs_charge_M2tet_x2_mag", 1], ["SatchelCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;

if (isClass (configFile >> "CfgPatches" >> "UK3CB_Factions_Common")) then {
    _vehiclesBasic = ["UK3CB_FIA_I_TT650"];
    _vehiclesLightUnarmed = ["UK3CB_MDF_I_MB4WD_Unarmed", "UK3CB_FIA_I_LR_Closed", "UK3CB_FIA_I_LR_Open", "UK3CB_FIA_I_Datsun_Open"];
    _vehiclesLightArmed = ["UK3CB_I_G_LandRover_M2", "UK3CB_MDF_I_MB4WD_LMG","UK3CB_I_G_LandRover_SF_M2"];
    _vehiclesTruck = ["UK3CB_KDF_I_Gaz66_Covered","UK3CB_KDF_I_Gaz66_Open"];
    _vehiclesAT = ["UK3CB_MDF_I_MB4WD_AT", "UK3CB_I_G_LandRover_SPG9"];
    _vehiclesAA = ["UK3CB_KDF_I_Gaz66_ZU23"];
    
    _vehiclesBoat append ["UK3CB_I_G_Fishing_Boat_SPG9", "UK3CB_CHD_I_Fishing_Boat_Zu23_front"];
    
    _vehiclesPlane = ["UK3CB_FIA_I_C400", "UK3CB_I_G_Antonov_An2_Armed"];
    _vehiclesCivPlane = ["UK3CB_C_Cessna_172"];
    _vehiclesMedical = ["UK3CB_FIA_I_Hilux_Ambulance"];
    
    _vehiclesCivCar = ["C_Offroad_02_unarmed_F", "UK3CB_C_LandRover_Closed", "UK3CB_C_LandRover_Open", "UK3CB_C_Datsun_Open", "UK3CB_C_Gaz24", "UK3CB_C_Skoda", "UK3CB_C_S1203", "UK3CB_C_MMT"];
    _vehiclesCivTruck = ["RHS_Ural_Open_Civ_02","C_Van_01_transport_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F"];
    _vehiclesCivHeli = ["UK3CB_C_Mi8AMT_ADC"];
    _vehiclesCivBoat = ["UK3CB_CHC_C_Fishing_Boat", "C_Rubberboat"];
    
    _staticMGs append ["UK3CB_NAP_I_PKM_High",  "UK3CB_NAP_I_PKM_Low"];
};

["vehiclesBasic", _vehiclesBasic] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesTruck", _vehiclesTruck] call _fnc_saveToTemplate;
["vehiclesAT", _vehiclesAT] call _fnc_saveToTemplate;
["vehiclesAA", _vehiclesAA] call _fnc_saveToTemplate;

["vehiclesBoat", _vehiclesBoat] call _fnc_saveToTemplate;

["vehiclesPlane", _vehiclesPlane] call _fnc_saveToTemplate;
["vehiclesCivPlane", _vehiclesCivPlane] call _fnc_saveToTemplate;
["vehiclesMedical", _vehiclesMedical] call _fnc_saveToTemplate;

["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;
["vehiclesCivTruck", _vehiclesCivTruck] call _fnc_saveToTemplate;
["vehiclesCivHeli", _vehiclesCivHeli] call _fnc_saveToTemplate;
["vehiclesCivBoat", _vehiclesCivBoat] call _fnc_saveToTemplate;

["staticMGs", _staticMGs] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;

if (isClass (configFile >> "CfgPatches" >> "UK3CB_Factions_Common")) then {
    #include "..\3CB\3CB_Reb_Vehicle_Attributes.sqf"
} else {
    #include "RHS_Reb_Vehicle_Attributes.sqf"
};
///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
"rhs_weap_makarov_pm", "rhs_weap_tt33", "rhs_weap_Izh18", "rhs_weap_m38","rhs_weap_m38_rail",
["rhs_weap_rpg18", 50],
["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
"rhs_mag_9x18_8_57N181S", "rhs_mag_762x25_8", "rhsgref_1Rnd_00Buck", "rhsgref_1Rnd_Slug", "rhsgref_5Rnd_762x54_m38", "rhs_mag_f1", "rhs_grenade_mki_mag", "rhs_mag_rdg2_black", "rhs_grenade_m15_mag",
"B_FieldPack_blk", "B_FieldPack_cbr", "B_FieldPack_green_F", "B_FieldPack_khk", "B_FieldPack_oli",
"rhsgref_chestrig", "rhsgref_chicom", "rhs_vydra_3m", "rhs_vest_pistol_holster", "rhs_vest_commander", "rhs_6sh46", "rhsgref_alice_webbing",
"rhs_acc_2dpZenit", "Binocular"];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr", "tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155", "tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr", "TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155", "TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"];


if (isClass (configFile >> "CfgPatches" >> "UK3CB_Factions_Common")) then {
    _initialRebelEquipment append ["uk3cb_enfield_no4_walnut","uk3cb_no4_enfield_303_10Rnd_magazine_Y","uk3cb_no4_enfield_303_10Rnd_magazine_YT",["uk3cb_1rnd_riflegrenade_mas_at_l", 75]];
    } else { _initialRebelEquipment append [["rhs_weap_rpg18", 50]];
};

["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_leader",
    "U_IG_Guerrilla_6_1",
    "U_I_G_resistanceLeader_F",
    "rhsgref_uniform_tigerstripe",
    "rhsgref_uniform_altis_lizard_olive"
];

private _dlcUniforms = [];

if (allowDLCExpansion) then {_dlcUniforms append [
    "U_I_C_Soldier_Bandit_4_F",
    "U_I_C_Soldier_Bandit_1_F",
    "U_I_C_Soldier_Bandit_2_F",
    "U_I_C_Soldier_Bandit_5_F",
    "U_I_C_Soldier_Bandit_3_F",
    "U_I_C_Soldier_Para_2_F",
    "U_I_C_Soldier_Para_3_F",
    "U_I_C_Soldier_Para_5_F",
    "U_I_C_Soldier_Para_4_F",
    "U_I_C_Soldier_Para_1_F",
    "U_I_C_Soldier_Camo_F"
];
};
if (allowDLCEnoch) then {_dlcUniforms append [
    "U_I_L_Uniform_01_camo_F",
    "U_I_L_Uniform_01_deserter_F"
];
};

if (allowDLCWS) then {_dlcUniforms append [
    "U_lxWS_ION_Casual1",
    "U_lxWS_ION_Casual2",
    "U_lxWS_ION_Casual3",
    "U_lxWS_ION_Casual4",
    "U_lxWS_ION_Casual5",
    "U_lxWS_SFIA_deserter"
];
};

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", [
    "H_Booniehat_khk_hs",
    "H_Booniehat_tan",
    "H_Cap_tan",
    "H_Cap_oli_hs",
    "H_Cap_blk",
    "H_Cap_headphones",
    "H_ShemagOpen_tan",
    "H_Shemag_olive_hs",
    "H_Bandanna_khk_hs",
    "H_Bandanna_sand",
    "H_Bandanna_cbr"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04",
"TanoanHead_A3_05","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08"]] call _fnc_saveToTemplate;
["voices", ["Male01FRE","Male02FRE","Male03FRE"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
