#include "..\component.hpp"

private _cfg = missionConfigFile >> "cfgSector";

_flagTextureBlufor = [_cfg,"flagTextureBlufor",0] call BIS_fnc_returnConfigEntry;
_flagTextureOpfor = [_cfg,"flagTextureOpfor",0] call BIS_fnc_returnConfigEntry;
_flagTextureIndependent = [_cfg,"flagTextureIndependent",0] call BIS_fnc_returnConfigEntry;
_flagTextureCivilian = [_cfg,"flagTextureCivilian",0] call BIS_fnc_returnConfigEntry;

missionNamespace setVariable [QGVAR(flagTextureBlufor), _flagTextureBlufor];
missionNamespace setVariable [QGVAR(flagTextureOpfor), _flagTextureOpfor];
missionNamespace setVariable [QGVAR(flagTextureIndependent), _flagTextureIndependent];
missionNamespace setVariable [QGVAR(flagTextureCivilian), _flagTextureCivilian];
