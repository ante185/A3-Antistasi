if (!isServer and hasInterface) exitWith {};
private ["_pos","_timeOut","_posbase","_posdestino","_soldados","_grupos","_vehiculos","_POWS","_tiempofin","_fechafin","_fechafinNum","_veh","_unit","_grupo","_lado","_cuenta","_nombredest"];
_destino = _this select 0;
_base = _this select 1;

_dificil = if (random 10 < tierWar) then {true} else {false};
_salir = false;
_contacto = objNull;
_grpContacto = grpNull;
_tsk = "";
_tsk1 = "";
_fechalimnum = 0;
if (_dificil) then
	{
	_posHQ = getMarkerPos "respawn_guerrila";
	_ciudades = ciudades select {getMarkerPos _x distance _posHQ < distanciaMiss};
	if (count _ciudades == 0) exitWith {_dificil = false};
	_ciudad = selectRandom _ciudades;

	_tam = [_ciudad] call sizeMarker;
	_posicion = getMarkerPos _ciudad;
	_casas = nearestObjects [_posicion, ["house"], _tam];
	_posCasa = [];
	_casa = objNull;
	while {count _posCasa == 0} do
		{
		_casa = selectRandom _casas;
		_posCasa = [_casa] call BIS_fnc_buildingPositions;
		_casas = _casas - [_casa];
		};
	_grpContacto = createGroup civilian;
	_pos = selectRandom _posCasa;
	_contacto = _grpContacto createUnit [selectRandom arrayCivs, _pos, [], 0, "NONE"];
	_contacto allowDamage false;
	_contacto setPos _pos;
	_contacto setVariable ["statusAct",false,true];
	_contacto forceSpeed 0;
	_contacto setUnitPos "UP";
	[_contacto,"missionGiver"] remoteExec ["flagaction",[buenos,civilian],_contacto];

	_nombredest = [_ciudad] call localizar;
	_tiempolim = 15;//120
	_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
	_fechalimnum = dateToNumber _fechalim;
	[[buenos,civilian],"CONVOY",[format ["An informant is awaiting for you in %1. Go there before %2:%3. He will provide you some info on our next task",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Contact Informer",_ciudad],position _casa,false,0,true,"talk",true] call BIS_fnc_taskCreate;
	//_tsk = ["CONVOY",[buenos,civilian],[format ["An informant is awaiting for you in %1. Go there before %2:%3. He will provide you some info on our next task",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Contact Informer",_ciudad],position _casa,"CREATED",5,true,true,"talk"] call BIS_fnc_setTask;
	//misiones pushBack _tsk; publicVariable "misiones";

	waitUntil {sleep 1; (_contacto getVariable "statusAct") or (dateToNumber date > _fechalimnum)};
	if (dateToNumber date > _fechalimnum) then
		{
		_salir = true
		}
	else
		{
		if ((lados getVariable [_destino,sideUnknown] == buenos) or (lados getVariable [_base,sideUnknown] == buenos) or ((lados getVariable [_base,sideUnknown] == malos) and (not (lados getVariable [_destino,sideUnknown] == malos))) or ((lados getVariable [_base,sideUnknown] == muyMalos) and (not (lados getVariable [_destino,sideUnknown] == muyMalos)))) then
			{
			_salir = true;
			{
			if (isPlayer _x) then {[_contacto,"globalChat","My information is useless now"] remoteExec ["commsMP",_x]}
			} forEach ([50,0,position _casa,"GREENFORSpawn"] call distanceUnits);
			};
		};
	[_contacto] spawn
		{
		_contacto = _this select 0;
		_grpContacto = group _contacto;
		sleep cleanTime;
		deleteVehicle _contacto;
		deleteGroup _grpContacto;
		};
	if (_salir) then
		{
		if (_contacto getVariable "statusAct") then
			{
			[0,"CONVOY"] spawn borrarTask
			}
		else
			{
			["CONVOY",[format ["An informant is awaiting for you in %1. Go there before %2:%3. He will provide you some info on our next task",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Contact Informer",_ciudad],position _casa,"FAILED"] call taskUpdate;
			[1200,"CONVOY"] spawn borrarTask;
			};
		};
	};

if (_salir) exitWith {};

if (_dificil) then
	{
	[0,"CONVOY"] spawn borrarTask;
	waitUntil {sleep 1; !(["CONVOY"] call BIS_fnc_taskExists)};
	};

_esFIA = false;
_lado = if (lados getVariable [_base,sideUnknown] == malos) then {malos} else {muyMalos};
//_cfg = "";
if (_lado == malos) then
	{
	if ((random 10 >= tierWar) and !(_dificil)) then
		{
		_esFIA = true;
		};
	};

_posbase = getMarkerPos _base;
_posdestino = getMarkerPos _destino;

_soldados = [];
_grupos = [];
_vehiculos = [];
_POWS = [];
_refuerzos = [];
_tipoVehEsc = "";
_tipoVehObj = "";
_tipogrupo = "";
_tiposConvoy = [];
_posHQ = getMarkerPos "respawn_guerrila";

_tiempofin = 120;
_fechafin = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempofin];
_fechafinNum = dateToNumber _fechafin;

private ["_tsk","_grpPOW","_pos"];

if ((_destino in aeropuertos) or (_destino in puestos)) then
	{
	_tiposConvoy = ["Municion","Armor"];
	if (_destino in puestos) then {if (((count (garrison getVariable [_destino,0]))/2) >= [_destino] call garrisonSize) then {_tiposConvoy pushBack "Refuerzos"}};
	//if (_lado == muyMalos) then {_tiposConvoy pushBack "Prisoners"};
	}
else
	{
	if (_destino in ciudades) then
		{
		if (lados getVariable [_destino,sideUnknown] == malos) then {_tiposConvoy = ["Supplies"]} else {_tiposConvoy = ["Supplies"]}
		}
	else
		{
		if ((_destino in recursos) or (_destino in fabricas)) then {_tiposConvoy = ["Money"]} else {_tiposConvoy = ["Prisoners"]};
		if (((count (garrison getVariable [_destino,0]))/2) >= [_destino] call garrisonSize) then {_tiposConvoy pushBack "Refuerzos"};
		};
	};

_tipoConvoy = selectRandom _tiposConvoy;

_tiempolim = if (_dificil) then {0} else {round random 10};// tiempo para que salga el convoy, deberíamos poner un round random 15
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_nombredest = [_destino] call localizar;
_nombreOrig = [_base] call localizar;
[_base,30] call addTimeForIdle;
_texto = "";
_taskState = "CREATED";
_taskTitle = "";
_taskIcon = "";
_taskState1 = "CREATED";

switch (_tipoConvoy) do
	{
	case "Municion":
		{
		_texto = format ["A convoy from %1 is about to depart at %2:%3. It will provide ammunition to %4. Try to intercept it. Steal or destroy that truck before it reaches it's destination.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest];
		_taskTitle = "Ammo Convoy";
		_taskIcon = "rearm";
		_tipoVehObj = if (_lado == malos) then {vehNATOAmmoTruck} else {vehCSATAmmoTruck};
		};
	case "Armor":
		{
		_texto = format ["A convoy from %1 is about to depart at %2:%3. It will reinforce %4 with armored vehicles. Try to intercept it. Steal or destroy that thing before it reaches it's destination.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest];
		_taskTitle = "Armored Convoy";
		_taskIcon = "Destroy";
		_tipoVehObj = if (_lado == malos) then {vehNATOAA} else {vehCSATAA};
		};
	case "Prisoners":
		{
		_texto = format ["A group os POW's is being transported from %1 to %4, and it's about to depart at %2:%3. Try to intercept it. Kill or capture the truck driver to make them join you and bring them to HQ. Alive if possible.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest];
		_taskTitle = "Prisoner Convoy";
		_taskIcon = "run";
		_tipoVehObj = if (_lado == malos) then {selectRandom vehNATOTrucks} else {selectRandom vehCSATTrucks};
		};
	case "Refuerzos":
		{
		_texto = format ["Reinforcements are being sent from %1 to %4 in a convoy, and it's about to depart at %2:%3. Try to intercept and kill all the troops and vehicle objective.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest];
		_taskTitle = "Reinforcements Convoy";
		_taskIcon = "run";
		_tipoVehObj = if (_lado == malos) then {selectRandom vehNATOTrucks} else {selectRandom vehCSATTrucks};
		};
	case "Money":
		{
		_texto = format ["A truck plenty of money is being moved from %1 to %4, and it's about to depart at %2:%3. Steal that truck and bring it to HQ. Those funds will be very welcome.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest];
		_taskTitle = "Money Convoy";
		_taskIcon = "move";
		_tipoVehObj = "C_Van_01_box_F";
		};
	case "Supplies":
		{
		_texto = format ["A truck with medical supplies destination %4 it's about to depart at %2:%3 from %1. Steal that truck bring it to %4 and let people in there know it is SDK who's giving those supplies.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest];
		_taskTitle = "Supply Convoy";
		_taskIcon = "heal";
		_tipoVehObj = "C_Van_01_box_F";
		};
	};
//if (!_dificil) then {[[buenos,civilian],"CONVOY",[_texto,_taskTitle,_destino],_posdestino,false,0,true,_taskIcon,true] call BIS_fnc_taskCreate} else {["CONVOY",[_texto,_taskTitle,_destino],_posdestino,_taskState,_taskIcon] call taskUpdate};
//misiones pushBack _tsk; publicVariable "misiones";
[[buenos,civilian],"CONVOY",[_texto,_taskTitle,_destino],_posdestino,false,0,true,_taskIcon,true] call BIS_fnc_taskCreate;
[[_lado],"CONVOY1",[format ["A convoy from %1 to %4, it's about to depart at %2:%3. Protect it from any possible attack.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"Protect Convoy",_destino],_posdestino,false,0,true,"run",true] call BIS_fnc_taskCreate;
//_tsk1 = ["CONVOY1",[_lado],[format ["A convoy from %1 to %4, it's about to depart at %2:%3. Protect it from any possible attack.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"Protect Convoy",_destino],_posdestino,_taskState1,5,true,true,"run"] call BIS_fnc_setTask;
sleep (_tiempolim * 60);

_indice = aeropuertos find _base;
_spawnPoint = spawnPoints select _indice;
_pos = getMarkerPos _spawnPoint;

_grupo = createGroup _lado;
_grupos pushBack _grupo;
_tipoVeh = if (_lado == malos) then {if (!_esFIA) then {selectRandom vehNATOLightArmed} else {vehPoliceCar}} else {selectRandom vehCSATLightArmed};
_timeOut = 0;
_pos = _pos findEmptyPosition [0,100,_tipoveh];
while {_timeOut < 60} do
	{
	if (count _pos > 0) exitWith {};
	_timeOut = _timeOut + 1;
	_pos = _pos findEmptyPosition [0,100,_tipoveh];
	sleep 1;
	};
if (count _pos == 0) then {_pos = getMarkerPos _spawnPoint};
_vehicle=[_pos,markerDir _spawnPoint,_tipoVeh, _grupo] call bis_fnc_spawnvehicle;
_vehLead = _vehicle select 0;
_vehLead allowDamage false;
[_vehLead,"Convoy Lead"] spawn inmuneConvoy;
//_vehLead forceFollowRoad true;
_vehCrew = _vehicle select 1;
{[_x] call NATOinit;_x allowDamage false} forEach _vehCrew;
//_grupoVeh = _vehicle select 2;
_soldados = _soldados + _vehCrew;
//_grupos pushBack _grupoVeh;
_vehiculos pushBack _vehLead;
[_vehLead] call AIVEHinit;
if ((_base == "airport") or (_base == "airport_2")) then {[_base,_posDestino,_grupo] call WPCreate};
_wp0 = _grupo addWaypoint [_posdestino, count waypoints _grupo];
_wp0 = (waypoints _grupo) select 0;
_wp0 setWaypointType "MOVE";
_wp0 setWaypointBehaviour "SAFE";
_grupo setBehaviour "SAFE";
_wp0 setWaypointFormation "COLUMN";
_vehLead limitSpeed 75;


_cuenta = 1;
if (_dificil) then {_cuenta =3} else {if ([_destino] call isFrontline) then {_cuenta = (round random 2) + 1}};
_vehPool = if (_lado == malos) then {if (!_esFIA) then {vehNATOAttack} else {[vehFIAArmedCar,vehFIATruck,vehFIACar]}} else {vehCSATAttack};
if (!_esFIA) then
	{
	_rnd = random 100;
	if (_lado == malos) then
		{
		if (_rnd > prestigeNATO) then
			{
			_vehPool = _vehPool - [vehNATOTank];
			};
		}
	else
		{
		if (_rnd > prestigeCSAT) then
			{
			_vehPool = _vehPool - [vehCSATTank];
			};
		};
	if (count _vehPool == 0) then {if (_lado == malos) then {_vehPool = vehNATOTrucks} else {_vehPool = vehCSATTrucks}};
	};
for "_i" from 1 to _cuenta do
	{
	sleep 5;
	//_grupo = createGroup _lado;
	//_grupos pushBack _grupo;
	_tipoVehEsc = selectRandom _vehPool;
	if (not([_tipoVehEsc] call vehAvailable)) then
		{
		_tipoVeh = if (_lado == malos) then {selectRandom vehNATOTrucks} else {selectRandom vehCSATTrucks};
		_vehPool = _vehPool - [_tipoVeh];
		if (count _vehPool == 0) then {if (_lado == malos) then {_vehPool = vehNATOTrucks} else {_vehPool = vehCSATTrucks}};
		};
	_timeOut = 0;
	_pos = _pos findEmptyPosition [0,100,_tipoveh];
	while {_timeOut < 60} do
		{
		if (count _pos > 0) exitWith {};
		_timeOut = _timeOut + 1;
		_pos = _pos findEmptyPosition [0,100,_tipoveh];
		sleep 1;
		};
	if (count _pos == 0) then {_pos = getMarkerPos _spawnPoint};
	_vehicle=[_pos, markerDir _spawnPoint,_tipoVehEsc, _grupo] call bis_fnc_spawnvehicle;
	_veh = _vehicle select 0;
	_veh allowDamage false;
	[_veh,"Convoy Escort"] spawn inmuneConvoy;
	_vehCrew = _vehicle select 1;
	{[_x] call NATOinit;_x allowDamage false} forEach _vehCrew;
	_soldados = _soldados + _vehCrew;
	_vehiculos pushBack _veh;
	[_veh] call AIVEHinit;
	/*
	if ((_base == "airport") or (_base == "airport_2")) then {[_base,_posDestino,_grupo] call WPCreate};
	_wp0 = _grupo addWaypoint [_posdestino, count waypoints _grupo];
	_wp0 = (waypoints _grupo) select 0;
	_wp0 setWaypointType "MOVE";
	_wp0 setWaypointBehaviour "SAFE";
	_grupo setBehaviour "SAFE";
	_wp0 setWaypointFormation "COLUMN";
	_veh limitSpeed 50;
	*/
	if (_i == 1) then {_veh setConvoySeparation 60} else {_veh setConvoySeparation 20};
	if (!_esFIA) then
		{
		if (not(_tipoVehEsc in vehTanks)) then
			{
			_tipogrupo = [_tipoVehEsc,_lado] call cargoSeats;
			_grupoEsc = [_posbase,_lado, _tipogrupo] call spawnGroup;
			{[_x] call NATOinit;_x assignAsCargo _veh;_x moveInCargo _veh; _soldados pushBack _x;[_x] joinSilent _grupo} forEach units _grupoEsc;
			deleteGroup _grupoEsc;
			};
		}
	else
		{
		if (not(_tipoVehEsc == vehFIAArmedCar)) then
			{
			_tipoGrupo = FIASquad;
			if (_tipoVehEsc == vehFIACar) then
				{
				_tipoGrupo = selectRandom gruposFIAMid;
				};
			_grupoEsc = [_posbase,_lado, _tipogrupo] call spawnGroup;
			{[_x] call NATOinit;_x assignAsCargo _veh;_x moveInCargo _veh; _soldados pushBack _x;[_x] joinSilent _grupo} forEach units _grupoEsc;
			deleteGroup _grupoEsc;
			};
		};
	};

sleep 5;

_timeOut = 0;
_pos = _pos findEmptyPosition [0,100,_tipoveh];
while {_timeOut < 60} do
	{
	if (count _pos > 0) exitWith {};
	_timeOut = _timeOut + 1;
	_pos = _pos findEmptyPosition [0,100,_tipoveh];
	sleep 1;
	};
if (count _pos == 0) then {_pos = getMarkerPos _spawnPoint};
//_grupo = createGroup _lado;
//_grupos pushBack _grupo;
_vehicle=[_pos, markerDir _spawnPoint,_tipoVehObj, _grupo] call bis_fnc_spawnvehicle;
_vehObj = _vehicle select 0;
_vehObj allowDamage false;
if (_dificil) then {[_vehObj," Convoy Objective"] spawn inmuneConvoy} else {[_vehObj,"Convoy Objective"] spawn inmuneConvoy};
_vehCrew = _vehicle select 1;
{[_x] call NATOinit; _x allowDamage false} forEach _vehCrew;
//_grupoVeh = _vehicle select 2;
_soldados = _soldados + _vehCrew;
//_grupos pushBack _grupoVeh;
_vehiculos pushBack _vehObj;
[_vehObj] call AIVEHinit;
/*
if ((_base == "airport") or (_base == "airport_2")) then {[_base,_posDestino,_grupo] call WPCreate};
_wp0 = _grupo addWaypoint [_posdestino, count waypoints _grupo];
_wp0 = (waypoints _grupo) select 0;
_wp0 setWaypointType "MOVE";
_wp0 setWaypointBehaviour "SAFE";
_grupo setBehaviour "SAFE";
_wp0 setWaypointFormation "COLUMN";
_vehObj limitSpeed 50;
*/
_vehObj setConvoySeparation 50;
if (_tipoConvoy == "Armor") then {_vehObj lock 3};// else {_vehObj forceFollowRoad true};
if (_tipoConvoy == "Prisoners") then
	{
	_grpPOW = createGroup buenos;
	_grupos pushBack _grpPOW;
	for "_i" from 1 to (1+ round (random 11)) do
		{
		_unit = _grpPOW createUnit [SDKUnarmed, _posbase, [], 0, "NONE"];
		[_unit,true] remoteExec ["setCaptive"];
		_unit disableAI "MOVE";
		_unit setBehaviour "CARELESS";
		_unit allowFleeing 0;
		_unit assignAsCargo _vehObj;
		_unit moveInCargo [_vehObj, _i + 3];
		removeAllWeapons _unit;
		removeAllAssignedItems _unit;
		[_unit,"refugiado"] remoteExec ["flagaction",[buenos,civilian],_unit];
		_POWS pushBack _unit;
		[_unit] call reDress;
		};
	};
if (_tipoConvoy == "Refuerzos") then
	{
	_tipogrupo = [_tipoVehObj,_lado] call cargoSeats;
	_grupoEsc = [_posbase,_lado,_tipogrupo] call spawnGroup;
	{[_x] call NATOinit;_x assignAsCargo _veh;_x moveInCargo _veh; _soldados pushBack _x;[_x] joinSilent _grupo;_refuerzos pushBack _x} forEach units _grupoEsc;
	deleteGroup _grupoEsc;
	};
if ((_tipoConvoy == "Money") or (_tipoConvoy == "Supplies")) then {reportedVehs pushBack _vehObj; publicVariable "reportedVehs"};

sleep 5;
_tipoVehEsc = selectRandom _vehPool;
if (not([_tipoVehEsc] call vehAvailable)) then
	{
	_tipoVeh = if (_lado == malos) then {selectRandom vehNATOTrucks} else {selectRandom vehCSATTrucks};
	_vehPool = _vehPool - [_tipoVeh];
	if (count _vehPool == 0) then {if (_lado == malos) then {_vehPool = vehNATOTrucks} else {_vehPool = vehCSATTrucks}};
	};
_timeOut = 0;
_pos = _pos findEmptyPosition [0,100,_tipoveh];
while {_timeOut < 60} do
	{
	if (count _pos > 0) exitWith {};
	_timeOut = _timeOut + 1;
	_pos = _pos findEmptyPosition [0,100,_tipoveh];
	sleep 1;
	};
if (count _pos == 0) then {_pos = getMarkerPos _spawnPoint};
//_grupo = createGroup _lado;
//_grupos pushBack _grupo;
_vehicle=[_pos,markerDir _spawnPoint,_tipoVehEsc, _grupo] call bis_fnc_spawnvehicle;
_veh = _vehicle select 0;
_veh allowDamage false;
[_veh,"Convoy Escort"] spawn inmuneConvoy;
_vehCrew = _vehicle select 1;
{[_x] call NATOinit; _x allowDamage false} forEach _vehCrew;
_soldados = _soldados + _vehCrew;
_vehiculos pushBack _veh;
[_veh] call AIVEHinit;
/*
if ((_base == "airport") or (_base == "airport_2")) then {[_base,_posDestino,_grupo] call WPCreate};
_wp0 = _grupo addWaypoint [_posdestino, count waypoints _grupo];
_wp0 = (waypoints _grupo) select 0;
_wp0 setWaypointType "MOVE";
_wp0 setWaypointBehaviour "SAFE";
_grupo setBehaviour "SAFE";
_wp0 setWaypointFormation "COLUMN";
_veh limitSpeed 50;
*/
_veh setConvoySeparation 20;
if (!_esFIA) then
	{
	if (not(_tipoVehEsc in vehTanks)) then
		{
		_tipogrupo = [_tipoVehEsc,_lado] call cargoSeats;
		_grupoEsc = [_posbase,_lado, _tipogrupo] call spawnGroup;
		{[_x] call NATOinit;_x assignAsCargo _veh;_x moveInCargo _veh; _soldados pushBack _x;[_x] joinSilent _grupo} forEach units _grupoEsc;
		deleteGroup _grupoEsc;
		};
	}
else
	{
	if (not(_tipoVehEsc == vehFIAArmedCar)) then
		{
		_tipoGrupo = FIASquad;
		if (_tipoVehEsc == vehFIACar) then
			{
			_tipoGrupo = selectRandom gruposFIAMid;
			};
		_grupoEsc = [_posbase,_lado,_tipogrupo] call spawnGroup;
		{[_x] call NATOinit;_x assignAsCargo _veh;_x moveInCargo _veh; _soldados pushBack _x;[_x] joinSilent _grupo} forEach units _grupoEsc;
		deleteGroup _grupoEsc;
		};
	};
/*
_grupoLead = _grupos select 0;
_cuentaWP = 4;
for "_i" from 0 to (count (waypoints _grupoLead) - 1) do
	{
	_wp1 = waypoints _grupoLead select _i;
	_arrWp = [];
	{
	//_arrWp pushBack (waypoints _x select _i);
	_arrWP pushBack [_x,_i];
	[_x,_i] setWaypointCompletionRadius _cuentaWP;
	} forEach (_grupos - [_grupoLead]);
	_wp1 synchronizeWaypoint _arrWP;
	_cuentaWp = _cuentaWP + 5;
	};*/
sleep 30;
{_x allowDamage true} forEach _vehiculos;
{_x allowDamage true; if (vehicle _x == _x) then {deleteVehicle _x}} forEach _soldados;
/*
[_vehObj,_vehiculos,_posDestino] spawn
	{
	private ["_vehObj","_vehiculos","_posDestino","_condu","_veh","_grupo","_wp0"];
	_vehObj = _this select 0;
	_vehiculos = _this select 1;
	_vehiculos = _vehiculos - [_vehObj];
	_posDestino = _this select 2;
	_condu = driver _vehObj;
	_salta = false;
	while {(alive _vehObj)} do
		{
		if (((!alive _condu) or (behaviour _condu == "COMBAT")) and !_salta) then
			{
			_salta = true;
			for "_i" from 0 to (count _vehiculos) - 1 do
				{
				_veh = _vehiculos select _i;
				_grupo = group (driver _veh);
				 while {(count (waypoints _grupo)) > 0} do
					 {
					 deleteWaypoint ((waypoints _grupo) select 0);
					 };
				_wp0 = _grupo addWaypoint [position _vehObj, 0];
				_wp0 setWaypointType "MOVE";
				_wp0 setWaypointBehaviour "AWARE";
				_grupo setBehaviour "AWARE";
				_veh limitSpeed 150;
				};
			};
		if (_salta) then
			{
			if ((alive _condu) and (vehicle _condu == _vehObj) and (behaviour _condu != "COMBAT")) then
				{
				_salta = false;
				for "_i" from 0 to (count _vehiculos) - 1 do
					{
					_veh = _vehiculos select _i;
					_grupo = group (driver _veh);
					 while {(count (waypoints _grupo)) > 0} do
						 {
						 deleteWaypoint ((waypoints _grupo) select 0);
						 };
					_wp0 = _grupo addWaypoint [_posDestino, 0];
					_wp0 setWaypointType "MOVE";
					_wp0 setWaypointBehaviour "SAFE";
					_grupo setBehaviour "SAFE";
					_veh limitSpeed 50;
					};
				};
			};
		sleep 5;
		};
	};
*/
_bonus = if (_dificil) then {2} else {1};

if (_tipoConvoy == "Municion") then
	{
	waitUntil {sleep 1; (dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 300) or (not alive _vehObj) or (driver _vehObj getVariable ["GREENFORSpawn",false])};
	if ((_vehObj distance _posdestino < 100) or (dateToNumber date >_fechafinNum)) then
		{
		_taskState = "FAILED";
		_taskState1 = "SUCCEEDED";
		[-1200*_bonus] remoteExec ["timingCA",2];
		[-10*_bonus,stavros] call playerScoreAdd;
		clearMagazineCargoGlobal _vehObj;
		clearWeaponCargoGlobal _vehObj;
		clearItemCargoGlobal _vehObj;
		clearBackpackCargoGlobal _vehObj;
		}
	else
		{
		_taskState = "SUCCEEDED";
		_taskState1 = "FAILED";
		[0,300*_bonus] remoteExec ["resourcesFIA",2];
		[1800*_bonus] remoteExec ["timingCA",2];
		{if (isPlayer _x) then {[10*_bonus,_x] call playerScoreAdd}} forEach ([500,0,_vehObj,"GREENFORSpawn"] call distanceUnits);
		[5*_bonus,stavros] call playerScoreAdd;
		[getPosASL _vehObj,_lado] spawn patrolCA;
		if (_lado == malos) then {[3,0] remoteExec ["prestige",2]} else {[0,3] remoteExec ["prestige",2]};
		if (!alive _vehObj) then
			{
			_killZones = killZones getVariable [_base,[]];
			_killZones = _killZones + [_destino,_destino];
			killZones setVariable [_base,_killZones,true];
			};
		};
	};

if (_tipoConvoy == "Armor") then
	{
	waitUntil {sleep 1; (dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 300) or (not alive _vehObj) or (driver _vehObj getVariable ["GREENFORSpawn",false])};
	if ((_vehObj distance _posdestino < 100) or (dateToNumber date > _fechafinNum)) then
		{
		_taskState = "FAILED";
		_taskState1 = "SUCCEEDED";
		server setVariable [_destino,dateToNumber date,true];
		[-1200*_bonus] remoteExec ["timingCA",2];
		[-10*_bonus,stavros] call playerScoreAdd;
		}
	else
		{
		_taskState = "SUCCEEDED";
		_taskState1 = "FAILED";
		[5,0] remoteExec ["prestige",2];
		[0,5*_bonus,_posdestino] remoteExec ["citySupportChange",2];
		[1800*_bonus] remoteExec ["timingCA",2];
		{if (isPlayer _x) then {[10*_bonus,_x] call playerScoreAdd}} forEach ([500,0,_vehObj,"GREENFORSpawn"] call distanceUnits);
		[5*_bonus,stavros] call playerScoreAdd;
		[getPosASL _vehObj,_lado] spawn patrolCA;
		if (_lado == malos) then {[3,0] remoteExec ["prestige",2]} else {[0,3] remoteExec ["prestige",2]};
		if (!alive _vehObj) then
			{
			_killZones = killZones getVariable [_base,[]];
			_killZones = _killZones + [_destino,_destino];
			killZones setVariable [_base,_killZones,true];
			};
		};
	};

if (_tipoConvoy == "Prisoners") then
	{
	waitUntil {sleep 1; (dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 300) or (not alive driver _vehObj) or (driver _vehObj getVariable ["GREENFORSpawn",false]) or ({alive _x} count _POWs == 0)};
	if ((_vehObj distance _posdestino < 100) or ({alive _x} count _POWs == 0) or (dateToNumber date > _fechafinNum)) then
		{
		_taskState = "FAILED";
		_taskState1 = "SUCCEEDED";
		{[_x,false] remoteExec ["setCaptive"]} forEach _POWs;
		//_cuenta = 2 * (count _POWs);
		//[_cuenta,0] remoteExec ["prestige",2];
		[-10*_bonus,stavros] call playerScoreAdd;
		};
	if ((not alive driver _vehObj) or (driver _vehObj getVariable ["GREENFORSpawn",false])) then
		{
		[getPosASL _vehObj,_lado] spawn patrolCA;
		{[_x,false] remoteExec ["setCaptive"]; _x enableAI "MOVE"; [_x] orderGetin false;} forEach _POWs;
		waitUntil {sleep 2; ({alive _x} count _POWs == 0) or ({(alive _x) and (_x distance _posHQ < 50)} count _POWs > 0) or (dateToNumber date > _fechafinNum)};
		if (({alive _x} count _POWs == 0) or (dateToNumber date > _fechafinNum)) then
			{
			_taskState = "FAILED";
			_taskState1 = "FAILED";
			_cuenta = 2 * (count _POWs);
			//[0,- _cuenta, _posdestino] remoteExec ["citySupportChange",2];
			[-10*_bonus,stavros] call playerScoreAdd;
			_killZones = killZones getVariable [_base,[]];
			_killZones = _killZones + [_destino,_destino];
			killZones setVariable [_base,_killZones,true];
			}
		else
			{
			_taskState = "SUCCEEDED";
			_taskState1 = "FAILED";
			_cuenta = {(alive _x) and (_x distance _posHQ < 150)} count _POWs;
			_hr = _cuenta;
			_resourcesFIA = 300 * _cuenta;
			[_hr,_resourcesFIA*_bonus] remoteExec ["resourcesFIA",2];
			[0,10*_bonus,_posbase] remoteExec ["citySupportChange",2];
			if (_lado == malos) then {[3,0] remoteExec ["prestige",2]} else {[-2*_cuenta,3] remoteExec ["prestige",2]};
			{[_x] join _grppow; [_x] orderGetin false} forEach _POWs;
			{[_cuenta,_x] call playerScoreAdd} forEach (allPlayers - (entities "HeadlessClient_F"));
			[(round (_cuenta/2))*_bonus,stavros] call playerScoreAdd;
			};
		};
	};

if (_tipoConvoy == "Refuerzos") then
	{
	waitUntil {sleep 1; (dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 300) or ({(!alive _x) or (captive _x)} count _refuerzos == count _refuerzos)};
	if ({(!alive _x) or (captive _x)} count _refuerzos == count _refuerzos) then
		{
		_taskState = "SUCCEEDED";
		_taskState1 = "FAILED";
		[0,10*_bonus,_posbase] remoteExec ["citySupportChange",2];
		if (_lado == malos) then {[3,0] remoteExec ["prestige",2]} else {[0,3] remoteExec ["prestige",2]};
		{if (_x distance _vehObj < 500) then {[10*_bonus,_x] call playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
		[5*_bonus,stavros] call playerScoreAdd;
		_killZones = killZones getVariable [_base,[]];
		_killZones = _killZones + [_destino,_destino];
		killZones setVariable [_base,_killZones,true];
		}
	else
		{
		_taskState = "FAILED";
		_cuenta = {alive _x} count _refuerzos;
		if (_cuenta > 8) then {_taskState1 = "SUCCEEDED"} else {_taskState = "FAILED"};
		[-10*_bonus,stavros] call playerScoreAdd;
		if (lados getVariable [_destino,sideUnknown] != buenos) then
			{
			_tipos = [];
			{_tipos pushBack (typeOf _x)} forEach (_refuerzos select {alive _x});
			[_soldados,_lado,_destino,0] spawn garrisonUpdate;
			//_garrison = garrison getVariable [_destino,0];
			//garrison setVariable [_destino,_garrison - _cuenta,true];
			};
		if (_lado == malos) then {[(-1*(0.25*_cuenta)),0] remoteExec ["prestige",2]} else {[0,(-1*(0.25*_cuenta))] remoteExec ["prestige",2]};
		};
	};

if (_tipoConvoy == "Money") then
	{
	waitUntil {sleep 1; (dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 300) or (not alive _vehObj) or (driver _vehObj getVariable ["GREENFORSpawn",false])};
	if ((dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 100) or (not alive _vehObj)) then
		{
		_taskState = "FAILED";
		if ((dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 100)) then
			{
			[-1200*_bonus] remoteExec ["timingCA",2];
			[-10*_bonus,stavros] call playerScoreAdd;
			_taskState1 = "SUCCEEDED";
			}
		else
			{
			[getPosASL _vehObj,_lado] spawn patrolCA;
			[1200*_bonus] remoteExec ["timingCA",2];
			_taskState1 = "FAILED";
			_killZones = killZones getVariable [_base,[]];
			_killZones = _killZones + [_destino,_destino];
			killZones setVariable [_base,_killZones,true];
			};
		};
	if (driver _vehObj getVariable ["GREENFORSpawn",false]) then
		{
		[getPosASL _vehObj,_lado] spawn patrolCA;
		waitUntil {sleep 2; (_vehObj distance _posHQ < 50) or (not alive _vehObj) or (dateToNumber date > _fechafinNum)};
		if ((not alive _vehObj) or (dateToNumber date > _fechafinNum)) then
			{
			_taskState = "FAILED";
			_taskState1 = "FAILED";
			[1200*_bonus] remoteExec ["timingCA",2];
			};
		if (_vehObj distance _posHQ < 50) then
			{
			_taskState = "SUCCEEDED";
			_taskState1 = "FAILED";
			[10*_bonus,-20*_bonus,_posdestino] remoteExec ["citySupportChange",2];
			[3,0] remoteExec ["prestige",2];
			[0,5000*_bonus] remoteExec ["resourcesFIA",2];
			[-120*_bonus] remoteExec ["timingCA",2];
			{if (_x distance _vehObj < 500) then {[10*_bonus,_x] call playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
			[5*_bonus,stavros] call playerScoreAdd;
			waitUntil {sleep 1; speed _vehObj < 1};
			[_vehObj] call vaciar;
			deleteVehicle _vehObj;
			};
		};
	reportedVehs = reportedVehs - [_vehObj];
	publicVariable "reportedVehs";
	};

if (_tipoConvoy == "Supplies") then
	{
	waitUntil {sleep 1; (dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 300) or (not alive _vehObj) or (driver _vehObj getVariable ["GREENFORSpawn",false])};
	if (not alive _vehObj) then
		{
		[getPosASL _vehObj,_lado] spawn patrolCA;
		_taskState = "FAILED";
		_taskState1 = "FAILED";
		[3,0] remoteExec ["prestige",2];
		[-10*_bonus,stavros] call playerScoreAdd;
		_killZones = killZones getVariable [_base,[]];
		_killZones = _killZones + [_destino,_destino];
		killZones setVariable [_base,_killZones,true];
		};
	if ((dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 300) or (driver _vehObj getVariable ["GREENFORSpawn",false])) then
		{
		if (driver _vehObj getVariable ["GREENFORSpawn",false]) then
			{
			[getPosASL _vehObj,_lado] spawn patrolCA;
			waitUntil {sleep 1; (_vehObj distance _posdestino < 100) or (not alive _vehObj) or (dateToNumber date > _fechafinNum)};
			if (_vehObj distance _posdestino < 100) then
				{
				_taskState = "SUCCEEDED";
				_taskState1 = "FAILED";
				[0,15*_bonus,_destino] remoteExec ["citySupportChange",2];
				{if (_x distance _vehObj < 500) then {[10*_bonus,_x] call playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
				[5*_bonus,stavros] call playerScoreAdd;
				}
			else
				{
				_taskState = "FAILED";
				_taskState1 = "FAILED";
				[5*_bonus,-10*_bonus,_destino] remoteExec ["citySupportChange",2];
				[3,0] remoteExec ["prestige",2];
				[-10*_bonus,stavros] call playerScoreAdd;
				};
			}
		else
			{
			_taskState = "FAILED";
			_taskState1 = "SUCCEEDED";
			[-3,0] remoteExec ["prestige",2];
			[15*_bonus,0,_destino] remoteExec ["citySupportChange",2];
			[-10*_bonus,stavros] call playerScoreAdd;
			};
		};
	reportedVehs = reportedVehs - [_vehObj];
	publicVariable "reportedVehs";
	};

["CONVOY",[_texto,_taskTitle,_destino],_posdestino,_taskState] call taskUpdate;
["CONVOY1",[format ["A convoy from %1 to %4, it's about to depart at %2:%3. Protect it from any possible attack.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"Protect Convoy",_destino],_posdestino,_taskState1] call taskUpdate;
_wp0 = _grupo addWaypoint [_posbase, 0];
_wp0 setWaypointType "MOVE";
_wp0 setWaypointBehaviour "SAFE";
_wp0 setWaypointSpeed "LIMITED";
_wp0 setWaypointFormation "COLUMN";

if (_tipoConvoy == "Prisoners") then
	{
	{
	deleteVehicle _x;
	} forEach _POWs;
	};

_nul = [600,"CONVOY"] spawn borrarTask;
_nul = [0,"CONVOY1"] spawn borrarTask;
{
if (!([distanciaSPWN,1,_x,"GREENFORSpawn"] call distanceUnits)) then {deleteVehicle _x}
} forEach _vehiculos;
{
if (!([distanciaSPWN,1,_x,"GREENFORSpawn"] call distanceUnits)) then {deleteVehicle _x; _soldados = _soldados - [_x]}
} forEach _soldados;

if (count _soldados > 0) then
	{
	{
	waitUntil {sleep 1; (!([distanciaSPWN,1,_x,"GREENFORSpawn"] call distanceUnits))};
	deleteVehicle _x;
	} forEach _soldados;
	};
{deleteGroup _x} forEach _grupos;




