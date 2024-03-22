#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _filename = "fn_cargoSeats";
params ["_veh", "_sideX"];

private _faction = Faction(_sideX);
private _isMilitia = _veh in ((_faction get "vehiclesMilitiaLightArmed") + (_faction get "vehiclesMilitiaTrucks") + (_faction get "vehiclesMilitiaCars"));
if(!_isMilitia) then {
	private _mult = [2,4] select (_sideX == Invaders);
	_isMilitia = (random 10 > (tierWar * _mult) );
	if(_isMilitia) then {
		_isMilitia = !(_veh in ((_faction get "vehiclesLightUnarmed") + (_faction get "vehiclesLightArmedTroop") + (_faction get "vehiclesAPCs") + (_faction get "vehiclesIFVs") + (_faction get "vehiclesPlanesTransport")));
	};
};
private _totalSeats = [_veh, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
private _crewSeats = [_veh, false] call BIS_fnc_crewCount; // Number of crew seats only
private _cargoSeats = _totalSeats - _crewSeats;
if (_veh in (_faction get "vehiclesPolice")) then { _cargoSeats = 4 min _cargoSeats };

if (_cargoSeats < 2) exitwith { [] };

if (_cargoSeats < 4) exitWith
{
	if (_veh in (_faction get "vehiclesPolice")) exitWith { _faction get "groupPolice" };
	if (_isMilitia) exitWith { selectRandom (_faction get "groupsMilitiaSmall") };
	_faction get "groupSentry";
};

if (_cargoSeats < 6 or { _cargoSeats == 6 and random 3 < 1}) exitWith			// 6-man normally uses clipped full squad
{
	if (_veh in (_faction get "vehiclesPolice")) exitWith { (_faction get "groupPolice") + [_faction get "unitPoliceGrunt", _faction get "unitPoliceGrunt"] };
	if (_isMilitia) exitWith { selectRandom (_faction get "groupsMilitiaMedium") };
	selectRandom (_faction get "groupsMedium");
};

private _squad = call {
	if (_isMilitia) exitWith { selectRandom (_faction get "groupsMilitiaSquads") };
    selectRandom (_faction get "groupsSquads");
};
while { count _squad > (_totalSeats - _crewSeats) } do {
	_squad deleteAt (1 + floor random (count _squad - 1));		// don't remove the squad leader
};
_squad;
