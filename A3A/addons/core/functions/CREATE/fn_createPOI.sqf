if (!isServer and hasInterface) exitWith{};
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private ["_pos","_veh","_roads","_conquered","_dirVeh","_markerX","_positionX","_vehiclesX","_soldiers","_radiusX","_bunker","_groupE","_unit","_typeGroup","_groupX","_timeLimit","_dateLimit","_dateLimitNum","_base","_dog","_sideX","_cfg","_isFIA","_leave","_isControl","_radiusX","_typeVehX","_typeUnit","_markersX","_frontierX","_uav","_groupUAV","_allUnits","_closest","_winner","_timeLimit","_dateLimit","_dateLimitNum","_size","_base","_mineX","_loser","_sideX"];




params ["_markerX"];
_positionX = getMarkerPos _markerX;
_sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);

ServerInfo_2("Spawning Control Point %2 %1", _markerX, _sideX);

if ((_sideX == teamPlayer) or (_sideX == sideUnknown)) exitWith {};
if ({if ((sidesX getVariable [_x,sideUnknown] != _sideX) and (_positionX inArea _x)) exitWith {1}} count markersX >1) exitWith {};
_vehiclesX = [];
_soldiers = [];
private _dogs = [];
private _groups = [];
_pilots = [];
_conquered = false;
_groupX = grpNull;
_isFIA = false;
_leave = false;



private _A3A_fnc_POI_Battle = { 
	#include "..\POI\poi_CivPolBattle.sqf"
};


//Weights for events 
_proxyTown = 0;
_rebelTown = 0;
_occupTown = 0;
_invadTown = 0;
_rebInfluenceTown = 0;
_occInfluenceTown = 0;
_proxyAnyOutpost = 0;
_proxyRebOutpost = 0;
_proxyOccOutpost = 0;
_proxyInvOutpost = 0;

private _invaderEvents = [];
private _militaryEvents = [];
private _militiaEvents = [];
private _policeEvents = [];
private _civilianEvents = [];
private _rebelEvents = [_A3A_fnc_POI_Battle];

private _eventClass = ["INVADER", "MILITARY", "MILITIA", "POLICE", "CIV", "REBEL"];
private _eventClass = "REBEL";
private _eventFunc = _A3A_fnc_POI_Battle;

private _params = [_markerX];

private _eventReturn = [];

switch (_eventType) do {
	case "INVADER": {};
	case "MILITARY": {};
	case "MILITIA": {};
	case "POLICE": {};
	case "CIV": {};
	case "REBEL": {
		_eventReturn = _params call _eventFunc;
	};
};

if(count _eventReturn == 0) then {_leave = true};
if (_leave) exitWith {};

_groups = _eventReturn#0;
_soldiers = _eventReturn#1;
_vehiclesX = _eventReturn#2;
_dogs = _eventReturn#3;
_pilots = _eventReturn#04;

{ _x setVariable ["originalPos", getPos _x] } forEach _vehiclesX;

_spawnStatus = 0;
while {(spawner getVariable _markerX != 2) and ({[_x,_markerX] call A3A_fnc_canConquer} count _soldiers > 0)} do
	{
	if ((spawner getVariable _markerX == 1) and (_spawnStatus != spawner getVariable _markerX)) then
		{
		_spawnStatus = 1;
		if (isMultiplayer) then
			{
			{if (vehicle _x == _x) then {[_x,false] remoteExec ["enableSimulationGlobal",2]}} forEach _soldiers
			}
		else
			{
			{if (vehicle _x == _x) then {_x enableSimulationGlobal false}} forEach _soldiers
			};
		}
	else
		{
		if ((spawner getVariable _markerX == 0) and (_spawnStatus != spawner getVariable _markerX)) then
			{
			_spawnStatus = 0;
			if (isMultiplayer) then
				{
				{if (vehicle _x == _x) then {[_x,true] remoteExec ["enableSimulationGlobal",2]}} forEach _soldiers
				}
			else
				{
				{if (vehicle _x == _x) then {_x enableSimulationGlobal true}} forEach _soldiers
				};
			};
		};
	sleep 3;
	};
["locationSpawned", [_markerX, "POI", true]] call EFUNC(Events,triggerEvent);

waitUntil {sleep 1;((spawner getVariable _markerX == 2))  or ({[_x,_markerX] call A3A_fnc_canConquer} count _soldiers == 0)};

waitUntil {sleep 1;(spawner getVariable _markerX == 2)};


{ if (alive _x) then { deleteVehicle _x } } forEach (_soldiers + _pilots);
{ deleteVehicle _x } forEach _dogs;

{ deleteGroup _x } forEach _groups;

{
	// delete all vehicles that haven't been captured
	if (_x getVariable ["ownerSide", _sideX] == _sideX) then {
		if (_x distance2d (_x getVariable "originalPos") < 100) then { deleteVehicle _x }
		else { if !(_x isKindOf "StaticWeapon") then { [_x] spawn A3A_fnc_VEHdespawner } };
	};
} forEach _vehiclesX;

["locationSpawned", [_markerX, "POI", false]] call EFUNC(Events,triggerEvent);
