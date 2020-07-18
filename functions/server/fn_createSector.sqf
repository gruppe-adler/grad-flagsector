#include "..\..\component.hpp"

if (!isServer) exitWith {};

params ["_logic",["_sectorName","UNKNOWN SECTOR"],["_pointsForCapture",1],["_pointsPerSecond",0],["_lockAfterCapture",false],["_captureSides",[WEST,EAST,INDEPENDENT]],["_owner",sideUnknown],["_notifyTakingControl",false],["_onSectorCaptured",{}],["_sectorData",""],["_captureMode",[0]]];

if (!(_logic isKindOf "LocationArea_F") && {!(_logic isKindOf "Logic")}) exitWith {ERROR_1("%1 is not an area or game logic.",_logic)};

if (isNil "grad_flagsector_sectorTriggers") then {grad_flagsector_sectorTriggers = []};

{
    [_x,_sectorName,_pointsForCapture,_pointsPerSecond,_lockAfterCapture,_captureSides,_owner,_notifyTakingControl,_onSectorCaptured,_sectorData,_captureMode] call grad_flagsector_fnc_initTrigger;
    private _isFlagSector = _captureMode == 2;

    [_x, _isFlagSector] call grad_flagsector_fnc_createMarker;
    [_x] call grad_flagsector_fnc_createTasks;
    if (_isFlagSector) then {
      [_x, _owner] call grad_flagsector_fnc_flagCreate;
    };
    [{!isNull (_this select 0)}, {[_this select 0] call grad_flagsector_fnc_startPFH}, [_x]] call CBA_fnc_waitUntilAndExecute;

    grad_flagsector_sectorTriggers pushBack _x;
} foreach (_logic call bis_fnc_moduleTriggers);

INFO_1("Sector %1 initialized.",_sectorName);
