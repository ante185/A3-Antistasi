//////////////////////////
//       Vehicles       //
//////////////////////////    
["vehiclesCivCar", [ 
    "Renault_AG_1910_Red", 7, 
    "peugeot_500cc", 7,
    "Cadillac1903_4seat", 3.5, 
    "Cadillac1903_2seat", 3.5, 
    "Mercedes_race_1914", 3.5, 
    "legano_1908", 3.5, 
    "legano_1908_open", 3.5, 
    "Peugeot_bebe_1916_blue", 1.15, 
    "Peugeot_bebe_1916_brown", 1.15, 
    "Peugeot_bebe_1916_grey", 1.15, 
    "Peugeot_bebe_1916_red", 1.15, 
    "Peugeot_bebe_1916_white", 1.15, 
    "Peugeot_bebe_1916_yellow", 1.15, 
    "Peugeot_bebe_1916_open_blue", 1.0, 
    "Peugeot_bebe_1916_open_brown", 1.0, 
    "Peugeot_bebe_1916_open", 1.0, 
    "Peugeot_bebe_1916_open_grey", 1.0, 
    "Peugeot_bebe_1916_open_red", 1.0, 
    "Peugeot_bebe_1916_open_white", 1.0, 
    "Peugeot_bebe_1916_open_yellow", 1.0
]] call _fnc_saveToTemplate;             //this line determines civilian cars -- Example: ["vehiclesCivCar", ["C_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesCivIndustrial", [
    "Cadillac1903_truck", 5, 
    "fordT_truck_tonneau", 4, 
    "fordT_truck_bache", 1, 
    "fordT_truck_benne", 1, 
    "Berlier_cba", 1
]] call _fnc_saveToTemplate;             //this line determines civilian trucks -- Example: ["vehiclesCivIndustrial", ["C_Truck_02_transport_F"]] -- Array, can contain multiple assets

["vehiclesCivHeli", []] call _fnc_saveToTemplate;             //this line determines civilian helis -- Example: ["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] -- Array, can contain multiple assets

["vehiclesCivBoat", ["B_Boat_Transport_01_F", 0.2]] call _fnc_saveToTemplate;             //this line determines civilian boats -- Example: ["vehiclesCivBoat", ["C_Boat_Civil_01_F"]] -- Array, can contain multiple assets

//Do we want vehicles of these kinds in this modset?
["vehiclesCivRepair", []] call _fnc_saveToTemplate;            //this line determines civilian repair vehicles

["vehiclesCivMedical", []] call _fnc_saveToTemplate;        //this line determines civilian medic vehicles

["vehiclesCivFuel", []] call _fnc_saveToTemplate;            //this line determines civilian fuel vehicles

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_6","WhiteHead_02","WhiteHead_04","WhiteHead_05","WhiteHead_09","WhiteHead_11","WhiteHead_13","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
"U_LIB_CIV_Citizen_1",
"U_LIB_CIV_Citizen_2",
"U_LIB_CIV_Citizen_3",
"U_LIB_CIV_Citizen_4",
"U_LIB_CIV_Citizen_5",
"U_LIB_CIV_Citizen_6",
"U_LIB_CIV_Citizen_7",
"U_LIB_CIV_Citizen_8",
"U_LIB_CIV_Villager_1",
"U_LIB_CIV_Villager_2",
"U_LIB_CIV_Villager_3",
"U_LIB_CIV_Villager_4",
"U_LIB_CIV_Woodlander_1",
"U_LIB_CIV_Woodlander_2",
"U_LIB_CIV_Woodlander_3",
"U_LIB_CIV_Woodlander_4",
"U_LIB_CIV_Worker_1",
"U_LIB_CIV_Worker_2",
"U_LIB_CIV_Worker_3",
"U_LIB_CIV_Worker_4"
];          //Uniforms given to Normal Civs

private _workerUniforms = [
"U_LIB_CIV_Worker_1",
"U_LIB_CIV_Worker_2",
"U_LIB_CIV_Worker_3",
"U_LIB_CIV_Worker_4"
];           //Uniforms given to Workers at Factories/Resources

"wwi_French_Names" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////


private _pressUniforms = [
"U_LIB_CIV_Functionary_1", 
"U_LIB_CIV_Assistant", 
"U_LIB_CIV_Assistant_2", 
"U_LIB_CIV_Doctor", 
"U_LIB_CIV_Schoolteacher", 
"U_LIB_CIV_Schoolteacher_2"
];            //Uniforms given to Press/Journalists

["uniforms", _civUniforms + ["U_LIB_CIV_Functionary_1"] + _workerUniforms] call _fnc_saveToTemplate;          //Uniforms given to the Arsenal, Allowed for Undercover and given to Rebel Ai that go Undercover

_civhats = [
"H_LIB_CIV_Villager_Cap_1",
"H_LIB_CIV_Villager_Cap_2",
"H_LIB_CIV_Villager_Cap_3",
"H_LIB_CIV_Villager_Cap_4"
];

if(A3A_climate == "arctic") then {
    _civhats append [
    "H_LIB_CIV_Worker_Cap_1",
    "H_LIB_CIV_Worker_Cap_2",
    "H_LIB_CIV_Worker_Cap_3",
    "H_LIB_CIV_Worker_Cap_4"
    ];
};

["headgear", _civHats] call _fnc_saveToTemplate;            //Headgear given to Normal Civs, Workers, Undercover Rebels.

_civhats append ["H_HeadBandage_clean_F", "H_HeadBandage_stained_F", "H_HeadBandage_bloody_F"];

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", []];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", []];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];


private _manTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["workerUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["pressUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _prefix = "militia";
private _unitTypes = [
    ["Press", _pressTemplate],
    ["Worker", _workerTemplate],
    ["Man", _manTemplate, nil, 10]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;