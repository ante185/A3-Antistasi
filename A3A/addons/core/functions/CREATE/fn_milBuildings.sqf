#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_positionX","_size","_buildings","_groupX","_typeUnit","_sideX","_building","_typeB","_frontierX","_typeVehX","_veh","_vehiclesX","_soldiers","_pos","_ang","_markerX","_unit","_return"];
_markerX = _this select 0;
_positionX = getMarkerPos _markerX;
_size = _this select 1;
_buildings = nearestObjects [_positionX, A3A_milBuildingWhitelist, _size, true];
_buildings = _buildings inAreaArray _markerX;

if (count _buildings == 0) exitWith {[grpNull,[],[]]};

_sideX = _this select 2;
private _faction = Faction(_sideX);
_frontierX = _this select 3;

_vehiclesX = [];
_soldiers = [];
private _spawnsUsed = [];

_groupX = createGroup _sideX;
_typeUnit = _faction get "unitStaticCrew";

//New system to place helis, does not care about heli types currently
private _helicopterTypes = [];
_helicopterTypes append (_faction get "vehiclesHelisLight");
private _count = 1 + round (random 3); //Change these numbers as you want, first number is minimum, max is first plus second number
while {_count > 0} do
{
    if (_helicopterTypes isEqualTo []) exitWith {}; //no helis to pick from
    _typeVehX = selectRandom _helicopterTypes;
    private _spawnParameter = [_markerX, "Heli"] call A3A_fnc_findSpawnPosition;
    if !(_spawnParameter isEqualType []) exitWith {};       // out of spawn places
    _spawnsUsed pushBack _spawnParameter#2;
    _veh = createVehicle [_typeVehX, (_spawnParameter select 0), [],0, "CAN_COLLIDE"];
    _veh setDir (_spawnParameter select 1);
    _vehiclesX pushBack _veh;
    _count = _count - 1;
};

//Spawning certain statics on fixed buildingPos of chosen buildings

private _fnc_spawnStatic = {
    params ["_type", "_pos", "_dir"];
    private _veh = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
    if (!isNil "_dir") then { _veh setDir _dir };
    private _unit = [_groupX, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
    _unit moveInGunner _veh;
    [_unit,_markerX] call A3A_fnc_NATOinit;
    _soldiers pushBack _unit;
    _vehiclesX pushBack _veh;
    _veh;
};

private _fnc_spawnStaticUnit = {
    params ["_type", "_pos", "_dir"];
	private _unit = [_groupX, _type, _pos, [], 0, "NONE"] call A3A_fnc_createUnit;
    if (!isNil "_dir") then { _unit setDir _dir };
    _unit disableAI "PATH"; //block moving
    _unit setUnitPos "UP"; //force standing
    [_unit,_markerX] call A3A_fnc_NATOinit;
    _unit setPosATL _pos;
    _soldiers pushBack _unit;
    _unit;
};

for "_i" from 0 to (count _buildings) - 1 do
{
    if (spawner getVariable _markerX == 2) exitWith {};
    private _building = _buildings select _i;
    private _typeB = typeOf _building;

    call {
        if (damage _building >= 1 or isObjectHidden _building) exitWith {};			// don't put statics on destroyed buildings
        //Static MGs
        if 	((_typeB == "Land_Cargo_Patrol_V1_F") or (_typeB == "Land_Cargo_Patrol_V2_F") or (_typeB == "Land_Cargo_Patrol_V3_F") or (_typeB == "Land_Cargo_Patrol_V4_F")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 1);
            private _pos = _zpos getPos [1.5, _dir];			// zeroes Z value because BIS
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_Hlaska") or (_typeB == "Land_vn_hlaska")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building);
            private _zpos = AGLToASL (_building buildingPos 1);
            private _pos = _zpos getPos [0.5, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if 	((_typeB == "Land_fortified_nest_small_EP1") or (_typeB == "Land_BagBunker_Small_F") or (_typeB == "Land_BagBunker_01_small_green_F") or (_typeB == "Land_fortified_nest_small") or (_typeB == "Fort_Nest") or (_typeB == "Land_vn_bagbunker_01_small_green_f") or (_typeB == "Land_vn_bagbunker_small_f") or (_typeB == "Land_vn_o_shelter_05")or (_typeB == "Land_vn_bunker_small_01")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 1);
            private _pos = _zpos getPos [-1, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
		};
 		if 	((_typeB == "Land_vn_o_tower_02")) exitWith
         {
             private _type = selectRandom (_faction get "staticMGs");
             private _dir = (getDir _building) - 90;
             private _zpos = AGLToASL (_building buildingPos 1);
             private _pos = _zpos getPos [0.5, _dir];
             _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
             [_type, _pos, _dir] call _fnc_spawnStatic;
         };
 		if 	((_typeB == "Land_vn_hut_tower_01")) exitWith
         {
             private _type = selectRandom (_faction get "staticMGs");
             private _dir = (getDir _building) - 180;
             private _zpos = AGLToASL (_building buildingPos 5);
             private _pos = _zpos getPos [1, _dir];
             _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
             [_type, _pos, _dir] call _fnc_spawnStatic;
         };
 		if 	((_typeB == "Land_vn_o_platform_05") or (_typeB == "Land_vn_o_platform_06")) exitWith
         {
             private _type = selectRandom (_faction get "staticMGs");
             private _dir = (getDir _building) - 270;
             private _zpos = AGLToASL (_building buildingPos 5);
             private _pos = _zpos getPos [0.5, _dir];
             _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
             [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_vn_b_trench_bunker_04_01")) exitWith
         {
             private _type = selectRandom (_faction get "staticMGs");
             private _dir = (getDir _building) + 90;
             private _zpos = AGLToASL (_building buildingPos 4);
             private _pos = _zpos getPos [-1.5, _dir];
             _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
             [_type, _pos, _dir] call _fnc_spawnStatic;

        };
        if 	((_typeB == "Land_Cargo_Tower_V1_F") or (_typeB == "Land_Cargo_Tower_V1_No1_F") or (_typeB == "Land_Cargo_Tower_V1_No2_F") or (_typeB == "Land_Cargo_Tower_V1_No3_F") or (_typeB == "Land_Cargo_Tower_V1_No4_F") or (_typeB == "Land_Cargo_Tower_V1_No5_F") or (_typeB == "Land_Cargo_Tower_V1_No6_F") or (_typeB == "Land_Cargo_Tower_V1_No7_F") or (_typeB == "Land_Cargo_Tower_V2_F") or (_typeB == "Land_Cargo_Tower_V3_F") or (_typeB == "Land_Cargo_Tower_V4_F")) exitWith			// just the big towers which have 3 .50 cals on top
        {
            private _type = selectRandom (_faction get "staticMGs");
            _dir = getDir _building;
            _zOffset = [0, 0, -0.3]; //fix spawn hight
            _Tdir = _dir + 90; //relative rotation to building
            _zpos = AGLToASL (_building buildingPos 11); //relative East
            _pos = _zpos getPos [-1, _Tdir]; //offset
            _zpos = _zpos vectorAdd _zOffset;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _Tdir] call _fnc_spawnStatic;
            sleep 0.5;			// why only here?
            _Tdir = _dir + 0;
            _zpos = AGLToASL (_building buildingPos 13); //relative North
            _pos = _zpos getPos [-0.8, _Tdir]; //offset
            _zpos = _zpos vectorAdd _zOffset;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _Tdir] call _fnc_spawnStatic;
            sleep 0.5;
            _Tdir = _dir + 180;
            _zpos = AGLToASL (_building buildingPos 16); //relative South
            _pos = _zpos getPos [-0.2, _Tdir]; //offset
            _zpos = _zpos vectorAdd _zOffset;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _Tdir] call _fnc_spawnStatic;
        };
        if     ((_typeB == "Land_SPE_Sandbag_Nest")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building);
            private _pos = _building modelToWorld [0.0065918,-0.489746,-0.417223];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if     ((_typeB == "Fort_EnvelopeSmall") or (_typeB == "Fort_EnvelopeSmall_EP1")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building);
            private _pos = _building modelToWorld ([[0,1.5,-0.15], [0,1.7,0.02]] select (_type == "LIB_M1919_M2"));
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if     ((_typeB == "Land_WW2_BET_MG_Nest_Splinter_A") or (_typeB == "Land_WW2_BET_MG_Nest_Splinter_B")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building);
            private _pos = _building modelToWorld ([[0.0,2.6,0.4], [0.0,2.6,0.6]] select (_type == "LIB_M1919_M2"));
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if     ((_typeB == "Land_WW2_BET_MG_Nest")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _offset = [0,0,0];
            switch (_type) do {
                case "LIB_M1919_M2": {_offset = [0.30,3.5,0.55]};
                case "LIB_Maxim_M30_base": {_offset = [0.30,3.5,0.4]};
                case "LIB_MG34_Lafette_low_Deployed";
                case "LIB_MG42_Lafette_low_Deployed": {_offset = [0.30,3.5,0.0]};
            };
            private _dir = (getDir _building);
            private _pos = _building modelToWorld _offset;
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };

        //Static AAs
		if 	((_typeB == "Land_Radar_01_HQ_F") or (_typeB == "Land_vn_radar_01_hq_f")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = getDir _building;
            private _zpos = AGLToASL (_building buildingPos 30);
            private _pos = getPosASL _building;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if 	((_typeB == "Land_Cargo_HQ_V1_F") or (_typeB == "Land_Cargo_HQ_V2_F") or (_typeB == "Land_Cargo_HQ_V3_F") or (_typeB == "Land_Cargo_HQ_V4_F")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = getDir _building;
            private _zpos = AGLToASL (_building buildingPos 8);
            private _pos = getPosASL _building;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_vn_cementworks_01_grey_f")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = getDir _building;
            private _zpos = AGLToASL (_building buildingPos 24);
            private _pos = getPosASL _building;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_vn_cementworks_01_brick_f")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = getDir _building;
            private _zpos = AGLToASL (_building buildingPos 20);
            private _pos = getPosASL _building;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_vn_a_office01")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = (getDir _building) + 180;
            private _zpos = AGLToASL (_building buildingPos 8);
			private _pos = _zpos getPos [1.5, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_WW2_TrenchTank")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = (getDir _building);
            private _pos = _building modelToWorld [0,-1.2,-0.55];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_WW2_BET_Flak_Bettung")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = (getDir _building);
            private _pos = _building modelToWorld [-1.0,0.6,-0.2];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_I44_Buildings_Bunker_AA")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = (getDir _building);
            private _pos = _building modelToWorld [2.0,-2.1,0.3];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        
        //IFA Mortar = Land_WW2_Trench_Mortar 
        //IFA AA = Land_WW2_TrenchTank Land_WW2_BET_Flak_Bettung Land_I44_Buildings_Bunker_AA
        //IFA AT = Land_WW2_BET_RGB669_Pak_L Land_WW2_BET_RGB669_Pak_R
        //IFA AA/AT = Land_WW2_Trench76 Land_Fort_Bagfence_Bunker Land_WW2_LAWZ_Tobruk_Trench_gunposition
        
        //Static ATs
		if 	((_typeB == "Land_WW2_BET_RGB669_Pak_L") or (_typeB == "Land_WW2_BET_RGB669_Pak_L_Splinter") or (_typeB == "Land_WW2_BET_RGB669_Pak_R") or (_typeB == "Land_WW2_BET_RGB669_Pak_R_Splinter")) exitWith
        {
            private _type = selectRandom (_faction get "staticAT");
            private _dir = (getDir _building);
            private _pos = _building modelToWorld [0.0,1.6,-0.55];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        
        //Static AT or AA
		if 	((_typeB == "Land_Fort_Bagfence_Bunker")) exitWith
        {
            private _type = selectRandom (_faction get "staticAT");
            private _dir = (getDir _building);
            private _pos = _building modelToWorld [0,0,-0.8];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_WW2_LAWZ_Tobruk_Trench_gunposition")) exitWith
        {
            private _type = selectRandom (_faction get "staticAT");
            private _dir = (getDir _building) + 180;
            private _pos = _building modelToWorld [0,0,0.1];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_WW2_Trench76")) exitWith
        {
            private _type = selectRandom (_faction get "staticAT");
            private _dir = (getDir _building);
            private _pos = _building modelToWorld [-1.2,-0.6,0.0];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        
        //Static Decorative
		if 	((_typeB == "Land_Setka_Car")) exitWith
        {
            private _type = selectRandom ((_faction get "vehiclesMilitiaCars") + (_faction get "vehiclesLightUnarmed"));
            private _dir = (getDir _building) + 90;
            private _zpos = AGLToASL (getPos _building);
			private _pos = _zpos getPos [1.5, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
    };
};

//Spawning Marksmen on fixed buildingPos of chosen buildings
for "_i" from 0 to (count _buildings) - 1 do
{
    if (spawner getVariable _markerX == 2) exitWith {};
    private _building = _buildings select _i;
    private _typeB = typeOf _building;

    call {
        if (isObjectHidden _building) exitWith {};            // don't put statics on destroyed buildings
        if     ((_typeB == "Land_vn_o_snipertree_01") or (_typeB == "Land_vn_o_snipertree_02") or (_typeB == "Land_vn_o_snipertree_03") or (_typeB == "Land_vn_o_snipertree_04") or (_typeB == "Land_vn_o_platform_01") or (_typeB == "Land_vn_o_platform_02") or (_typeB == "Land_vn_o_platform_03")) exitWith
        {
            private _type = _faction get "unitMarksman";
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 0);
            private _pos = _zpos getPos [0, _dir];            // zeroes Z value because BIS
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _unit = [_type, _pos, _dir] call _fnc_spawnStaticUnit;
        };
    };
};

//Spawning Riflemen on fixed buildingPos of chosen buildings
for "_i" from 0 to (count _buildings) - 1 do
{
    if (spawner getVariable _markerX == 2) exitWith {};
    private _building = _buildings select _i;
    private _typeB = typeOf _building;

    call {
        if (isObjectHidden _building) exitWith {};            // don't put statics on destroyed buildings
        if     ((_typeB == "Land_vn_b_tower_01")) exitWith
        {
            private _type = _faction get "unitGrunt";
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 0);
            private _pos = _zpos getPos [0, _dir];            // zeroes Z value because BIS
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _unit = [_type, _pos, _dir] call _fnc_spawnStaticUnit;
        };
    };
};



[_groupX,_vehiclesX,_soldiers,_spawnsUsed]
