#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_group"];

//Pull lists of units in the group - ONLY alive units
private _Allunits = ((units _group) select {alive _x});
private _Leader = leader _group;
private _Crewmen = [];

{
	//Pull classname of unit.
	private _UnitClass = typeof _x;
	
	//Add to crewman list
	if (["crew", _UnitClass] call BIS_fnc_inString) then {
		_Crewmen pushBack _x;
	};
} foreach _Allunits;

//Now let's check for nearby vehicle from 
{
	if (count _Crewmen > 0) then {
		if (_x iskindof "Tank" && {crew _x isEqualTo []} && {_x distance _Leader < 150} && {locked _x != 2}) then {
			_group addvehicle _x;
			if (PATCOM_DEBUG) then {
				[_Leader, "VEHICLE FOUND", 5, "Green"] call A3A_fnc_debugText3D;
			};
		};				
	};

	if (_x iskindof "Car" && {crew _x isEqualTo []} && {_x distance _Leader < 150} && {locked _x != 2}) then {
		_group addvehicle _x;
		if (PATCOM_DEBUG) then {
			[leader _group, "VEHICLE FOUND", 5, "Green"] call A3A_fnc_debugText3D;
		};
	};

	if (_x iskindof "LandVehicle" && {crew _x isEqualTo []} && {_x distance _Leader < 150} && {locked _x != 2}) then {
		_group addvehicle _x;
		if (PATCOM_DEBUG) then {
			[leader _group, "VEHICLE FOUND", 5, "Green"] call A3A_fnc_debugText3D;
		};
	};
} foreach vehicles;